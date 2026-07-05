`timescale 1ns/1ps
module tb_cla32;
logic [31:0] A;
logic [31:0] B;
logic Cin;
logic [31:0] Sum;
logic Cout;
cla32 cla32_inst(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
initial begin
    A = 32'h00000000; B = 32'h00000000; Cin = 0;
    #10;
    $display("A=%h B=%h Cin=%b Sum=%h Cout=%b", A, B, Cin, Sum, Cout);
    A = 32'h00000001; B = 32'h00000001; Cin = 0;
    #10;    
    $display("A=%h B=%h Cin=%b Sum=%h Cout=%b", A, B, Cin, Sum, Cout);
    A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0;
    #10;
    $display("A=%h B=%h Cin=%b Sum=%h Cout=%b", A, B, Cin, Sum, Cout);
    A = 32'h12345678; B = 32'h87654321; Cin = 0;
    #10;
    $display("A=%h B=%h Cin=%b Sum=%h Cout=%b", A, B, Cin, Sum, Cout);
    A = 32'hAAAAAAAA; B = 32'h55555555; Cin = 1;
    #10;
    $display("A=%h B=%h Cin=%b Sum=%h Cout=%b", A, B, Cin, Sum, Cout);
    $finish;
end
endmodule