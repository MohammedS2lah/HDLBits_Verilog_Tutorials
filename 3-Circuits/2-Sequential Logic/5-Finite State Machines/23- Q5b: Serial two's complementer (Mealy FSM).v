// * Exams/ece241 2014 q5b *
// -----------------------------------------------------

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    //Using the given STD
    parameter A=1'b0, B=1'b1;
    
    reg present_state, next_state;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset) present_state <= A;
            else present_state <= next_state;
        end  
    
    always @(*)
        begin
            case(present_state) 
                A: next_state = (x)? B: A;
                B: next_state = B;
            endcase
        end
    
    assign z = (~present_state && x) || (present_state && ~x);
    
    /*
    //Another Solution
    parameter pre_invert=1'b0, invert=1'b1; 
    
    reg present_state, next_state;
    reg out_reg;
    
    always @(posedge clk or posedge areset)
        begin
            if(areset) 
                begin
                	present_state <= pre_invert;
                    z <= 0;
                end
            else 
                begin
                	present_state <= next_state;
                    z <= out_reg;
                end 
        end
    
    always @(*)
        begin
            case(present_state) 
            	pre_invert:
                    begin
                        out_reg = x;
                        next_state = (x)? invert: pre_invert;
                    end
                invert: 
                    begin
                       	out_reg = ~x; 
                        next_state = invert;
                    end
            endcase
        end     
    */
endmodule
