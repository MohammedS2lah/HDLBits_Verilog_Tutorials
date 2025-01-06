// * Exams/review2015 fancytimer *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	
	wire shift_ena, done_counting;
    
    complete_FSM FSM(.clk(clk), .reset(reset), .data(data), .shift_ena(shift_ena), 
					 .counting(counting), .done_counting(done_counting), .done(done), .ack(ack));
					 
	Counter_Shifter Counter(.clk(clk), .reset(reset), .shift_ena(shift_ena), .data(data), 
                            .q(count), .count_ena(counting), .done_counting(done_counting));
    
endmodule

//*FSM: The complete FSM*
module complete_FSM (
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


module Counter_Shifter (
    input clk,
    input reset,
    input shift_ena,
    input count_ena,
    input data,
    output done_counting,
    output [3:0] q);
    
    reg [9:0] count;
    
    always @(posedge clk)
        begin
            if (reset) count <= 0;
            
            else if (shift_ena)	q <= {q[2:0],data};
            
            else if (count_ena)
                begin
                    if (count < 999)    
                    	count <= count + 1'b1;
                    else
                        begin
                        	count <= 'b0;
                            q <= q - 1'b1;   
                        end
                end
        end

    assign done_counting = (q == 0 && count == 999);
    
endmodule
