`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:07:45 03/06/2017 
// Design Name: 
// Module Name:    collisiondetect 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

typedef struct{
reg[7:0] x;
reg[7:0] y;
reg[7:0] z;
} Point;

typedef struct{
  Point s;
  Point e;
} Line;

module max (input [7:0] a, 
            input [7:0] b, 
            output reg [7:0] out);
  always @* 
  begin
    if (a>b)
      out = a;
    else
      out = b;
  end
endmodule

module min (input [7:0] a, 
            input [7:0] b, 
            output reg [7:0] out);
  always @* 
  begin
    if (a<b)
      out = a;
    else
      out = b;
  end
endmodule

module CollisionDetect(
    input clk,
    input reset,
    input in_val,
    input [7:0] x1,
    input [7:0] y1,
    input [7:0] z1,
    input [7:0] x2,
    input [7:0] y2,
    input [7:0] z2,
    output out_val,
    output [7:0] lineID
    );
    
    wire [1:0] o1;
    wire [1:0] o2;
    wire [1:0] o3;
    wire [1:0] o4;
    
    orientation


endmodule


module orientation(
    input clk,    

    input [7:0] px,
    input [7:0] py,
    input [7:0] pz,

    input [7:0] qx,
    input [7:0] qy,
    input [7:0] qz,
    
    input [7:0] rx,
    input [7:0] ry,
    input [7:0] rz,
    
    output [1:0] out
    );
    
    reg signed [15:0] val;
    
//    val = (qy-py) * (rx-qx) - (qx-px) * (ry-qy);
    
    always @(posedge clk)
    begin    
      val = (qy-py) * (rx-qx) - (qx-px) * (ry-qy);
    end
    
    always @(val)
    begin    
      if (val == 0)
        out = 2'b00; //colinear, return b00
      else if (val > 0)
        out = 2'b01; // clockwise, return b01
      else
        out = 2'b10; // countercolock wise, return b10
    end
  
endmodule


module onSegment(
  
    input [7:0] px,
    input [7:0] py,
    input [7:0] pz,

    input [7:0] qx,
    input [7:0] qy,
    input [7:0] qz,
    
    input [7:0] rx,
    input [7:0] ry,
    input [7:0] rz,
    
    output out
    );
    
    wire [7:0] max_prx;
    wire [7:0] min_prx;

    wire [7:0] max_pry;
    wire [7:0] min_pry;
    
    max mmx_prx(px, rx, max_prx);
    max mmx_pry(py, ry, max_pry);
    
    min mmn_prx(px, rx, min_prx);
    min mmn_pry(py, ry, min_pry);
    
    out = max_prx && min_prx && max_pry && min_pry;
        
endmodule
