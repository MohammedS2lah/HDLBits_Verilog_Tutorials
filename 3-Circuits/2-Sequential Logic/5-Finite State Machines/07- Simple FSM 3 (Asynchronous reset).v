// * FSM3 *
// -----------------------------------------------------

module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	
    reg [1:0] present_state, next_state;

    // State flip-flops with asynchronous reset    
    always @(posedge clk or posedge areset)   
        begin
            if(areset) present_state <= A;
            else present_state <= next_state;
        end
    
    // State transition logic
    always @(*)
        begin
            case (present_state)
                A: next_state = (in)? B : A;
                B: next_state = (in)? B : C;
                C: next_state = (in)? D : A;
                D: next_state = (in)? B : C;
                default: next_state = A;
            endcase            
        end

    // Output logic
    assign out = (present_state == D);     

endmodule
