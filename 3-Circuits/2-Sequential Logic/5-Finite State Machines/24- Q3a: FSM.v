// * Exams/2014 q3fsm *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    parameter A=1'b0, B=1'b1;
    reg present_state, next_state;
    reg [1:0] cycles_counter, ones_counter;
    
    always @(posedge clk)
        begin
            if(reset) present_state <= A;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            case(present_state) 
                A: next_state = (s)? B: A;
                B: next_state = B;
            endcase
        end
    
    always @(posedge clk)
        begin
            if(reset) 
                begin
                	cycles_counter = 0;
                    ones_counter = 0;
                end
			else if(present_state == B)
                begin
                    if(cycles_counter == 3)
                        begin
                        	cycles_counter = 0;
                    		ones_counter = 0;   
                        end
                    if(w) ones_counter = ones_counter +1'b1;
                    cycles_counter = cycles_counter +1'b1;
                end
        end    
    
    assign z = ((cycles_counter == 3) && (ones_counter == 2));

endmodule
