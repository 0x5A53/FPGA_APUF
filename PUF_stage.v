`timescale 1ns / 1ps

module PUF_stage
    #(
    parameter t_delay = 2,
    parameter u_delay = 2,
    parameter r_delay = 2,
    parameter s_delay = 2
    )
    (
    input wire top_in, bottom_in, challenge_bit,
    output wire top_out, bottom_out
    );

    (* dont_touch = "TRUE", keep = "TRUE" *) wire top_mux_top_in;
    (* dont_touch = "TRUE", keep = "TRUE" *) wire top_mux_bottom_in;
    (* dont_touch = "TRUE", keep = "TRUE" *) wire bottom_mux_top_in;
    (* dont_touch = "TRUE", keep = "TRUE" *) wire bottom_mux_bottom_in;

    
    (* dont_touch = "TRUE", keep = "TRUE" *)
    ripple_carry #(
        .SIZE(t_delay)
        )
        t (
        .CIN(top_in),
        .SUM(),
        .COUT(top_mux_top_in)
        );
    
    (* dont_touch = "TRUE", keep = "TRUE" *)
    ripple_carry #(
        .SIZE(r_delay)
        )
        r (
        .CIN(bottom_in),
        .SUM(),
        .COUT(top_mux_bottom_in)
        );
    
    
    (* dont_touch = "TRUE", keep = "TRUE" *)
    ripple_carry #(
        .SIZE(u_delay)
        )
        u (
        .CIN(top_in),
        .SUM(),
        .COUT(bottom_mux_top_in)
        );
        
    (* dont_touch = "TRUE", keep = "TRUE" *)
    ripple_carry #(
        .SIZE(s_delay)
        )
        s (
        .CIN(bottom_in),
        .SUM(),
        .COUT(bottom_mux_bottom_in)
        );
    
    (* dont_touch = "true", keep = "true" *)
    MUX_2to1 top_mux (
        .top(top_mux_top_in),
        .bottom(top_mux_bottom_in),
        .select(challenge_bit),
        .mux_out(top_out)
        );
    
    (* dont_touch = "true", keep = "true" *)
    MUX_2to1 bot_mux (
        .top(bottom_mux_top_in),
        .bottom(bottom_mux_bottom_in),
        .select(challenge_bit),
        .mux_out(bottom_out)
        );


endmodule
