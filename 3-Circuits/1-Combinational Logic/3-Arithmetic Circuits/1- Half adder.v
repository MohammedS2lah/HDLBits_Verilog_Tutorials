// * Hadd *
// -----------------------------------------------------

module top_module( 
    input a, b,
    output cout, sum );
    
    //assign sum = a ^ b;
    
    //assign cout = a & b;
    
    assign {cout,sum} = a + b;

endmodule
