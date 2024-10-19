//*Module addsub*
//-----------------------------------------------------
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] XORed_b;
    
    wire cin;
    
    assign XORed_b = b ^ ({32{sub}});
    
    add16 Lower_Adder (	.a(a[15:0]), .b(XORed_b[15:0]), .cin(sub), .cout(cin), .sum(sum[15:0]) );
    
    add16 Upper_Adder (	.a(a[31:16]), .b(XORed_b[31:16]), .cin(cin), .sum(sum[31:16]) );

endmodule
