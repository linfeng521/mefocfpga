`timescale 1ns / 1ps

// =====================================================================
// auto_calibration_core (fixed)
//   A. S_ALIGN: average over 65536 samples (clean >>16 division, no divider)
//   B. S_RECORD: accept both rotation directions
//   C. RAM: write & read both indexed by COMMAND angle (open_loop_angle)
//   D. 32-bit math throughout (prevents zero_offset*POLE_PAIRS overflow)
// =====================================================================
module auto_calibration_core #(
    parameter integer POLE_PAIRS = 21
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start_calib,
    output reg         is_calibrating,
    output reg         calib_done,
    output wire        rotate_en,
    output wire        force_align_zero,

    input  wire [31:0] raw_mech_angle_in,
    input  wire [15:0] open_loop_angle_in,

    output wire [15:0] calib_mech_angle_out,
    output wire [15:0] calib_elec_angle_out,
    output wire [15:0] debug_error_val,
    output wire [15:0] zero_offset_o,      // to ILA
    output wire [15:0] ram_addr_o          // to ILA
);

//    localparam POLE_PAIRS = 32'd21;
    localparam S_IDLE=0, S_PRE_ALIGN=1, S_ALIGN=2, S_RECORD=3, S_FINISH=4;

    // --- Averaging: 65536 samples so division is a clean >>16 ---
    localparam ALIGN_AVG_CNT = 32'd65536;
    reg [31:0] align_sum;        // 16-bit * 65536 = up to 32 bits
    reg [31:0] align_cnt;

    reg [2:0]  state;
    reg [31:0] wait_cnt;
    reg signed [31:0] accumulated_angle;
    reg [15:0] zero_offset, last_angle;

    wire [15:0] cur_angle = raw_mech_angle_in[31:16];

    assign rotate_en = (state == S_RECORD);
    assign force_align_zero = (state == S_PRE_ALIGN);
    assign zero_offset_o = zero_offset;

    // --- RAM addressing by COMMAND angle (open_loop_angle_in) ---
    wire [11:0] ram_addr = open_loop_angle_in[15:4];
    assign ram_addr_o = ram_addr;
    reg          ram_we;
    wire [15:0] ram_do;
    wire [15:0] calculated_error = cur_angle - open_loop_angle_in - zero_offset;
    wire signed [15:0] angle_delta_signed = cur_angle - last_angle;

    // Port A: runtime read by (cur_d2 - zero_offset) i.e. command-equivalent
    // Port B: calibration write by open_loop_angle_in
    // (declared after cur_d2 below; wire forward-declared via wire stmt)
    wire [15:0] runtime_cmd_angle;
    wire [11:0] runtime_ram_addr = runtime_cmd_angle[15:4];

    blk_mem_gen_0 u_lut_ram (
        .clka(clk), .ena(1'b1), .wea(1'b0),
        .addra(runtime_ram_addr), .dina(16'd0), .douta(ram_do),
        .clkb(clk), .enb(1'b1), .web(ram_we), .addrb(ram_addr), .dinb(calculated_error)
    );

    // state machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_IDLE; is_calibrating <= 0; calib_done <= 0;
            ram_we <= 0; accumulated_angle <= 0;
            align_sum <= 0; align_cnt <= 0;
        end else begin
            case (state)
                S_IDLE: if (start_calib) begin
                    state <= S_PRE_ALIGN;
                    is_calibrating <= 1; calib_done <= 0;
                    wait_cnt <= 0;
                    align_sum <= 0; align_cnt <= 0;
                end

                S_PRE_ALIGN: begin
                    if (wait_cnt < 32'd150_000_0000) begin
                        wait_cnt <= wait_cnt + 1;
                    end else begin
                        state <= S_ALIGN;
                        wait_cnt <= 0;
                        last_angle <= cur_angle;
                        align_sum <= 0;
                        align_cnt <= 0;
                    end
                end

                // FIXED A: average 65536 samples, then >>16 to divide
                S_ALIGN: begin
                    if (align_cnt < ALIGN_AVG_CNT) begin
                        align_sum <=align_sum+$signed(cur_angle);
                        align_cnt <= align_cnt + 1;
                    end else begin
                        zero_offset <= align_sum[31:16];  // sum / 65536
                        state <= S_RECORD;
                        accumulated_angle <= 0;
                    end
                end

                S_RECORD: begin
                  ram_we <= 1;
                    // FIXED B: both directions accepted (delta bounded to skip spikes)
                    if (angle_delta_signed > -2000 && angle_delta_signed < 2000) begin
                       accumulated_angle <= accumulated_angle + {{16{angle_delta_signed[15]}}, angle_delta_signed};
                    end

                    last_angle <= cur_angle;

                     if (accumulated_angle >= 32'sd65536 || accumulated_angle <= -32'sd65536) state <= S_FINISH;
                end

                S_FINISH: begin
                    ram_we <= 0; is_calibrating <= 0; calib_done <= 1;
                    if(!start_calib) state <= S_IDLE;
                end

                default: state <= S_IDLE;
            endcase
        end
    end

    // ==========================================
    // 4. Output logic
    // ==========================================
    // Pipeline: cur_angle -> cur_d1 -> cur_d2 (addr presented to BRAM)
    //                        -> cur_d3 -> cur_d4 (aligned with BRAM read data ram_do)
    // BRAM has 1 clock latency (douta registered), so data is valid one cycle
    // after addr. We advance cur_d2 one more stage to cur_d3 so that cur_d3
    // lines up with ram_do.
    reg [15:0] cur_d1, cur_d2, cur_d3;
    always @(posedge clk) begin
        cur_d1 <= cur_angle;
        cur_d2 <= cur_d1;
        cur_d3 <= cur_d2;   // aligned with ram_do (BRAM 1-cycle latency)
    end

    // FIXED C: runtime lookup by command-equivalent angle
    assign runtime_cmd_angle = cur_d2 - zero_offset;

    assign calib_mech_angle_out = cur_d3 - ram_do;

    // --- FIXED D: 32-bit math, all aligned to cur_d3 / ram_do ---
    wire [31:0] raw_elec_angle_32 = cur_d3 * POLE_PAIRS;
    wire signed [15:0] error_signed = ram_do;
    wire signed [31:0] error_elec_32 = error_signed * $signed(POLE_PAIRS);
    wire [31:0] zero_offset_elec_32 = zero_offset * POLE_PAIRS;
    assign calib_elec_angle_out = raw_elec_angle_32[15:0] - zero_offset_elec_32[15:0] - error_elec_32[15:0];

    assign debug_error_val = (state == S_RECORD) ? calculated_error : ram_do;

endmodule
