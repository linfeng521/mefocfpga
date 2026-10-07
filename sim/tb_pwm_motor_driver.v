`timescale  1ns / 1ps

module tb_pwm_motor_driver;

// pwm_motor_driver Parameters
parameter PERIOD        = 20        ;
parameter SYS_CLK_FREQ  = 50_000_000;
parameter PWM_FREQ      = 50_000    ;
parameter DEADTIME_NS   = 10        ;

// pwm_motor_driver Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   [15:0]  cmp_u                        = 0 ;
reg   [15:0]  cmp_v                        = 0 ;
reg   [15:0]  cmp_w                        = 0 ;

// pwm_motor_driver Outputs
wire  pwm_update_tick                      ;
wire  pwm_u_h                              ;
wire  pwm_u_l                              ;
wire  pwm_v_h                              ;
wire  pwm_v_l                              ;
wire  pwm_w_h                              ;
wire  pwm_w_l                              ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    #(PERIOD*2) rst_n  =  1;
end

pwm_motor_driver #(
    .SYS_CLK_FREQ ( SYS_CLK_FREQ ),
    .PWM_FREQ     ( PWM_FREQ     ),
    .DEADTIME_NS  ( DEADTIME_NS  ))
 u_pwm_motor_driver (
    .clk                     ( clk                     ),
    .rst_n                   ( rst_n                   ),
    .cmp_u                   ( cmp_u            [15:0] ),
    .cmp_v                   ( cmp_v            [15:0] ),
    .cmp_w                   ( cmp_w            [15:0] ),

    .pwm_update_tick         ( pwm_update_tick         ),
    .pwm_u_h                 ( pwm_u_h                 ),
    .pwm_u_l                 ( pwm_u_l                 ),
    .pwm_v_h                 ( pwm_v_h                 ),
    .pwm_v_l                 ( pwm_v_l                 ),
    .pwm_w_h                 ( pwm_w_h                 ),
    .pwm_w_l                 ( pwm_w_l                 )
);

initial
begin
    cmp_u = 16'd100;  // Լ 20%
    cmp_v = 16'd200;  // Լ 40%
    cmp_w = 16'd250;  // Լ 50%

    #100000;
    cmp_u = 16'd500;  // Լ 40%
    cmp_v = 16'd500;  // Լ 60%
    cmp_w = 16'd400;  // Լ 80%

    #100000;
    cmp_u = 16'd300;  // Լ 60%
    cmp_v = 16'd400;  // Լ 80%
    cmp_w = 16'd500;  // Լ 100%

    #100000;
    $stop;
end

endmodule