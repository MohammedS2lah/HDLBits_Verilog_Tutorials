// * Exams/ece241 2014 q7a *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    
    count4 the_counter (.clk(clk), .enable(c_enable), .load(c_load), .d(c_d));
    
    always @(posedge clk)
        begin       
            if (reset | (enable & (Q == 12))) 
                begin
                	Q <= 1;
                end
            else if (enable) Q <= Q + 1'b1;  
        end
    
    assign c_enable = enable;
    assign c_load = (reset | ((Q == 12) & enable));    
    assign c_d = c_load;

endmodule
