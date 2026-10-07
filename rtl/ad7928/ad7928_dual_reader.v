`timescale 1ns / 1ps

// AD7928 two-channel SPI reader. A request starts one CH0/CH1 pair after
// initialization. The returned channel tag is checked before pair_valid.
module ad7928_dual_reader #(
    parameter integer CLK_DIV = 3
)(
    input  wire clk,
    input  wire rst_n,
    input  wire sample_req,
    output reg adc_cs_n,
    output reg adc_sclk,
    output reg adc_din,
    input  wire adc_dout,
    output reg [11:0] ch0_data,
    output reg [11:0] ch1_data,
    output reg pair_valid,
    output reg initialized
);
    localparam [15:0] CFG_CH0 = 16'h8310;
    localparam [15:0] CFG_CH1 = 16'h8710;
    localparam S_IDLE = 0, S_HIGH = 1, S_LOW = 2, S_SETUP = 3, S_FINISH = 4;
    reg [2:0] state;
    reg [15:0] tx_shift, rx_shift;
    reg [4:0] bit_count;
    reg [15:0] div_count;
    reg [2:0] init_step;
    reg next_channel;
    reg [1:0] transfers_left;
    reg request_pending;
    reg have_ch0, have_ch1;

    task automatic start_transfer;
        input [15:0] word;
        begin
            tx_shift <= word; rx_shift <= 0; bit_count <= 0; div_count <= 0;
            adc_cs_n <= 0; adc_sclk <= 0; adc_din <= word[15]; state <= S_HIGH;
        end
    endtask

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE; adc_cs_n <= 1; adc_sclk <= 0; adc_din <= 1;
            tx_shift <= 0; rx_shift <= 0; bit_count <= 0; div_count <= 0;
            init_step <= 0; next_channel <= 0; transfers_left <= 0;
            request_pending <= 0; have_ch0 <= 0; have_ch1 <= 0;
            ch0_data <= 0; ch1_data <= 0; pair_valid <= 0; initialized <= 0;
        end else begin
            pair_valid <= 0;
            if (sample_req) request_pending <= 1;
            case (state)
                S_IDLE: begin
                    adc_cs_n <= 1; adc_sclk <= 0;
                    if (!initialized) begin
                        case (init_step)
                            0, 1: start_transfer(16'hFFFF);
                            2: start_transfer(CFG_CH0);
                            3: start_transfer(CFG_CH1);
                            default: start_transfer(CFG_CH0);
                        endcase
                    end else if (transfers_left != 0) begin
                        start_transfer(next_channel ? CFG_CH1 : CFG_CH0);
                        next_channel <= ~next_channel;
                        transfers_left <= transfers_left - 1'b1;
                    end else if (request_pending || sample_req) begin
                        start_transfer(next_channel ? CFG_CH1 : CFG_CH0);
                        next_channel <= ~next_channel; transfers_left <= 1; request_pending <= 0;
                    end
                end
                S_HIGH: begin
                    if (div_count >= ((CLK_DIV < 1) ? 0 : CLK_DIV - 1)) begin
                        div_count <= 0; adc_sclk <= 1;
                        rx_shift <= {rx_shift[14:0], adc_dout}; state <= S_LOW;
                    end else div_count <= div_count + 1'b1;
                end
                S_LOW: begin
                    if (div_count >= ((CLK_DIV < 1) ? 0 : CLK_DIV - 1)) begin
                        div_count <= 0; adc_sclk <= 0;
                        if (bit_count == 15) state <= S_FINISH;
                        else begin bit_count <= bit_count + 1'b1; state <= S_SETUP; end
                    end else div_count <= div_count + 1'b1;
                end
                S_SETUP: begin
                    adc_din <= tx_shift[15-bit_count]; div_count <= 0; state <= S_HIGH;
                end
                S_FINISH: begin
                    adc_cs_n <= 1; state <= S_IDLE;
                    if (!initialized) begin
                        if (init_step == 4) begin
                            initialized <= 1; next_channel <= 1; have_ch0 <= 0; have_ch1 <= 0;
                        end else init_step <= init_step + 1'b1;
                    end else begin
                        case (rx_shift[14:12])
                            3'd0: begin
                                ch0_data <= rx_shift[11:0]; have_ch0 <= 1;
                                if (have_ch1) begin pair_valid <= 1; have_ch0 <= 0; have_ch1 <= 0; end
                            end
                            3'd1: begin
                                ch1_data <= rx_shift[11:0]; have_ch1 <= 1;
                                if (have_ch0) begin pair_valid <= 1; have_ch0 <= 0; have_ch1 <= 0; end
                            end
                            default: begin end
                        endcase
                    end
                end
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
