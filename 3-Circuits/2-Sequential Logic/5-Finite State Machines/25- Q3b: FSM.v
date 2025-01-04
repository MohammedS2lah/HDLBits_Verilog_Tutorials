// * Exams/2014 q3bfsm *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
    
    reg [2:0] present_state, next_state;
    
    always @(posedge clk)
        begin
            if(reset) present_state <= S0;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            case(present_state) 
                S0: next_state = (x)? S1: S0;
                S1: next_state = (x)? S4: S1;
                S2: next_state = (x)? S1: S2;
                S3: next_state = (x)? S2: S1;
                S4: next_state = (x)? S4: S3;
            endcase
        end    
    
    assign z = (present_state == S3) || (present_state == S4);

endmodule
