// * Exams/m2014 q6b *
// -----------------------------------------------------

module top_module (
    input [3:1] y,
    input w,
    output Y2);

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    
    reg [3:1] next_state;  
    
    always @(*)
        begin
            next_state = A;
            case(y) 
                A: next_state = (w)? A: B;
                B: next_state = (w)? D: C;
                C: next_state = (w)? D: E;
                D: next_state = (w)? A: F;
                E: next_state = (w)? D: E;
                F: next_state = (w)? D: C;
                default: next_state = A;
            endcase
        end    
    
    assign Y2 = next_state[2];        
    
endmodule
