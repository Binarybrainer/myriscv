module full_adder(
    //input 
    input wire a,
    input wire b,
    input wire cin,
    //output
    output wire cout,
    output wire sum

);
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

endmodule

