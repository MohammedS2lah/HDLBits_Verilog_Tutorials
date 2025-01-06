// * Exams/review2015 fsm *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    localparam  S=4'b0000, 		S1=4'b0001,
    			S11=4'b0010, 	S110=4'b0011,
    			B0=4'b0100, 	B1=4'b0101,
    			B2=4'b0110, 	B3=4'b0111,
    			Count=4'b1000, 	Wait=4'b1001;
    
    reg [3:0] Present_state, Next_state;
    
    always @ (posedge clk)
        begin
            if(reset) 	Present_state <= S;
            else 		Present_state <= Next_state;
        end

    always @(*)
        begin
            case(Present_state)
                S:		Next_state = data? S1: S;
            	S1:		Next_state = data? S11: S;
                S11:	Next_state = data? S11: S110;
                S110:	Next_state = data? B0: S;
                B0:		Next_state = B1;
            	B1:		Next_state = B2;
                B2:		Next_state = B3;
                B3:		Next_state = Count;
                Count:	Next_state = done_counting? Wait: Count;
            	Wait:	Next_state = ack? S: Wait;
                default: Next_state = S;
            endcase
        end
    
    assign shift_ena = ((Present_state==B0) || (Present_state==B1) || (Present_state==B2) || (Present_state==B3));
    
    assign counting = (Present_state==Count);
    
    assign done = (Present_state==Wait);
    
endmodule
