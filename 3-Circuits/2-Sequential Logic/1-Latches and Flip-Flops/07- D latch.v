// * Exams/m2014 q4a *
// -----------------------------------------------------

module top_module (
    input d, 
    input ena,
    output q);
    
    always @(*)
        begin
            if(ena) q <= d;
        end

endmodule
