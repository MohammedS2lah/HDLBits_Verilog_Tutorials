// * Kmap1 *
// -----------------------------------------------------

module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = b | c | a;
    
    //assign out = b | c | (a & !b);
    
endmodule
