`timescale 1ns/1ps
module cla32(
    input logic [31:0] A,
    input logic [31:0] B,
    input logic Cin,
    output logic [31:0] Sum,
    output logic Cout
);
logic [1:0] P;
logic [1:0] G;
logic [1:0] C;
assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & C[0]);
assign Cout = G[1] | (P[1] & G[0])| (P[1] & P[0] & C[0]);
cla16 cla16_inst0(
    .A(A[15:0]),
    .B(B[15:0]),
    .Cin(C[0]),
    .Sum(Sum[15:0]),
    .Cout(),
    .pout(P[0]),
    .gout(G[0])
);
cla16 cla16_inst1(
    .A(A[31:16]),
    .B(B[31:16]),
    .Cin(C[1]),
    .Sum(Sum[31:16]),
    .Cout(),
    .pout(P[1]),
    .gout(G[1])
);
endmodule