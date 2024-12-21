// * Truthtable1 *
// -----------------------------------------------------

module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    
    //Without optimization
    //assign f = (!x3 & x2 & !x1) | (!x3 & x2 & x1) | (x3 & !x2 & x1) | (x3 & x2 & x1);
	
    //With optimization 
    assign f = (x3 & x1) | (!x3 & x2);
    
endmodule
