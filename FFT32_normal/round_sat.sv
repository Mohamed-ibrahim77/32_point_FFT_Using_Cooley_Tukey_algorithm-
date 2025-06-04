module round_sat #(
    parameter int I1 = 3,  // Input integer bits (including sign)
    parameter int F1 = 2,  // Input fractional bits
    parameter int I2 = 2,  // Output integer bits (including sign)
    parameter int F2 = 1   // Output fractional bits
) (
    input  logic signed [I1+F1-1:0] data_in,  // S(I1,F1)
    output logic signed [I2+F2-1:0] data_out  // S(I2,F2)
);

    // Total bit widths
    localparam int IN_WIDTH  = I1 + F1;
    localparam int OUT_WIDTH = I2 + F2;

    // Calculate fractional bits to be rounded
    localparam int F_DIFF = F1 - F2;

    // Rounding constant: 0.5 * LSB of output in input's scale
    localparam logic signed [IN_WIDTH-1:0] ROUND_CONST = 
        (F_DIFF > 0) ? (1 << (F_DIFF - 1)) : 0;

    // Internal signals for rounding
    logic signed [IN_WIDTH:0]          rounded_ext;  
    logic signed [IN_WIDTH:0]         rounded_value; 

    // Rounding logic
    always@(data_in) begin
        if (F_DIFF > 0) begin
            rounded_ext = data_in + ROUND_CONST;
            rounded_value = rounded_ext >>> F_DIFF; 
        end else begin
            rounded_value = data_in;
        end
    end

    // Saturation limits
    localparam logic signed [OUT_WIDTH-1:0] MAX_POS = (1 << (I2-1 + F2)) - 1;
    localparam logic signed [OUT_WIDTH-1:0] MIN_NEG = -(1 << (I2-1 + F2));

    // Saturation logic
    always_comb begin
        if ($signed(rounded_value) > $signed(MAX_POS)) begin
            data_out = MAX_POS;
        end else if ($signed(rounded_value) < $signed(MIN_NEG)) begin
            data_out = MIN_NEG;
        end else begin
            data_out = rounded_value[OUT_WIDTH-1:0];
        end
    end

endmodule
