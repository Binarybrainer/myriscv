module adder#(
    parameter WIDTH = 1
)(
    //input
    input wire [WIDTH-1:0]a,
    input wire [WIDTH-1:0]b,
    //output
    output wire cout,
    output wire [WIDTH-1:0] sum
);
wire [WIDTH-1:0]c;
genvar i; // general variable
generate
    for (i=0; i < WIDTH; i = i + 1) begin
        if(i==0)begin
            full_adder add(
                //input
                .a(a[0]),
                .b(b[0]),
                .cin(1'b0),
                //output
                .sum(sum[0]),
                .cout(c[0]) 
                );
        end
        else begin
            full_adder add(
                //input
                .a(a[i]),
                .b(b[i]),
                .cin(c[i-1]),
                //output
                .sum(sum[i]),
                .cout(c[i])
            );
        end
    end

endgenerate
assign cout = c[WIDTH-1];
endmodule

