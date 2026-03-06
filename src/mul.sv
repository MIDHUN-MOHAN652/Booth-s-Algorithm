module mul(
    input logic [4:0] M,
    input logic [4:0] Qin,
    input logic clk,
    input logic rst,
    output logic [9:0] R
);
    logic [2:0] pc;
    logic [4:0] A;
    logic [4:0] Q;
    logic Qp;
    logic done;
    wire [4:0] A_next=({Q[0],Qp}==2'b01) ? (A+M):
                      ({Q[0],Qp}==2'b10) ? (A+~M+1): A;
    assign R={A,Q};
    always_ff @(posedge clk or posedge rst ) begin
            if(rst) begin
                A<=5'b00000;
                Q<=Qin;
                Qp<=1'b0;
                pc<=3'b000;
                done<=1'b0;
            end
            else if(pc<5) begin
                    A<={A_next[4],A_next[4:1]};
                    Q<={A_next[0],Q[4:1]};
                    pc<=pc+1;
            end           
    end
endmodule
