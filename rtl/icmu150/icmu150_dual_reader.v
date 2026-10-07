`timescale 1ns / 1ps

// iC-MU150 SDAD reader. Each frame is {0xA6 command, DATA_BITS response}.
// Both encoders share SCLK/MOSI and are sampled sequentially with a gap.
module icmu150_dual_reader #(
    parameter integer CLK_DIV = 3,
    parameter integer SAMPLE_CYCLES = 2500,
    parameter integer DATA_BITS = 24,
    parameter integer POSITION_BITS = 18
)(
    input wire clk, input wire rst_n,
    output reg spi_cs1_n, output reg spi_cs2_n,
    output reg spi_sclk, output reg spi_mosi, input wire spi_miso,
    output reg [POSITION_BITS-1:0] position1,
    output reg [POSITION_BITS-1:0] position2,
    output reg position1_valid, output reg position2_valid,
    output reg frame1_error, output reg frame2_error
);
    localparam integer TOTAL_BITS = 8 + DATA_BITS;
    localparam S_WAIT = 0, S_HIGH = 1, S_LOW = 2, S_FINISH = 3, S_GAP = 4;
    reg [2:0] state; reg active_device;
    reg [31:0] sample_count; reg [15:0] div_count; reg [7:0] bit_count;
    reg [TOTAL_BITS-1:0] tx_shift, rx_shift;
    wire [TOTAL_BITS-1:0] command_word = {8'hA6, {DATA_BITS{1'b0}}};

    task automatic start_device;
        input device;
        begin
            active_device <= device; spi_cs1_n <= device; spi_cs2_n <= ~device;
            spi_sclk <= 0; spi_mosi <= command_word[TOTAL_BITS-1];
            tx_shift <= command_word; rx_shift <= 0; bit_count <= 0; div_count <= 0; state <= S_HIGH;
        end
    endtask

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_WAIT; active_device <= 0; sample_count <= 0; div_count <= 0; bit_count <= 0;
            tx_shift <= 0; rx_shift <= 0; spi_cs1_n <= 1; spi_cs2_n <= 1; spi_sclk <= 0; spi_mosi <= 0;
            position1 <= 0; position2 <= 0; position1_valid <= 0; position2_valid <= 0;
            frame1_error <= 0; frame2_error <= 0;
        end else begin
            position1_valid <= 0; position2_valid <= 0;
            case (state)
                S_WAIT: begin
                    spi_cs1_n <= 1; spi_cs2_n <= 1; spi_sclk <= 0;
                    if (sample_count >= ((SAMPLE_CYCLES < 1) ? 0 : SAMPLE_CYCLES - 1)) begin
                        sample_count <= 0; start_device(1'b0);
                    end else sample_count <= sample_count + 1'b1;
                end
                S_HIGH: begin
                    if (div_count >= ((CLK_DIV < 1) ? 0 : CLK_DIV - 1)) begin
                        div_count <= 0; spi_sclk <= 1;
                        rx_shift <= {rx_shift[TOTAL_BITS-2:0], spi_miso}; state <= S_LOW;
                    end else div_count <= div_count + 1'b1;
                end
                S_LOW: begin
                    if (div_count >= ((CLK_DIV < 1) ? 0 : CLK_DIV - 1)) begin
                        div_count <= 0; spi_sclk <= 0;
                        if (bit_count == TOTAL_BITS - 1) begin spi_cs1_n <= 1; spi_cs2_n <= 1; state <= S_FINISH; end
                        else begin bit_count <= bit_count + 1'b1; spi_mosi <= tx_shift[TOTAL_BITS-2-bit_count]; state <= S_HIGH; end
                    end else div_count <= div_count + 1'b1;
                end
                S_FINISH: begin
                    if (!active_device) begin
                        frame1_error <= (rx_shift[TOTAL_BITS-1 -: 8] != 8'hA6);
                        if (rx_shift[TOTAL_BITS-1 -: 8] == 8'hA6) begin position1 <= rx_shift[DATA_BITS-1 -: POSITION_BITS]; position1_valid <= 1; end
                    end else begin
                        frame2_error <= (rx_shift[TOTAL_BITS-1 -: 8] != 8'hA6);
                        if (rx_shift[TOTAL_BITS-1 -: 8] == 8'hA6) begin position2 <= rx_shift[DATA_BITS-1 -: POSITION_BITS]; position2_valid <= 1; end
                    end
                    div_count <= 0; state <= S_GAP;
                end
                S_GAP: begin
                    if (div_count >= ((CLK_DIV * 10 < 1) ? 0 : CLK_DIV * 10 - 1)) begin
                        div_count <= 0; if (!active_device) start_device(1'b1); else state <= S_WAIT;
                    end else div_count <= div_count + 1'b1;
                end
                default: state <= S_WAIT;
            endcase
        end
    end
endmodule
