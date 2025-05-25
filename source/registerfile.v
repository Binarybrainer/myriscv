module registerfile#(
    parameter WIDTH = 32,
    parameter LENGTH = 10
)(
    //input
    input clk,
    input rst,
    input wire [0:LENGTH-1] address,
    input wire [0:WIDTH -1] write_data,
    input wire              write_enable,
    //output
    output [0:WIDTH-1] read_data
);
    reg [0:WIDTH-1]    regfile[0:LENGTH-1];
    reg [0:WIDTH-1] nx_regfile[0:LENGTH-1];
    genvar i;
    for (i=0; i<LENGTH; i=i+1)begin
        always @(posedge clk or negedge rst) begin
            if (rst) begin 
                regfile[i] <= {WIDTH{1'b0}};
            else begin
                regfile[i] <= nx_regfile[i];
            end
        end
    end
    always @(posedge clk or negedge rst) begin
        if (rst) begin
        end else begin
        end
    end
endmodule
