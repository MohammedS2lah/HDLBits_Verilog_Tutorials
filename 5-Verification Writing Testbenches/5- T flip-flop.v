// * Tb/tff *
// -----------------------------------------------------

module top_module ();
    
    parameter clk_period = 10;
    
    reg clk_tb, reset_tb;
    reg t_tb;
    wire q_tb;  
    
    tff uut (.clk(clk_tb), .reset(reset_tb), .t(t_tb), .q(q_tb));
    
    always begin
        #(clk_period/2)  clk_tb = ~clk_tb;
    end
    
    initial begin
        clk_tb = 0;
        reset_tb = 1;
        t_tb = 0;
        
        #(1.3*clk_period) reset_tb = 0;
        
        #(clk_period) t_tb = 1;
    end 
    
endmodule
