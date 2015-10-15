`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:15 08/25/2015 
// Design Name: 
// Module Name:    Lab4_3 
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
module Lab4_3(clk,rst_n,display_ctl,display,switch
    );
input clk;
input rst_n;
input [3:0]switch; 
output [3:0]display_ctl;
output [14:0]display;
wire [3:0]bcd;
wire clk_out;
wire [1:0]clk_ctl;

reg [3:0]a;
reg [3:0]b;
reg [3:0]c;
reg [3:0]d;
reg [3:0]a_tmp;
reg [3:0]b_tmp;
reg [3:0]c_tmp;
reg [3:0]d_tmp;
always@(*)
begin
	a_tmp<=a;
	b_tmp<=b;
	c_tmp<=c;
	d_tmp<=d;
end

always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
	begin
	a<=4'd1;
	b<=4'd0;
	c<=4'd1;
	d<=4'd0;
	end
	else
	begin
		if(switch[0]==1&&switch[1]==0&&switch[2]==0)
			begin
				if(switch[3]==1)
					begin
					a<=4'd0;
					b<=a_tmp;
					c<=b_tmp;
					d<=c_tmp;
					end
				else
					begin
					a<=b_tmp;
					b<=c_tmp;
					c<=d_tmp;
					d<=4'd0;
					end
			end
		else if(switch[1]==1&&switch[0]==0&&switch[2]==0)
			begin
				if(switch[3]==1)
					begin
						if(a==1)
						begin
						a<=4'd1;
						b<=a_tmp;
						c<=b_tmp;
						d<=c_tmp;
						end
						else
						begin
						a<=4'd0;
						b<=a_tmp;
						c<=b_tmp;
						d<=c_tmp;
						end
					end
				else
					begin
					a<=b_tmp;
					b<=c_tmp;
					c<=d_tmp;
					d<=4'd0;
					end
			end
		else if(switch[2]==1&&switch[0]==0&&switch[1]==0)
			begin
					if(switch[3]==1)
					begin
					a<=d_tmp;
					b<=a_tmp;
					c<=b_tmp;
					d<=c_tmp;
					end
				else
					begin
					a<=b_tmp;
					b<=c_tmp;
					c<=d_tmp;
					d<=a_tmp;
					end
			end
		else
			begin
				a<=a_tmp;
				b<=b_tmp;
				c<=c_tmp;
				d<=d_tmp;
			end
	end
end

freq_div dl(
   .clk_out(clk_out), // divided clock output
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	); 
scan sl(
   .ftsd_ctl(display_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(a), // 1st input
	.in1(b), // 2nd input
	.in2(c), // 3rd input
	.in3(d), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
bcd_dis bl(
   .display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);





endmodule
