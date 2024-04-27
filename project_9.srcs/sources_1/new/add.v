`timescale 1ns / 1ps

module add(
             input [7:0] in0,
             input [7:0] in1,
             output [7:0] out0,
             output co
            );
 
 assign {co,out0}=in0+in1;
endmodule
