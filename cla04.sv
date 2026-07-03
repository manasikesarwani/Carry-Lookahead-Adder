`timescale 1ns/1ps
module cla04(
    input logic [3:0] A,
    input logic [3:0] B,
    input logic Cin,
    output logic [3:0] Sum,
    output logic gout,
    output logic pout,
    output logic Cout
);
logic [3:0] Pi;
logic [3:0] Gi;
logic [3:0] C;
assign Pi = A ^ B;
assign Gi = A & B;
bclg16 bclg04_inst(
    .P(Pi),
    .G(Gi),
    .Cin(Cin),
    .C(C),
    .pout(pout),
    .gout(gout),
    .Cout(Cout)
);
assign Sum = Pi ^ C;
endmodule