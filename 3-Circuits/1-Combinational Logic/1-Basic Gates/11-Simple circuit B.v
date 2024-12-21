// * Mt2015 q4b *
// -----------------------------------------------------

module top_module ( input x, input y, output z );

    //assign z = !(x ^ y);
    
    always @(*)
        begin
			z = !(x ^ y);
        end     
    
endmodule
