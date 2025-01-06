// * Exams/review2015 fsmshift *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    // First Solution, Using FSM
    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
    
    reg [2:0] Present_state, Next_state;
    
    always @ (posedge clk)
        begin
			Present_state <= Next_state;
        end
    
    always @ (*)
        begin
            case(Present_state)
                A: Next_state = reset? B: A;
            	B: Next_state = C;
                C: Next_state = D;    
                D: Next_state = E;    
                E: Next_state = A;    
        	endcase       
        end
	
    assign shift_ena = ((Present_state == B) || (Present_state == C) || (Present_state == D) || (Present_state == E));   
    
    // Second Solution
    /*
    reg [2:0] counter;
    
    always @ (posedge clk)
        begin
            if(reset)	
                begin
                	counter <= 0;
                    shift_ena <= 1'b1;
                end
            else
                begin
                    if (counter < 3)
                        begin
                        	shift_ena <= 1'b1;
                        	counter <= counter + 1'b1;
                        end
                    else shift_ena <= 1'b0;
                end
        end    
	*/
    
endmodule
