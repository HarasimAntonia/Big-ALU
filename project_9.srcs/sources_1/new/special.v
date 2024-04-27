`timescale 1ns / 1ps

module special(
                   input [7:0] in0,
                   input [7:0] in1,
                   output reg sel
               );
 always@(*)
 if(in0[0]==in1[0]==in0[7]==in1[7])
   begin
     sel=1;
   end
 else 
   begin
     sel=0;
   end  
endmodule
