`timescale 1ns / 1ps

module mux4(
                 input [7:0] in0,
                 input [7:0] in1,
                 input [7:0] in2,
                 input [7:0] in3,
                 input [1:0] sel,
                 output [7:0] out0
            );
  assign out0=(~sel[0]&(~sel[1])&in0)|(~sel[1]&sel[0]&in1)|(~sel[0]&sel[1]&in2)|(sel[0]&sel[1]&in3);
endmodule
