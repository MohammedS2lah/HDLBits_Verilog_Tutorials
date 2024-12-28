// * Fsm1s *
// -----------------------------------------------------
// Note the Verilog-1995 module declaration syntax here:

module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=1'b0, B=1'b1; 

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
        end 
        else present_state <= next_state;   
    end

    always @(*)
        begin
            case (present_state)
                A: 
                    begin
                    	next_state = (in)? A : B;
                    	out = 1'b0;
                	end
                B: 
                    begin
                    	next_state = (in)? B : A;
                      	out = 1'b1;  
                    end
                default: 
                    begin
                   	 	next_state = B;
                       	out = 1'b1; 
                    end
            endcase
        end                        
    
endmodule
