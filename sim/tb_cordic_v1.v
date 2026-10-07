`timescale 1ns / 1ps

module tb_cordic_v1;

    reg                clk;
    reg                rst_n;
    reg                i_en;
    reg signed [15:0]  i_theta;

    wire signed [15:0] o_sin;
    wire signed [15:0] o_cos;
    wire               o_en;

    cordic dut (
        .clk     (clk),
        .rst_n   (rst_n),
        .i_en    (i_en),
        .i_theta (i_theta),
        .o_sin   (o_sin),
        .o_cos   (o_cos),
        .o_en    (o_en)
    );

    always #10 clk = ~clk; // 50 MHz

    initial begin
        clk     = 1'b0;
        rst_n   = 1'b0;
        i_en    = 1'b0;
        i_theta = 16'sd0;

        #100;
        rst_n = 1'b1;

        run_angle(16'sd0);       //   0 度：sin≈0，      cos≈32767
        run_angle(16'sd8192);    //  45 度：sin≈23170，  cos≈23170
        run_angle(16'sd16384);   //  90 度：sin≈32767，  cos≈0
        run_angle(-16'sd16384);  // -90 度：sin≈-32768， cos≈0
        run_angle(16'sd32767);   // 接近 180 度
        run_angle(-16'sd32768);  // -180 度

        #100;
        $finish;
    end

    task run_angle;
        input signed [15:0] angle;
        begin
            @(negedge clk);
            i_theta = angle;
            i_en    = 1'b1;

            @(negedge clk);
            i_en = 1'b0;

            wait (o_en == 1'b1);
            $display("time=%0t theta=%0d sin=%0d cos=%0d",
                     $time, angle, o_sin, o_cos);
        end
    endtask

endmodule
