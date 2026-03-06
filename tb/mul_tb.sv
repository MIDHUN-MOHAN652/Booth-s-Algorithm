module mul_tb;
    logic [4:0] M;
    logic [4:0] Qin;
    logic clk;
    logic rst;
    logic [9:0] R;
    mul dut (
        .M(M),
        .Qin(Qin),
        .clk(clk),
        .rst(rst),
        .R(R)
    );
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        rst=1;
        M=5'b01001; Qin=5'b11001;
        repeat(2) @(posedge clk);
        rst=0;
        repeat(5) @(posedge clk);
        $display("M=%b Qin=%b R=%b (%0d x %0d=%0d)",$signed(M),$signed(Qin),$signed(R),$signed(M),$signed(Qin),$signed(R));
        $finish;
    end
endmodule
