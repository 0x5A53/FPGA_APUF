`timescale 1ns / 1ps

(* dont_touch = "true" *)
module MUX_2to1(
    input top, bottom, select,
    output mux_out
    );
    
    assign mux_out = (select) ? bottom : top;  // Top if select = 0, Bottom if select = 1
    
endmodule
