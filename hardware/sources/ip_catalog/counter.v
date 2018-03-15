`timescale 1ns / 1ps

`define STATE_RESET 8'd0
`define STATE_RUN 8'd1
`define STATE_HALT 8'd2

module counter(
    input clk,
    input [31:0] interval,
    input [7:0] state,
    output reg [31:0] counter
	);
parameter [7:0] STATE_RESET = 8'd0,
		STATE_RUN = 8'd1,
		STATE_HALT = 8'd2;
reg [31:0] times;
always@(posedge clk)
begin
	case(state)
	STATE_RESET:
	begin 
		counter <= 0;
		times <= 0;
	end
	STATE_HALT: ;
	STATE_RUN: 
	begin
		times <= ((times<interval) ? (times+1) : 0);
		counter <= ((times==interval) ? (counter+1) : counter);
	end
	default: 
	begin
		counter <= 0;
		times <= 0;
	end
	endcase
end

	/*TODO: Add your logic code here*/
    
endmodule
