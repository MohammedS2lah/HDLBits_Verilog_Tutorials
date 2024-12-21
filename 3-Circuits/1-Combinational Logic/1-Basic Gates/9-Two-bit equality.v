// * Mt2015 eq2 *
// -----------------------------------------------------

module top_module ( input [1:0] A, input [1:0] B, output z ); 
    
    //assign z = (A == B)? 1'b1: 1'b0;
    
    always @(*)
        begin
            if(A == B) z = 1'b1;
            else z = 1'b0;
        end
    
endmodule
