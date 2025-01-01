// * Lemmings2 * 
// -----------------------------------------------------

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT = 2'b00, RIGHT = 2'b01, FALL_L = 2'b10, FALL_R = 2'b11;
    
    reg [1:0] present_state, next_state;    
    
    always @(*) begin
        // State transition logic
        case(present_state)
            LEFT: 
                begin
                    if(ground) next_state =(bump_left)? RIGHT : LEFT;
                    else next_state = FALL_L;
                end
            RIGHT: 
                begin
                    if(ground) next_state =(bump_right)? LEFT : RIGHT; 
                    else next_state = FALL_R;
                end
            FALL_L: next_state =(ground)? LEFT : FALL_L;
            FALL_R: next_state =(ground)? RIGHT : FALL_R;
            default: next_state = LEFT;
        endcase        
    end    

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) present_state <= LEFT;
        else present_state <= next_state;
    end

    // Output logic
    assign walk_left = (present_state == LEFT);
    assign walk_right = (present_state == RIGHT); 
    
    assign aaah = (present_state == FALL_R) || (present_state == FALL_L); 

endmodule
