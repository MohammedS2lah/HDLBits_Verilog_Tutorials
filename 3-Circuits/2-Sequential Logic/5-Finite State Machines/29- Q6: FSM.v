// * Exams/m2014 q6 *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101; 

    reg [2:0] present_state, next_state;
    
    always @(posedge clk)
        begin
            if(reset) present_state <= A;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            case(present_state) 
                A: next_state = (w)? A: B;
                B: next_state = (w)? D: C;
                C: next_state = (w)? D: E;
                D: next_state = (w)? A: F;
                E: next_state = (w)? D: E;
                F: next_state = (w)? D: C;
                default: next_state = A;
            endcase
        end    
    
    assign z = (present_state == E) || (present_state == F);    
    
endmodule
