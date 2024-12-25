// * Count clock *
// -----------------------------------------------------

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    always @(posedge clk)
        begin
            
            if(reset)
                begin
                	pm <= 1'b0;
            		ss <= 0;
                    mm <= 0;
                    hh <= 8'h12;
                end
                    
            else if (ena)
                begin
                   ss <= ss + 1'b1;
                    if ((ss[3:0] == 4'h9) & (ss != 8'h59)) 
                        begin
                        	ss[7:4] <= ss[7:4] + 1'b1;
                            ss[3:0] <= 4'h0;
                        end
                    else if (ss == 8'h59)
                        begin
                          ss <= 0;  
                          mm <= mm + 1'b1;
                            if ((mm[3:0] == 4'h9) & (mm != 8'h59)) 
                                begin
                                    mm[7:4] <= mm[7:4] + 1'b1;
                                    mm[3:0] <= 4'h0;
                                end
                            else if (mm == 8'h59)
                                begin
                                    mm <= 0;
                                    hh <= hh + 1'b1;
                                    if (hh[3:0] == 4'h9) 
                                        begin
                                        	hh[7:4] <= hh[7:4] + 1'b1;
                                            hh[3:0] <= 4'h0;
                                        end

                                    else if (hh == 8'h11) 
                                        begin
                                        	pm <= ~pm;
                                        end 

                                    else if (hh == 8'h12) 
                                        begin
                                        	hh <= 8'h1;
                                        end
                                end 
                        end
                    
                end
            
        end    

endmodule
