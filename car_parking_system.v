`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 17:04:28
// Design Name: 
// Module Name: car_parking_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module car_parking_system(
input [4:0] password,
input entry,
input exit,
input [3:0]position,
output reg ERROR_pos,
output reg ERROR_password,
output reg direction_right,
output reg direction_left,
output reg [9:0]space_remaining,
output reg gate
 );
reg [9:0]space=0;
reg [2:0]count;
reg [1:0]reset=1;
parameter pass=5'b10011;
always@(position or password)
begin
ERROR_pos=0;
count=0;
ERROR_password=0;
direction_right=0;
direction_left=0;
gate=0;
if(password==pass)
begin
if(space[position-1])
begin
if(entry & ~direction_right & ~direction_left)
ERROR_pos=1;
if(exit)
begin gate=1;
space[position-1]=0;end
end
else
begin
gate=1;
space[position-1]=1;
if(position>5)
direction_right=1;
else
direction_left=1;
end
end
else
ERROR_password=1;
space_remaining<=space;
end
always@(*)
begin
if(gate==1)
#5 gate=0;
end
endmodule
