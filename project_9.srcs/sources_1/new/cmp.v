`timescale 1ns / 1ps

module cmp(
             input [7:0] in0,
             input [7:0] in1,
             output reg out0
          );
always@(*)
  if(in1==in0)
    begin
      out0=1;
    end
  else 
    begin
      out0=0;
    end
endmodule
