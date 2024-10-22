*Bcdadd100*
-----------------------------------------------------
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    genvar i;
    
    wire [99:0] cout_int;
    
    bcd_fadd BCD_Adder0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(cout_int[0]), .sum(sum[3:0]));
    
    generate
        for (i=4; i<$bits(sum); i=i+4)
            begin: BCD_1to99_adders
                bcd_fadd BCD_Adders (.a(a[i+3:i]), .b(b[i+3:i]), .cin(cout_int[(i/4)-1]), .cout(cout_int[(i/4)]), .sum(sum[i+3:i])); 
            end
    endgenerate
    
    assign cout = cout_int[99];
    
endmodule
