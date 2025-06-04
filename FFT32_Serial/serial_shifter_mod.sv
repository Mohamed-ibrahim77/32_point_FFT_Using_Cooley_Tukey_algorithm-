module serial_shifter_mod (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,      // Load new data only when not shifting
    input  logic signed [15:0] data_in,
    output logic        out
);

    logic [15:0] shift_reg;
    logic  [3:0] shift_count;
    logic        shifting;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg   <= 16'd0;
            shift_count <= 4'd0;
            shifting    <= 0;
        end else begin
            if (!shifting && enable) begin
                // Load new data only when idle and enable is high
                shift_reg   <= data_in;
                shift_count <= 4'd1;
                shifting    <= 1;
            end else if (shifting) begin
                shift_reg <= shift_reg << 1;
                shift_count <= shift_count + 1;

                if (shift_count == 4'd15)
                    shifting <= 0; // Done after 16 shifts
            end
        end
    end

    assign out = shift_reg[15];

endmodule
