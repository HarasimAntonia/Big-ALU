`timescale 1ns / 1ps

module top(
               input [15:0] instruction,
               input [7:0] data0,
               input [7:0] data1,
               output overflow_flag,
               output [7:0] out0,
               output [7:0] out1,
               output [7:0] out2,
               output [7:0] out3,
               output zero_flag
           );
  wire [7:0] w0;
  wire [7:0] w1;
  wire [7:0] w2;
  wire [7:0] w3;
  wire [7:0] w4;
  wire [7:0] w5;
  wire [7:0] w6;
  wire w7;
  wire [1:0] bits0;
  assign bits0=instruction[11:10];
  wire [7:0] w8;
  wire [7:0] w9;
  wire [1:0] bits1;
  assign bits1=instruction[13:12];
  wire [7:0] w10;
  wire [1:0] bits2;
  assign bits2=instruction[15:14];
 shift_r shift_r(
                   .in0(data0),
                   .in1(data1),
                   .out0(w0)
                 );
 shift_l shift_l(
                   .in0(data0),
                   .in1(data1),
                   .out0(w1)
                 );
 add add(
                   .in0(data0),
                   .in1(data1),
                   .out0(w2)
                 );
 sub sub(
                   .in0(data0),
                   .in1(data1),
                   .out0(w3)
                 );
 and1 and1(
                   .in0(data0),
                   .in1(data1),
                   .out0(w4)
                 );
 or1 or1(
                   .in0(data0),
                   .in1(data1),
                   .out0(w5)
                 );
 xor1 xor1(
                   .in0(data0),
                   .in1(data1),
                   .out0(w6)
                 );
special special(
                   .in0(data0),
                   .in1(data1),
                   .sel(w7)
                 );
 mux4 mux4_1(
               .in0(w0),
               .in1(w1),
               .in2(w2),
               .in3(w3),
               .sel(bits0),
               .out0(w8) 
             );
 mux4 mux4_2(
               .in0(w4),
               .in1(w5),
               .in2(w6),
               .in3(1),
               .sel(bits0),
               .out0(w9) 
             );
mux4 mux4_3(
               .in0(w8),
               .in1(w9),
               .in2(0),
               .in3(w7),
               .sel(bits1),
               .out0(w10)  
            );
demux4 demux4(
                .in0(w10),
                .sel(bits2),
                .out0(out0),
                .out1(out1),
                .out2(out2),
                .out3(out3)
              );
cmp cmp(
           .in0(w10),
           .in1(0),
           .out0(zero_flag)
       );
 assign overflow_flag=add.co;
endmodule
