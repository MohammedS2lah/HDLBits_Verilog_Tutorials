// * Sim/circuit3 *
// -----------------------------------------------------

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    //assign q = (a & c) | (b & c) | (a & d) | (b & d); 
    
    assign q = (a | b) & (c | d); 

endmodule
