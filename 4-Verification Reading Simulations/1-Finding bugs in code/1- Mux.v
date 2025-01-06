// * Bugs mux2 *
// -----------------------------------------------------

module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    // First Solution
    assign out = (sel)? a: b;  
    
    // Second Solution using replication operator
    //assign out = ( {8{sel}} & a) | ( {8{~sel}} & b);

endmodule
