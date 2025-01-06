// * Exams/review2015 count1k *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    always @(posedge clk)
        begin
            if (reset)	q <= 'b0;
            else if (q == 999)	q <= 'b0;
            else q <= q + 1'b1;    
        end
    
endmodule
