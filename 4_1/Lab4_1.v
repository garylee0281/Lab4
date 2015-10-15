`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:03 08/24/2015 
// Design Name: 
// Module Name:    Lab4_1 
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
module Lab4_1(input clk,input in,input mode,input rst_n,output [7:0]Led
    );
wire [7:0]Led;
wire clk_out;
reg [7:0]q;
wire in_tmp;
reg [7:0]q_tmp;

assign in_tmp=(mode)?in:q[0];
assign Led[0]=q[0];
assign Led[1]=q[1];
assign Led[2]=q[2];
assign Led[3]=q[3];
assign Led[4]=q[4];
assign Led[5]=q[5];
assign Led[6]=q[6];
assign Led[7]=q[7];
always@(q)
begin
q_tmp[7]<=q[7];
q_tmp[6]<=q[6];
q_tmp[5]<=q[5];
q_tmp[4]<=q[4];
q_tmp[3]<=q[3];
q_tmp[2]<=q[2];
q_tmp[1]<=q[1];
q_tmp[0]<=q[0];
end

always@(posedge clk_out or negedge rst_n)
begin
if(~rst_n)
	begin
	q[7]<=0;
	q[6]<=0;
	q[5]<=0;
	q[4]<=0;
	q[3]<=0;
	q[2]<=0;
	q[1]<=0;
	q[0]<=0;
	end
else
	begin
	q[7]<=in_tmp;
	q[6]<=q_tmp[7];
	q[5]<=q_tmp[6];
	q[4]<=q_tmp[5];
	q[3]<=q_tmp[4];
	q[2]<=q_tmp[3];
	q[1]<=q_tmp[2];
	q[0]<=q_tmp[1];
	end
end
Lab3_1_frequency_divider d1(
	.clk_out(clk_out),  
	.clk(clk), 
	.rst_n(rst_n)
);
endmodule
