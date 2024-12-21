// * Mt2015 q4a *
// -----------------------------------------------------

module top_module (input x, input y, output z);

    //assign z = (x^y) & x;
    
    always @(*)
        begin
		z = (x^y) & x;
        end    
    
endmodule
