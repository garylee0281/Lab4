`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:17 08/25/2015 
// Design Name: 
// Module Name:    bcd_nthuee 
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
module bcd_nthuee(
	 bcd,display,
    );
input [2:0]bcd;
output [14:0]display;
reg [14:0] display; // SSD display output (in always)
	// Combinational logics:
	always @(bcd)
		case (bcd)
			3'd0: display = 15'b1101_0100_1111_111; //N
			3'd1: display = 15'b1110_0000_1111_111; //T
			3'd2: display = 15'b1001_0000_1111_111; //H
			3'd3: display = 15'b1000_0011_1111_111; //U
			3'd4: display = 15'b0110_0000_1111_111; //E
			default: display = 15'b1111_1111_1111_111; //DEF
		endcase
endmodule
