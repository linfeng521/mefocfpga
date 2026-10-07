`timescale 1ns / 1ps

// Standalone INA240 + AD7928 test. No PWM outputs are present. VIO probe0/1
// show the full 12-bit raw codes so the INA240 zero point can be checked near
// 2048 before any motor-control bitstream is used.
module zynq7020_current_test_top #(
    parameter integer CLK_HZ              = 50_000_000,
    parameter integer SPI_DIV             = 3,
    parameter integer SAMPLE_CYCLES       = 1000,
    parameter integer CAL_SAMPLES         = 1024,
    parameter integer POR_CYCLES          = 256,
    parameter integer SIMULATION          = 0
)(
    input  wire clk_in,
    output wire ad7928_cs_n,
    output wire ad7928_sclk,
    output wire ad7928_din,
    input  wire ad7928_dout
);
    localparam integer CAL_COUNT_W = (CAL_SAMPLES <= 2) ? 1 : $clog2(CAL_SAMPLES);
    reg [31:0] por_count = 0;
    wire rst_n = (por_count >= POR_CYCLES - 1);
    always @(posedge clk_in) begin
        if (!rst_n)
            por_count <= por_count + 1'b1;
    end

    reg [31:0] sample_count;
    reg sample_req;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            sample_count <= 0;
            sample_req <= 0;
        end else begin
            sample_req <= 0;
            if (sample_count >= SAMPLE_CYCLES - 1) begin
                sample_count <= 0;
                sample_req <= 1;
            end else begin
                sample_count <= sample_count + 1'b1;
            end
        end
    end

    wire [11:0] adc_code_a;
    wire [11:0] adc_code_b;
    wire pair_valid;
    wire adc_initialized;
    ad7928_dual_reader #(.CLK_DIV(SPI_DIV)) u_reader (
        .clk(clk_in), .rst_n(rst_n), .sample_req(sample_req),
        .adc_cs_n(ad7928_cs_n), .adc_sclk(ad7928_sclk),
        .adc_din(ad7928_din), .adc_dout(ad7928_dout),
        .ch0_data(adc_code_a), .ch1_data(adc_code_b),
        .pair_valid(pair_valid), .initialized(adc_initialized)
    );

    reg [30:0] sum_a;
    reg [30:0] sum_b;
    reg [11:0] offset_a;
    reg [11:0] offset_b;
    reg [CAL_COUNT_W-1:0] cal_count;
    reg calibration_done;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            sum_a <= 0;
            sum_b <= 0;
            offset_a <= 12'd2048;
            offset_b <= 12'd2048;
            cal_count <= 0;
            calibration_done <= 0;
        end else if (pair_valid && !calibration_done) begin
            if (cal_count == CAL_SAMPLES - 1) begin
                offset_a <= (sum_a + adc_code_a) / CAL_SAMPLES;
                offset_b <= (sum_b + adc_code_b) / CAL_SAMPLES;
                calibration_done <= 1;
            end else begin
                sum_a <= sum_a + adc_code_a;
                sum_b <= sum_b + adc_code_b;
                cal_count <= cal_count + 1'b1;
            end
        end
    end

    wire signed [12:0] delta_a = $signed({1'b0, adc_code_a}) - $signed({1'b0, offset_a});
    wire signed [12:0] delta_b = $signed({1'b0, adc_code_b}) - $signed({1'b0, offset_b});
    wire signed [16:0] current_a_wide = delta_a <<< 4;
    wire signed [16:0] current_b_wide = delta_b <<< 4;
    function automatic signed [15:0] saturate_current;
        input signed [16:0] value;
        begin
            if (value > 17'sd32767) saturate_current = 16'sh7fff;
            else if (value < -17'sd32768) saturate_current = 16'sh8000;
            else saturate_current = value[15:0];
        end
    endfunction
    wire signed [15:0] current_a = saturate_current(current_a_wide);
    wire signed [15:0] current_b = saturate_current(current_b_wide);

    generate
        if (SIMULATION == 0) begin : g_vio
            vio_7020 u_vio (
                .clk(clk_in),
                .probe_in0({4'd0, adc_code_a}),
                .probe_in1({4'd0, adc_code_b}),
                .probe_in2(current_a),
                .probe_in3(pair_valid),
                .probe_in4(calibration_done),
                .probe_out0(), .probe_out1(), .probe_out2(), .probe_out3(),
                .probe_out4(), .probe_out5(), .probe_out6(), .probe_out7(),
                .probe_out8(), .probe_out9(), .probe_out10(), .probe_out11(),
                .probe_out12(), .probe_out13(), .probe_out14(), .probe_out15(),
                .probe_out16(), .probe_out17(), .probe_out18(), .probe_out19()
            );
        end
    endgenerate
endmodule
