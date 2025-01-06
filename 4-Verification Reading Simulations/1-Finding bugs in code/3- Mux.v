// * Bugs mux4 *
// -----------------------------------------------------

module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0_out, mux1_out;
    mux2 mux0 ( sel[0],    a,    b, mux0_out );
    mux2 mux1 ( sel[0],    c,    d, mux1_out );
    mux2 mux2 ( sel[1], mux0_out, mux1_out,  out );

endmodule
