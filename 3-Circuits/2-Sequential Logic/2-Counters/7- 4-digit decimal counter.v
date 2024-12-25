// * Countbcd *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    decade_count Counter0 (.clk(clk), .ena(1'b1) , .reset(reset), .q(q[3:0]));

    decade_count Counter1 (.clk(clk), .ena(ena[1]) , .reset(reset), .q(q[7:4]));    
    
    decade_count Counter2 (.clk(clk), .ena(ena[2]) , .reset(reset), .q(q[11:8])); 
    
    decade_count Counter3 (.clk(clk), .ena(ena[3]) , .reset(reset), .q(q[15:12]));    

    assign ena = {(q[11:8] == 4'd9) & ena[1] & ena[2], (q[7:4] == 4'd9) & ena[1], (q[3:0] == 4'd9)};   
    
endmodule


module decade_count (
    input clk,
    input reset,        // Synchronous active-high reset
    input ena,
    output [3:0] q);

    always @(posedge clk)
        begin
            if(reset)
                q <= 0;
            else if(q == 4'd9 && ena)
                q <= 0;
            else if(ena)
            	q <= q + 1'b1;  
        end    
    
endmodule
