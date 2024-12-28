// * Exams/2014 q4b *
// -----------------------------------------------------

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF stage0 (.clk(KEY[0]), .w(LEDR[1]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));
    
    MUXDFF stage1 (.clk(KEY[0]), .w(LEDR[2]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    
    MUXDFF stage2 (.clk(KEY[0]), .w(LEDR[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));    
    
    MUXDFF stage3 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));    
    
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q);
   
    always @(posedge clk)
        begin
            case({E,L})
                2'b00: Q <= Q;
                2'b01: Q <= R;
                2'b10: Q <= w;
                2'b11: Q <= R;                
            endcase   
        end
    
endmodule
