`timescale 1ns/1ps
module cla16(
    input logic [15:0] A,
    input logic [15:0] B,
    input logic Cin,
    output logic [15:0] Sum,
    output logic Cout,
    output logic pout,
    output logic gout
);
logic [3:0] P;
logic [3:0] G;
logic [3:0] C;
bclg04 bclg16_inst(
        .P(P),
        .G(G),
        .Cin(Cin),
        .pout(pout),
        .gout(gout),
        .Cout(Cout),
        .C(C)
);
cla04 cla04_inst0(
    .A(A[3:0]),
    .B(B[3:0]),
    .Cin(C[0]),
    .Sum(Sum[3:0]),
    .Cout(),
    .pout(P[0]),
    .gout(G[0])
);
cla04 cla04_inst1(
    .A(A[7:4]),
    .B(B[7:4]),
    .Cin(C[1]),
    .Sum(Sum[7:4]),
    .Cout(),
    .pout(P[1]),
    .gout(G[1])
);
cla04 cla04_inst2(
    .A(A[11:8]),
    .B(B[11:8]),
    .Cin(C[2]),
    .Sum(Sum[11:8]),
    .Cout(),
    .pout(P[2]),
    .gout(G[2])
);
cla04 cla04_inst3(
    .A(A[15:12]),
    .B(B[15:12]),
    .Cin(C[3]),
    .Sum(Sum[15:12]),
    .Cout(),
    .pout(P[3]),
    .gout(G[3])
);
endmodule