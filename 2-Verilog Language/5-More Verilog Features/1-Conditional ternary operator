//*Conditional*
//-----------------------------------------------------
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] intermediate_result1, intermediate_result2;
    
    assign intermediate_result1 = (c<d)? c: d;
    
    assign intermediate_result2 = (b<intermediate_result1)? b : intermediate_result1;
    
    assign min = (a<intermediate_result2)? a : intermediate_result2;

endmodule
