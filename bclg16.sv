`timescale 1ns/1ps
module bclg16(
    input logic [3:0] P,
    input logic [3:0] G,
    input logic Cin,
    output logic pout,
    output logic gout,
    output logic Cout,
    output logic [3:0] C
);
assign C[0] = Cin;
assign C[1] = G[0]|(P[0] & C[0]);
assign C[2] = G[1]|(P[1] & G[0])|(P[1] & P[0] & C[0]);
assign C[3] = G[2]|(P[2] & G[1])|(P[2] & P[1] & G[0])|(P[2] & P[1] & P[0] & C[0]);
assign pout = P[3] & P[2] & P[1] & P[0];
assign gout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
endmodule