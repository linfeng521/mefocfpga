`timescale 1ns / 1ps

module position_pid#(
    parameter integer INTEGRAL_VALUE_MAX = 1500,   
    parameter integer INTEGRAL_VALUE_MIN = -1500,  
    parameter integer FEEDBACK_VALUE_MAX = 4500,   
    parameter integer FEEDBACK_VALUE_MIN = 0       
)(
    input                   sys_clk_i       ,
    input                   sys_rst_n_i     ,
    
    input                   position_pid_en_i ,
    output                  position_pid_ack_o,

    input signed[31:0]      P_i             ,
    input signed[31:0]      I_i             ,
    input signed[31:0]      D_i             ,

    input signed[31:0]      desired_value_i ,
    input signed[31:0]      actual_value_i  ,

    output reg signed[31:0] feedback_value_o ,
    output signed[31:0]     error_out   ,

    // Bumpless Transfer: preload integrator on mode switch
    // preload_en is a single-cycle pulse that forces error_sum = preload_val
    input wire              preload_en,
    input wire signed[31:0] preload_val
);

reg[5:0]    cnt;
reg         dealing;

reg signed[31:0]    error;
reg signed[31:0]    error_sum;

reg signed[63:0]    P_fb;
reg signed[63:0]    I_fb;

reg signed[63:0]    feedback_value_d0; 

assign position_pid_ack_o = ( cnt == 'd15 ) ? 1'b1 : 1'b0;

// State machine control
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        dealing <= 1'b0;
    else if( position_pid_ack_o == 1'b1 )
        dealing <= 1'b0;
    else if( position_pid_en_i == 1'b1 )
        dealing <= 1'b1;
end

always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        cnt <= 'd0;
    else if( dealing == 1'b1 )
        cnt <= cnt + 1'b1;
    else
        cnt <= 'd0;
end

// Error calculation
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        error <= 'd0;
    else if( cnt == 'd1 )
        error <= desired_value_i - actual_value_i;
end

assign error_out = error;

// Proportional term
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        P_fb <= 'd0;
    else if( cnt == 'd3 )
        P_fb <= error * P_i;
    else if( cnt == 'd5)
        P_fb <= P_fb >>> 16;
end

// =========================================
// Anti-windup: conditional integration
//   Freeze integrator when output saturated and error pushes same direction
// =========================================
wire output_saturated = (feedback_value_d0 > $signed(FEEDBACK_VALUE_MAX)) ||
                        (feedback_value_d0 < $signed(FEEDBACK_VALUE_MIN));
wire error_same_sign_as_sat = 
    (feedback_value_d0 > $signed(FEEDBACK_VALUE_MAX) && error > 0) ||
    (feedback_value_d0 < $signed(FEEDBACK_VALUE_MIN) && error < 0);

// Integral accumulation with preload (Bumpless Transfer) and anti-windup
// Priority: reset > preload > anti-windup freeze > accumulate > clamp
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        error_sum <= 'd0;
    // Preload: single-cycle pulse forces integrator to preload_val
    // This has highest priority (after reset) so mode switch is bumpless
    else if( preload_en == 1'b1 ) begin
        error_sum <= preload_val;
    end
    else if( cnt == 'd3 ) begin
        // Anti-windup: freeze when saturated and error same direction
        if( output_saturated && error_same_sign_as_sat ) begin
            error_sum <= error_sum;
        end
        else begin
            error_sum <= error_sum + error;
        end
    end
    else if( cnt == 'd5 ) begin
        if( error_sum >= $signed(INTEGRAL_VALUE_MAX) )
            error_sum <= $signed(INTEGRAL_VALUE_MAX);
        else if( error_sum <= $signed(INTEGRAL_VALUE_MIN) )
            error_sum <= $signed(INTEGRAL_VALUE_MIN);
    end
end

// Integral term
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        I_fb <= 'd0;
    else if( cnt == 'd7 )
        I_fb <= error_sum * I_i;
    else if( cnt == 'd9 )
        I_fb <= I_fb >>> 16;
end

// Sum P + I
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        feedback_value_d0 <= 'd0;
    else if( cnt == 'd11 )
        feedback_value_d0 <= P_fb + I_fb; 
end

// Output with clamping (no track bypass)
always@( posedge sys_clk_i or negedge sys_rst_n_i ) begin
    if( sys_rst_n_i == 1'b0 )
        feedback_value_o <= 'd0;
    else if( cnt == 'd13 ) begin
        if( feedback_value_d0 > $signed(FEEDBACK_VALUE_MAX) )
            feedback_value_o <= $signed(FEEDBACK_VALUE_MAX);
        else if( feedback_value_d0 < $signed(FEEDBACK_VALUE_MIN) )
            feedback_value_o <= $signed(FEEDBACK_VALUE_MIN);
        else
            feedback_value_o <= feedback_value_d0[31:0];
    end
end

endmodule
