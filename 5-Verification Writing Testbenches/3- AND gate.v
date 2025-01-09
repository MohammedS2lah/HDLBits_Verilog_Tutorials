// * Tb/and *
// -----------------------------------------------------

module top_module();
	
    reg in0, in1;
    wire out_tb;
    
    andgate uut (.in({in1,in0}), .out(out_tb));
    
    initial begin
       	in0 = 0;
        in1 = 0;
        
        #10 in0 = 1;
        
        #10 
        in0 = 0;
        in1 = 1;
        
        #10 in0 =1;
    end    
    
endmodule
