// * Fsm serialdp *
// -----------------------------------------------------

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata
    parameter IDLE = 3'b000, START = 3'b001 , DATA = 3'b010, STOP = 3'b011, ERROR = 3'b100, PARITY = 3'b101;
    
    reg [2:0] present_state, next_state;
    reg [3:0] counter;
    reg [7:0] out_reg;
    
    wire parity_bit;
    
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
                DATA: 
                    begin
                        if(counter == 8) next_state = (in == ~parity_bit)? PARITY : ERROR;
                        else next_state = DATA;
                    end
                PARITY: next_state = (in)? STOP : ERROR;
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
    
    // New: Add parity checking.
    parity check (.clk(clk), .reset(reset | (next_state != DATA)), .in(in), .odd(parity_bit));    

endmodule
