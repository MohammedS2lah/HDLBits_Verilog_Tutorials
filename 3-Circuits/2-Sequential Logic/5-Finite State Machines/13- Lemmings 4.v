// * Lemmings4 *
// -----------------------------------------------------

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT = 3'b000, RIGHT = 3'b001, FALL_L = 3'b010, FALL_R = 3'b011, DIG_L = 3'b100, DIG_R = 3'b101, SPLAT = 3'b110;
    
    reg [2:0] present_state, next_state;    
    
    reg [6:0] counter;
    
    always @(*) begin
        // State transition logic
        case(present_state)
            LEFT: 
                begin
                    if (!ground) next_state = FALL_L;
                    else if(dig && ground) next_state = DIG_L;
                    else next_state = (bump_left)? RIGHT : LEFT;
                end
            RIGHT: 
                begin
                    if (!ground) next_state = FALL_R;
                    else if(dig && ground) next_state = DIG_R;
                    else next_state = (bump_right)? LEFT : RIGHT; 
                end
            FALL_L: next_state = (ground)? ((counter > 19)? SPLAT : LEFT) : FALL_L;
            FALL_R: next_state = (ground)? ((counter > 19)? SPLAT : RIGHT) : FALL_R;
            DIG_L: next_state = (!ground)? FALL_L : DIG_L;
            DIG_R: next_state = (!ground)? FALL_R : DIG_R;
            SPLAT: next_state = SPLAT;
            default: next_state = LEFT;
        endcase        
    end    

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) present_state <= LEFT;
        else present_state <= next_state;
    end   
    
    always @(posedge clk, posedge areset) begin
        if(areset) counter <= 0;
        else if((present_state == FALL_R) || (present_state == FALL_L)) counter <= counter + 1'b1;
        else counter <= 0;
    end

    // Output logic
    assign walk_left = (present_state == LEFT);
    assign walk_right = (present_state == RIGHT); 
    
    assign aaah = (present_state == FALL_R) || (present_state == FALL_L);   
    assign digging = (present_state == DIG_R) || (present_state == DIG_L);    

endmodule
