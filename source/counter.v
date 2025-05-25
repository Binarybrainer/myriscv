module counter(clk,reset,out);
    parameter WIDTH = 8;
    //Input signal
    input wire clk;
    input wire reset;
    
    //output signal
    output reg [0:WIDHT-1] out;
    
    always @(posedge clk or negedge reset) begin
        if (reset) begin 
            out <= 0;
        end else if begin
            out <= out+1;
        end 
	end

    end 
    
endmodule
