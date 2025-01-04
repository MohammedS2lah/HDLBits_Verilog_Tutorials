// * Fsm ps2data *
// -----------------------------------------------------

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    parameter B1 = 2'b00, B2 = 2'b01, B3= 2'b10, DONE = 2'b11;

    reg [1:0] present_state, next_state;
    reg [23:0] out_reg;
    // State transition logic (combinational)
    always @(*)
        begin 
            case(present_state) 
                B1: next_state = (in[3])? B2 : B1;
                B2: next_state = B3;
                B3: next_state = DONE;
                DONE: next_state = (in[3])? B2 : B1;
                default: next_state = B1;  
            endcase
        end
    
    // State flip-flops (sequential)
    always @(posedge clk)
        begin
            if(reset) present_state <= B1;
            else present_state <= next_state;
        end
    
    // Output logic
    assign done = (present_state == DONE);
    
    // New: Datapath to store incoming bytes.
    always @(posedge clk)
        begin
            if(reset) out_reg <= 0;
            else out_reg <= {out_reg[15:0] ,in};
        end    
    
    assign out_bytes = (done)? out_reg : 24'b0;

endmodule
