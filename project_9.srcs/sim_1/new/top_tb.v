`timescale 1ns / 1ps

module top_tb();
reg[15:0] instruction_tb;
reg [7:0] data0_tb;
reg[7:0] data1_tb;
wire overflow_flag_tb;
wire [7:0] out0_tb;
wire [7:0] out1_tb;
wire [7:0] out2_tb;
wire [7:0] out3_tb;
wire zero_flag_tb;

top dut(
          .instruction(instruction_tb),
          .data0(data0_tb),
          .data1(data1_tb),
          .overflow_flag(overflow_flag_tb),
          .out0(out0_tb),
          .out1(out1_tb),
          .out2(out2_tb),
          .out3(out3_tb),
          .zero_flag(zero_flag_tb)
        );
initial
   begin
     instruction_tb=16'hffff;
     #20
     instruction_tb=16'b00_00_10_0000000000;
     #25
     instruction_tb=0;
     #155
     $stop();
   end
initial
   begin
     data0_tb=0;
     #10
     data0_tb=255;
     #10
     data0_tb=1;
     #5
     data0_tb=2;
     #10
     data0_tb=0;
     #165
     $stop();
   end
initial
  begin
     data1_tb=0;
     #10
     data1_tb=255;
     #10
     data1_tb=1;
     #10
     data1_tb=3;
     #10
     data1_tb=0;
     #160
     $stop();
  end
endmodule
