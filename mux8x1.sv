module mux8x1 (
    input [7:0] data [7:0], // 8 input data lines
    input [2:0] select,
    output reg [7:0] out
);

always @(*) begin
    case (select)
        3'b000: out = data[0];
        3'b001: out = data[1];
        3'b010: out = data[2];
        3'b011: out = data[3];
        3'b100: out = data[4];
        3'b101: out = data[5];
        3'b110: out = data[6];
        3'b111: out = data[7];
        default: out = 8'h00; // Default case, output 0 if select is invalid
    endcase
end

endmodule
