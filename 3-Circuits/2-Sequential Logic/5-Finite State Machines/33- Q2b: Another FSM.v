// * Exams/2013 q2bfsm *
// -----------------------------------------------------

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    parameter A=4'b0000, A0=4'b0001, B1=4'b0010, B10=4'b0011, B101=4'b0100, G=4'b0101, G11=4'b110, G1=4'b0111, G0=4'b1000;
    
    reg [3:0] present_state, next_state;
    
    always @(posedge clk)
        begin
            if(~resetn) present_state <= A;
            else present_state <= next_state;
        end    

    always @(*)
        begin
            case(present_state) 
                A: next_state = (resetn)? A0: A;
                A0: next_state = B1;
                B1: next_state = (x)? B10: B1;
                B10: next_state = (x)? B10: B101;
                B101: next_state = (x)? G : B1;  
                G: next_state = (y)? G1: G11; 
                G11: next_state = (y)? G1: G0; 
                G1: next_state = (resetn)? G1 : A;     
                G0: next_state = (resetn)? G0 : A;    
            endcase
        end       
  
    always @(*)
        begin
          	g = 1'b0;
         	f = 1'b0;            
            case(present_state)  
                A0: f = 1'b1;
                G: g = 1'b1; 
                G11: g = 1'b1;  
                G1: g = 1'b1;      
				default: 
                    begin
                    	g = 1'b0;
                        f = 1'b0;
                    end
            endcase
        end          
    
endmodule
