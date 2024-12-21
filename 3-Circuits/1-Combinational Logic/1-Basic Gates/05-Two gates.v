// * Exams/m2014 q4g *
// -----------------------------------------------------

module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    assign out = in3 ^ !(in1 ^ in2);

endmodule
