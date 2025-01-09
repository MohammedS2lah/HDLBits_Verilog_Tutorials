// * Tb/clock *
// -----------------------------------------------------

module top_module ( );
    reg clk_tb;
    parameter clk_period = 10;
    
    dut uut (.clk(clk_tb));
    
    always begin
        #(clk_period/2) clk_tb = ~clk_tb; 
    end
    
    initial begin
       clk_tb = 0;
    end

endmodule
