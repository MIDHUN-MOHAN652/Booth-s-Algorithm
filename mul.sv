module mul(
    input logic [4:0] M,
    input logic [4:0] Q,
    input logic clk,
    input logic rst,
    output logic [9:0] R
);
    logic Qp=1'b0;
    logic [2:0] pc;
    logic [4:0] A;
    initial begin
    logic Qp=1'b0;
    logic [4:0] A=5'b00000;
    logic [2:0] pc=3'b000;
    end
    always_ff @(posedge clk or posedge rst ) begin
            if(clk) begin
                pc<=pc+1;
                if(pc<6) begin
                    case({Qp,Q[0]})
                    2'b01: A<= A+M;
                    2'b10: A<= A+~M+1;
                    default: ;
                    endcase
                    Qp<=Q[0];
                    A<=A>>>1;
                end
                else begin
                    R<={A,Q};
                end            
            end
            else if(rst) begin
                A<=5'b00000;
                pc<=0;
            end
    end
endmodule