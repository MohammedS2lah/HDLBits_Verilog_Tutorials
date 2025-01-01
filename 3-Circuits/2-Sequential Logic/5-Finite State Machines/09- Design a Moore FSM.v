// * Exams/ece241 2013 q4 *
// -----------------------------------------------------

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S1_high_rate=3'b100, S2_high_rate=3'b101;
    
    reg [2:0] present_state, next_state;
    
    always @(posedge clk)
        begin
            if (reset) present_state <= S0;
            else present_state <= next_state;
        end
    
    always @(*)
        begin         
            case(present_state)
                S0: 
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b1111; 
                        if (s[1]) next_state = S1;
                        else next_state = S0;
                    end
                S1: 
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b0110; 
                        if (s[1] && s[2]) next_state = S2;
                        else if (s[1] && !s[2]) next_state = S1;
                        else next_state = S0;
                    end                
                S2: 
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b0010;    
                        if (s[2] && s[3]) next_state = S3;
                        else if (s[2] && !s[3]) next_state = S2;
                        else if (!s[2] && !s[3]) next_state = S1_high_rate;
                        else next_state = S2;
                    end
                S3:
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b0000; 
                        if (s[3]) next_state = S3;
                        else next_state = S2_high_rate;
                    end 
                S1_high_rate:
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b0111; 
                        if (s[1] && s[2]) next_state = S2;
                        else if (s[1] && !s[2]) next_state = S1_high_rate;
                        else next_state = S0;
                    end                    
                S2_high_rate:
                    begin
                        {fr3, fr2, fr1, dfr} = 4'b0011; 
                        if (s[2] && s[3]) next_state = S3;
                        else if (s[2] && !s[3]) next_state = S2_high_rate;
                        else if (!s[2] && !s[3]) next_state = S1_high_rate;
                        else next_state = S2_high_rate;
                    end                                
            endcase    
        end

endmodule
