// * Exams/review2015 fsmseq *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
	
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    
    reg [1:0] Present_state, Next_state;
    
    always @ (posedge clk)
        begin
            if(reset)	Present_state <= A;
            else		Present_state <= Next_state;            
        end   
    
    // Overlapping sequence detector
    always @(*)
        begin
            case(Present_state) 
            	A: Next_state = data? B: A;
                B: Next_state = data? C: A;
            	C: Next_state = data? C: D;
				D: Next_state = data? B: A;
                default: Next_state = A;
            endcase
        end       
    
    always @ (posedge clk)
        begin
            if(reset)	start_shifting <= 0;
            else if ((Present_state == D) && data)	
            			start_shifting <= 1;           
        end 
    
endmodule
