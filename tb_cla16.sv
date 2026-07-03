`timescale 1ps/1ps
module tb_cla16;
logic [15:0] A;
logic [15:0] B;
logic Cin;
logic [15:0] Sum;
logic Cout;
cla16 cla16_inst(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
initial begin
    A = 16'b0000000000000000; B = 16'b0000000000000000; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 16'b0000000000000011; B = 16'b0000000000000101; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 16'b1111111111111111; B = 16'b0000000000000001; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 16'b1010101010101010; B = 16'b0101010101010101; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    $finish;
end
endmodule