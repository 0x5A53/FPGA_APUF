`timescale 1ns / 1ps

// Note that this is currently set for only a 3-stage APUF. Files will be updated/added as more progress/testing is completed.

module multi_stage_PUF(
    input wire start_wire,
    input wire [2:0] challenge_select,
    output reg dff_result,
    output wire top_final_mux_out_debug,
    output wire bottom_final_mux_out_debug
    );
    
    localparam FAST = 5;
    localparam MID = 7;
    localparam SLOW = 16;
    localparam EXTENDED = 64;
    
    //wire [2:0] challenge_select = 3'b000;
    
    (* dont_touch = "TRUE", keep = "TRUE" *) wire [3:0] top_path;
    (* dont_touch = "TRUE", keep = "TRUE" *) wire [3:0] bottom_path;
    
    (* dont_touch = "TRUE", keep = "TRUE" *) start_wire_buf start_top( .a(start_wire), .b(top_path[0]));
    (* dont_touch = "TRUE", keep = "TRUE" *) start_wire_buf start_bottom( .a(start_wire), .b(bottom_path[0]));
    
//////////////////////////////////////////////////////////////////////////////////
// Stage declarations
    
    PUF_stage #(.t_delay(EXTENDED), .u_delay(EXTENDED), .r_delay(EXTENDED), .s_delay(EXTENDED))
    stage0 (.top_in(top_path[0]), .bottom_in(bottom_path[0]), .challenge_bit(challenge_select[0]), .top_out(top_path[1]), .bottom_out(bottom_path[1]));
    
    PUF_stage #(.t_delay(EXTENDED), .u_delay(EXTENDED), .r_delay(EXTENDED), .s_delay(EXTENDED))
    stage1 (.top_in(top_path[1]), .bottom_in(bottom_path[1]), .challenge_bit(challenge_select[1]), .top_out(top_path[2]), .bottom_out(bottom_path[2]));
    
    PUF_stage #(.t_delay(EXTENDED), .u_delay(EXTENDED), .r_delay(EXTENDED), .s_delay(EXTENDED))
    stage2 (.top_in(top_path[2]), .bottom_in(bottom_path[2]), .challenge_bit(challenge_select[2]), .top_out(top_path[3]), .bottom_out(bottom_path[3]));
    
//////////////////////////////////////////////////////////////////////////////////

    assign top_final_mux_out_debug = top_path[3];
    assign bottom_final_mux_out_debug = bottom_path[3];
    
    always @(posedge bottom_path[3]) begin
        dff_result <= top_path[3];
    end
    
endmodule
