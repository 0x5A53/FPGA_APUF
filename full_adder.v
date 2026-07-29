`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2026 12:05:00 PM
// Design Name: 
// Module Name: full_adder
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
(* dont_touch = "true" *)
module full_adder (
    input a, b, cin,
    output sum, cout
    );
    
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
    
endmodule

//////////////////////////////////////////////////////////////////////////////////