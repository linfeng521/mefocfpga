`timescale 1ns / 1ps

// Standalone iC-MU150 hardware test. In hardware mode vio_7020
// displays encoder 1, encoder 2, valid activity, and frame error state.
module zynq7020_icmu_test_top #(
    parameter integer CLK_HZ                = 50_000_000,
    parameter integer SPI_DIV               = 3,
    parameter integer SAMPLE_CYCLES         = 2500,
    parameter integer ICMU_DATA_BITS        = 24,
    parameter integer ICMU_POSITION_BITS    = 18,
    parameter integer POR_CYCLES            = 256,
    parameter integer SIMULATION            = 0
)(
    input  wire clk_in,
    output wire icmu_cs1_n,
    output wire icmu_cs2_n,
    output wire icmu_sclk,
    output wire icmu_mosi,
    input  wire icmu_miso
);
    reg [31:0] por_count = 0;
    wire rst_n = (por_count >= POR_CYCLES - 1);
    always @(posedge clk_in) begin
        if (!rst_n)
            por_count <= por_count + 1'b1;
    end

    wire [ICMU_POSITION_BITS-1:0] position1;
    wire [ICMU_POSITION_BITS-1:0] position2;
    wire position1_valid;
    wire position2_valid;
    wire frame1_error;
    wire frame2_error;
    reg position1_seen;
    reg position2_seen;

    icmu150_dual_reader #(
        .CLK_DIV(SPI_DIV),
        .SAMPLE_CYCLES(SAMPLE_CYCLES),
        .DATA_BITS(ICMU_DATA_BITS),
        .POSITION_BITS(ICMU_POSITION_BITS)
    ) u_reader (
        .clk(clk_in), .rst_n(rst_n),
        .spi_cs1_n(icmu_cs1_n), .spi_cs2_n(icmu_cs2_n),
        .spi_sclk(icmu_sclk), .spi_mosi(icmu_mosi), .spi_miso(icmu_miso),
        .position1(position1), .position2(position2),
        .position1_valid(position1_valid), .position2_valid(position2_valid),
        .frame1_error(frame1_error), .frame2_error(frame2_error)
    );

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            position1_seen <= 0;
            position2_seen <= 0;
        end else begin
            if (position1_valid)
                position1_seen <= 1;
            if (position2_valid)
                position2_seen <= 1;
        end
    end

    generate
        if (SIMULATION == 0) begin : g_vio
            vio_7020 u_vio (
                .clk(clk_in),
                .probe_in0(position1[ICMU_POSITION_BITS-1 -: 16]),
                .probe_in1(position2[ICMU_POSITION_BITS-1 -: 16]),
                .probe_in2({12'd0, frame2_error, frame1_error, position2_seen, position1_seen}),
                .probe_in3(position1_valid),
                .probe_in4(position2_valid),
                .probe_out0(), .probe_out1(), .probe_out2(), .probe_out3(),
                .probe_out4(), .probe_out5(), .probe_out6(), .probe_out7(),
                .probe_out8(), .probe_out9(), .probe_out10(), .probe_out11(),
                .probe_out12(), .probe_out13(), .probe_out14(), .probe_out15(),
                .probe_out16(), .probe_out17(), .probe_out18(), .probe_out19()
            );
        end
    endgenerate
endmodule
