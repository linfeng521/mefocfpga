`timescale 1ns / 1ps
module tb_clarke_transform;
    reg clk = 0;
    reg rst_n = 0;
    reg i_valid = 0;
    reg signed [15:0] i_a = 0, i_b = 0;
    wire o_valid;
    wire signed [15:0] i_alpha, i_beta;
    reg expected_valid = 0;
    integer expected_alpha = 0;
    integer expected_beta = 0;
    integer reference_sum, reference_product;
    integer checked = 0;
    integer stimulus_index;
    reg signed [15:0] held_alpha = 0, held_beta = 0;
    clarke_transform dut (.clk(clk), .rst_n(rst_n), .i_valid(i_valid),
        .i_a(i_a), .i_b(i_b), .o_valid(o_valid), .i_alpha(i_alpha), .i_beta(i_beta));
    always #5 clk = ~clk;
    always @(posedge clk) begin
        #1;
        if (!rst_n) begin
            if (o_valid !== 0 || i_alpha !== 16'sd0 || i_beta !== 16'sd0)
                $fatal(1, "Reset failed");
            expected_valid = 0;
            held_alpha = 0;
            held_beta = 0;
        end else begin
            if (o_valid !== expected_valid) $fatal(1, "Valid latency mismatch");
            if (expected_valid) begin
                if ($signed(i_alpha) !== expected_alpha || $signed(i_beta) !== expected_beta)
                    $fatal(1, "Data mismatch: alpha=%0d/%0d beta=%0d/%0d",
                        $signed(i_alpha), expected_alpha, $signed(i_beta), expected_beta);
                checked = checked + 1;
            end else if (i_alpha !== held_alpha || i_beta !== held_beta)
                $fatal(1, "Outputs changed without valid");
            held_alpha = i_alpha;
            held_beta = i_beta;
            expected_valid = i_valid;
            expected_alpha = $signed(i_a);
            reference_sum = $signed(i_a) + 2 * $signed(i_b);
            reference_product = reference_sum * 18919;
            expected_beta = reference_product >>> 15;
            if (expected_beta > 32767) expected_beta = 32767;
            if (expected_beta < -32768) expected_beta = -32768;
        end
    end
    task drive;
        input valid_value;
        input signed [15:0] phase_a, phase_b;
        begin
            @(negedge clk);
            i_valid = valid_value;
            i_a = phase_a;
            i_b = phase_b;
        end
    endtask
    initial begin
        repeat (3) @(negedge clk);
        rst_n = 1;
        drive(1, 0, 0);
        drive(1, 16384, -8192);
        drive(1, -16384, 8192);
        drive(1, 32767, 32767);
        drive(1, -32768, -32768);
        drive(1, 32767, -32768);
        drive(1, -32768, 32767);
        drive(1, 0, -1);
        drive(1, 0, 28377);
        drive(1, 0, 28378);
        drive(1, 0, -28377);
        drive(1, 0, -28378);
        drive(0, 1234, -5678);
        drive(0, -1234, 5678);
        for (stimulus_index = 0; stimulus_index < 2000; stimulus_index = stimulus_index + 1)
            drive((stimulus_index % 5) != 0, $random, $random);
        drive(1, 1111, 2222);
        @(negedge clk);
        rst_n = 0;
        i_valid = 0;
        #1;
        if (o_valid !== 0 || i_alpha !== 16'sd0 || i_beta !== 16'sd0)
            $fatal(1, "Asynchronous reset failed");
        repeat (2) @(negedge clk);
        rst_n = 1;
        drive(0, 0, 0);
        drive(1, -12345, 6789);
        drive(0, 0, 0);
        repeat (3) @(negedge clk);
        if (checked != 1613) $fatal(1, "Unexpected count: %0d", checked);
        $display("PASS: %0d Clarke transactions", checked);
        $finish;
    end
    initial begin
        #100000;
        $fatal(1, "Timeout");
    end
endmodule
