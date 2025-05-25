module tb;
reg clk;
reg rst;
initial begin
    #0 rst = 0;
    #10 rst = 1;
    #20 rst = 0;
end
always #5 clk = !clk;
parameter WIDTH =4
reg  [0:WIDTH-1]a,b;
wire [0:WIDTH-1]sum;
wire cout;
adder adder1 #(.WIDTH(WIDTH))(
    .a(a),
    .b(b),

    .cout(cout),
    .sum(sum)

)
