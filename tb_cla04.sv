`timescale 1ns/1ps
module tb_cla04;
logic [3:0] A;
logic [3:0] B;
logic Cin;
logic [3:0] Sum;
logic Cout, pout, gout;
cla04 cla04_inst(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout),
    .pout(pout),
    .gout(gout)
);
initial begin
    A = 4'b0000; B = 4'b0000; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 4'b0001; B = 4'b0010; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 4'b0011; B = 4'b0100; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    A = 4'b0111; B = 4'b1000; Cin = 1'b0;
    #10;
    $display("A=%b B=%b Cin=%b Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
    $finish;
end
endmodule