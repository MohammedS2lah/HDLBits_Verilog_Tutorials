// * Exams/m2014 q4j *
// -----------------------------------------------------

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    //assign sum = x + y;
    
    wire [2:0] c_int;

    FA inst1 (.a(x[0]), .b(y[0]), .cin(1'b0), .cout(c_int[0]), .sum(sum[0]));
    
    FA inst2 (.a(x[1]), .b(y[1]), .cin(c_int[0]), .cout(c_int[1]), .sum(sum[1]));     
    
    FA inst3 (.a(x[2]), .b(y[2]), .cin(c_int[1]), .cout(c_int[2]), .sum(sum[2]));
    
    FA inst4 (.a(x[3]), .b(y[3]), .cin(c_int[2]), .cout(sum[4]), .sum(sum[3]));         
    
endmodule

module FA( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout, sum} = a + b + cin;

endmodule
