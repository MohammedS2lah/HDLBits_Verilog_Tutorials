// * Tb/tb2 *
// -----------------------------------------------------

module top_module();

    parameter clk_period = 10;
    
    reg clk_tb;
    reg in_tb;
    reg [2:0] s_tb;
    wire out_tb;  
    
    q7 uut (.clk(clk_tb), .in(in_tb), .s(s_tb), .out(out_tb));
    
    always begin
        #(clk_period/2)  clk_tb = ~clk_tb;
    end
    
    initial begin
        clk_tb = 0;
        in_tb = 0;
        s_tb = 2;
        
        #10 s_tb = 6;
        
        #10
        s_tb = 2;
        in_tb = 1;
        
        #10
        s_tb = 7;
        in_tb = 0;
        
        #10
        s_tb = 0;
        in_tb = 1;
        
        #30 in_tb = 0;
    end 
    
endmodule
