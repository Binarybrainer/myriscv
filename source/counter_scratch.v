module counter_scratch#(
    //parameter
    parameter WIDTH = 1
)(
    //input
    input wire rst,
    input wire clk,
    //output
    output reg [0:WIDTH-1] count
);
wire [0:WIDTH-1] nx_count;
always @(posedge clk or negedge rst) begin
    if (rst) begin
        count <= 'd0;
    end
    else begin
        count <= nx_count;
    end
end

adder #(.WIDTH(WIDTH)) adder1(
    .a(count),
    .b('d1),

    .sum(nx_count),
    .cout()
);

endmodule

