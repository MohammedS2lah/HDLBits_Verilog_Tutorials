// * Exams/review2015 shiftcount *
// -----------------------------------------------------

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    always @(posedge clk)
        begin
            if (shift_ena) 
                begin
                    /*
                    q[0] <= data;
                    q[1] <= q[0];
                    q[2] <= q[1];
                    q[3] <= q[2];
                    */
                    q <= {q[2:0],data};
                end
            else if (count_ena)
            	q <= q - 1'b1;
        end

endmodule
