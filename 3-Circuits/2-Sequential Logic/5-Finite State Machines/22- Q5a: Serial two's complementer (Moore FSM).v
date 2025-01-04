// * Exams/ece241 2014 q5a *
// -----------------------------------------------------

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0=2'b00, S1=1'b01, S2=2'b10; 
    
    reg [1:0] present_state, next_state;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset) present_state <= S0;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            case(present_state) 
                S0: next_state = (x)? S1: S0;
                S1: next_state = (x)? S2: S1;
				S2: next_state = (x)? S2: S1;
            endcase
        end 
    
    assign z = (present_state == S1);

endmodule
