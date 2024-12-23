// * Kmap4 *
// -----------------------------------------------------

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    //assign out = (!a&b&!c&!d)|(a&!b&!c&!d)|(!a&!b&!c&d)|(a&b&!c&d)|(!a&b&c&d)|(a&!b&c&d)|(!a&!b&c&!d)|(a&b&c&!d);
    
    //assign out = a^b^c^d;
    
    assign out = (a^b)^(c^d);

endmodule
