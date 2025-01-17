// * Fsm serialdata *
// -----------------------------------------------------

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter IDLE = 3'b000, START = 3'b001 , DATA = 3'b010, STOP = 3'b011, ERROR = 3'b100;
    
    reg [2:0] present_state, next_state;
    reg [3:0] counter;
    reg [7:0] out_reg;
    
    always @(posedge clk)
        begin
            if (reset) present_state <= IDLE;
            else present_state <= next_state;
        end

    always @(posedge clk)
        begin
            if (reset) counter <= 0;
            else if(next_state == DATA) counter <= counter + 1'b1;
            else counter <= 0;
        end    
    
    always @(*)
        begin
            case(present_state) 
                IDLE: next_state = (in)? IDLE : START;
                START: next_state = DATA;
                DATA: //next_state = ((counter == 8) && in)? STOP : DATA;
                    begin
                        if(counter == 8) next_state = (in)? STOP : ERROR;
                        else next_state = DATA;
                    end
                ERROR: next_state = (in)? IDLE : ERROR;
            	STOP: next_state = (in)? IDLE : START;
            endcase
        end
   
    assign done = (present_state == STOP);

    // New: Datapath to latch input bits. 
    always @(posedge clk)
        begin
            if(reset) out_reg <= 0;
            else if(next_state == DATA) out_reg <= {in, out_reg[7:1]};
        end    
    
    assign out_byte = (done)? out_reg : 8'b0;    

endmodule
