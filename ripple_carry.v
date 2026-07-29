`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2026 04:03:06 PM
// Design Name: 
// Module Name: ripple_carry
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


module ripple_carry
    #(
    parameter SIZE = 4 // Number of full adders desired in the ripple adder, defaulting to 4
    )
    (
    input wire              CIN,
    output wire [SIZE-1:0]  SUM,
    output wire             COUT
    );
    
    (* dont_touch = "TRUE", keep = "TRUE" *) wire  [SIZE-1:0]  A = {SIZE{1'b1}};
    (* dont_touch = "TRUE", keep = "TRUE" *) wire  [SIZE-1:0]  B = {SIZE{1'b0}};
    (* dont_touch = "TRUE", keep = "TRUE" *) wire  [SIZE:0] q;
    assign q[0] = CIN;
       
    genvar i;
    generate
        for(i=0; i<SIZE; i=i+1) begin : FULL_ADDER
            (* keep_hierarchy = "yes" *)
            full_adder add_inst ( .a(A[i]), .b(B[i]), .cin(q[i]), .sum(SUM[i]), .cout(q[i+1]));
        end
    endgenerate
    
    assign COUT = q[SIZE];
    
endmodule
//////////////////////////////////////////////////////////////////////////////////
