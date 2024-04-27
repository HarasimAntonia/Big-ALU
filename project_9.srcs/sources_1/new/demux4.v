`timescale 1ns / 1ps

module demux4(
                 input [7:0] in0,
                 input [1:0] sel,
                 output [7:0] out0,
                 output [7:0] out1,
                 output [7:0] out2,
                 output [7:0] out3
              );
  assign out0=~sel[1]&(~sel[0])&in0;
  assign out1=~sel[1]&sel[0]&in0;
  assign out2=~sel[0]&sel[1]&in0;
  assign out3=sel[0]&sel[1]&in0; 
endmodule
