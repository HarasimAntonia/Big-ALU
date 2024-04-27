`timescale 1ns / 1ps

module or1(
             input [7:0] in0,
             input [7:0] in1,
             output [7:0] out0
          );
 assign out0=in0|in1;
endmodule
