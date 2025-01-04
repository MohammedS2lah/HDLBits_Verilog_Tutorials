// * Exams/ece241 2013 q8 *
// -----------------------------------------------------

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter S0=0, S1=1, S2=2;
    
    reg [1:0] present_state, next_state;
    
    always @(posedge clk or negedge aresetn)
        begin
            if(~aresetn) present_state <= S0;
            else present_state <= next_state;
        end
    
    always @(*)
        begin
            z = 1'b0;
            case(present_state)
                S0: next_state = (x)? S1: S0;
                S1: next_state = (!x)? S2: S1;
            	S2: 
                    begin
                        if (x) 
                            begin
                               z = 1'b1;
                               next_state = S1;
                            end
                        else next_state = S0;
                    end
            endcase
        end

endmodule
