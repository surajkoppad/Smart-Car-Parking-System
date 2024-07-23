`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 17:50:47
// Design Name: 
// Module Name: testbench
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


module testbench();
reg [4:0]password;
reg entry;
reg exit;
reg [3:0]position;
wire ERROR_pos;
wire ERROR_password;
wire direction_right;
wire direction_left;
wire [9:0]space;
wire gate;
car_parking_system dut(password,entry,exit,position,ERROR_pos,ERROR_password,
direction_right,direction_left,space,gate);

initial
begin
password=5'b10011;entry=1;exit=0;position=8;#30
password=5'b10111;entry=1;exit=0;position=5;#20
password=5'b10011;entry=1;exit=0;position=4;#50
password=5'b10011;entry=1;exit=0;position=3;#20
password=5'b10011;entry=1;exit=0;position=1;#60
password=5'b10011;entry=1;exit=0;position=7;#40
password=5'b10011;entry=0;exit=1;position=4;#60
password=5'b10011;entry=1;exit=0;position=3;#20
$finish;
end
endmodule
