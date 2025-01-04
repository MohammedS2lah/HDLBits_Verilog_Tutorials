// * Fsm hdlc *
// -----------------------------------------------------

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    parameter NONE=0, ONE=1, TWO=2, THREE=3, FOUR=4, FIVE=5, DISCARD=6, SIX=7, FLAG=8, ERROR=9;

    reg [3:0] present_state, next_state;
    
    always @(posedge clk)
        begin
            if (reset) present_state <= NONE;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            case(present_state)
                NONE: next_state = (in)? ONE: NONE;
                ONE: next_state = (in)? TWO: NONE;
                TWO: next_state = (in)? THREE: NONE;
                THREE: next_state = (in)? FOUR: NONE;
                FOUR: next_state = (in)? FIVE: NONE;
                FIVE: next_state = (in)? SIX: DISCARD;
                SIX: next_state = (in)? ERROR: FLAG;
                DISCARD: next_state = (in)? ONE: NONE;
                FLAG: next_state = (in)? ONE: NONE;
                ERROR: next_state = (in)? ERROR: NONE;
            endcase
        end
    
    // Output logic: 
    assign disc = (present_state == DISCARD);
    assign flag = (present_state == FLAG);
    assign err = (present_state == ERROR);

endmodule
