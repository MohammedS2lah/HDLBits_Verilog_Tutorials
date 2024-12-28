// * Exams/m2014 q4k *
// -----------------------------------------------------

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] register;
    
    always @(posedge clk)
        begin
            if(~resetn)
                begin
                   //out <= 0;
                   register <= 0;
                end
            else 
        		begin
                    register <= {register[2:0] , in};
                    /*
                    register[0] <= in;
                    register[1] <= register[0];
                    register[2] <= register[1];
                    register[3] <= register[2];
                    */
                    //out <= register[2];
                    
                end
        end

    assign out = register[3];
    
endmodule
