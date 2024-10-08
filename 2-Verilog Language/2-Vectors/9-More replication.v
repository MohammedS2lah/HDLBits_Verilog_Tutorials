//*Vector5*
//-------------------------------------------
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    //First solution
    assign out = ~{{ {5{a,b,c,d,e}} } ^ { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} }};
    
    //Second Solution
    /*
    wire [24:0] First_in, Second_in;
    assign First_in = {5{a,b,c,d,e}};
    assign Second_in = { {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };
    assign out = ~(First_in ^ Second_in);
    */

endmodule
