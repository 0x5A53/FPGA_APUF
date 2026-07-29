`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 06:56:02 PM
// Design Name: 
// Module Name: MUX_2to1
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
module MUX_2to1(
    input top, bottom, select,
    output mux_out
    );
    
    assign mux_out = (select) ? bottom : top;  // Top if select = 0, Bottom if select = 1
    
endmodule
