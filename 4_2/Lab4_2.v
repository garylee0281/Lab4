`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:48 08/25/2015 
// Design Name: 
// Module Name:    Lab4_2 
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
module Lab4_2( clk,rst_n,display_ctl,display
    );
wire clk_out;
wire [1:0]clk_ctl;
wire [2:0]bcd;
input clk;
input rst_n;
reg [2:0]a;
reg [2:0]b;
reg [2:0]c;
reg [2:0]d;
reg [2:0]e;
reg [2:0]f;
reg [2:0]a_tmp;
reg [2:0]b_tmp;
reg [2:0]c_tmp;
reg [2:0]d_tmp;
reg [2:0]e_tmp;
reg [2:0]f_tmp;
output [3:0]display_ctl;
output [14:0]display;



always@(*)
begin
a_tmp<=a;
b_tmp<=b;
c_tmp<=c;
d_tmp<=d;
e_tmp<=e;
f_tmp<=f;
end 

always@(posedge clk_out or negedge rst_n)
begin
if(~rst_n)
	begin
	a<=3'd4;
	b<=3'd4;
	c<=3'd3;
	d<=3'd2;
	e<=3'd1;
	f<=3'd0;
	end
else 
	begin
	a<=f_tmp;
	b<=a_tmp;
	c<=b_tmp;
	d<=c_tmp;
	e<=d_tmp;
	f<=e_tmp;
	end
end 
freq_div d1(
	.clk_out(clk_out), 
	.clk_ctl(clk_ctl),//control clk of scan 
	.clk(clk), 
	.rst_n(rst_n) 
    );
scan sl(
	.ftsd_ctl(display_ctl),//display control 
	.ftsd_in(bcd), // output to ftsd display
	.in0(c), // 1st input
	.in1(d), // 2nd input
	.in2(e), // 3rd input
	.in3(f), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
bcd_nthuee el(
		 .bcd(bcd),
		 .display(display)
    );
endmodule
