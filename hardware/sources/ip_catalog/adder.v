`timescale 1ns / 1ps

module adder(
    input [7:0] operand0,
    input [7:0] operand1,
    output [7:0] result
    );
wire [7:0] cout;

assign result[0] = operand0[0]^operand1[0];
assign cout[0] = operand0[0]&operand1[0];
assign result[1] = operand0[1]^operand1[1]^cout[0];
assign cout[1] = (operand0[1]&(operand1[1]|cout[0]))|(operand1[1]&cout[0]);
assign result[2] = operand0[2]^operand1[2]^cout[1];
assign cout[2] = (operand0[2]&(operand1[2]|cout[1]))|(operand1[2]&cout[1]);
assign result[3] = operand0[3]^operand1[3]^cout[2];
assign cout[3] = (operand0[3]&(operand1[3]|cout[2]))|(operand1[3]&cout[2]);
assign result[4] = operand0[4]^operand1[4]^cout[3];
assign cout[4] = (operand0[4]&(operand1[4]|cout[3]))|(operand1[4]&cout[3]);
assign result[5] = operand0[5]^operand1[5]^cout[4];
assign cout[5] = (operand0[5]&(operand1[5]|cout[4]))|(operand1[5]&cout[4]);
assign result[6] = operand0[6]^operand1[6]^cout[5];
assign cout[6] = (operand0[6]&(operand1[6]|cout[5]))|(operand1[6]&cout[5]);
assign result[7] = operand0[7]^operand1[7]^cout[6];
assign cout[7] = (operand0[7]&(operand1[7]|cout[6]))|(operand1[7]&cout[6]); 
	/*TODO: Add your logic code here*/

endmodule
