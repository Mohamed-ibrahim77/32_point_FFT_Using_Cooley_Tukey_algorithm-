module ButterFly_MAC #( parameter         inWordWidth_1 = 16,
                        parameter         inWordWidth_2 = 16,
                        parameter         outWordWidth = 16)
(   input                                                             clk,
    input                                                             rst,
    input         signed  [inWordWidth_1 - 1 : 0]                     in1_real,   //s(7,8)
    input         signed  [inWordWidth_1 - 1 : 0]                     in1_imag,   //s(7,8)  
    input         signed  [inWordWidth_2 - 1 : 0]                     in2_real_twiddle, //s(7,8)  
    input         signed  [inWordWidth_2 - 1 : 0]                     in2_imag_twiddle, //s(7,8) 
    input         signed  [inWordWidth_2 - 1 : 0]                     in3_real,   //s(7,8)
    input         signed  [inWordWidth_2 - 1 : 0]                     in3_imag,   //s(7,8)

    output  logic signed  [15 : 0]  out1_mac_real, 
    output  logic signed  [15 : 0]  out1_mac_imag,  

    output  logic signed  [15 : 0]  out2_mac_real, 
    output  logic signed  [15 : 0]  out2_mac_imag  
);
// widths need to br modified
reg signed [16:0] out1_real;
reg signed [16:0] out1_imag;

reg signed [16:0] out2_real;
reg signed [16:0] out2_imag;

/////////////////////////////////////////////////////////////////////////////////////////
wire signed [inWordWidth_1 : 0] ab = in3_real + in3_imag;  //s(8,8)
wire signed [inWordWidth_2 : 0] dc = in2_imag_twiddle - in2_real_twiddle;  //s(8,8)
wire signed [inWordWidth_2 : 0] cd = in2_real_twiddle + in2_imag_twiddle;  //s(8,8)

wire signed [inWordWidth_1 + inWordWidth_2 - 1 : 0] k1 = in2_real_twiddle * ab; //s(7,8) * S(8,8) -> S(15,16)
wire signed [inWordWidth_1 + inWordWidth_2 - 1 : 0] k2 = in3_real * dc; //s(7,8) * S(8,8) -> S(15,16)
wire signed [inWordWidth_1 + inWordWidth_2 - 1 : 0] k3 = in3_imag * cd; //s(7,8) * S(8,8) -> S(15,16)

wire signed [inWordWidth_1 + inWordWidth_2 : 0] out_real_comp = k1-k3; // S(15,16) + S(15,16) -> S(16,16)
wire signed [inWordWidth_1 + inWordWidth_2 : 0] out_imag_comp = k1+k2; // S(15,16) + S(15,16) -> S(16,16)

////////////////////////////////////////////////////////////////////////////////////////////

//multiplication rounder
wire signed [15:0] out_real_comp_q;
wire signed [15:0] out_imag_comp_q;
round_sat #(17, 16, 8, 8) u1_rs (out_real_comp, out_real_comp_q);
round_sat #(17, 16, 8, 8) u2_rs (out_imag_comp, out_imag_comp_q);


// out 1
wire signed [15:0] out1_real_q;
wire signed [15:0] out1_imag_q;
round_sat #(9, 8, 8, 8) uOut1_rs_Re (out1_real, out1_real_q);
round_sat #(9, 8, 8, 8) uOut1_rs_IM (out1_imag, out1_imag_q);

// out 2
wire signed [15:0] out2_real_q;
wire signed [15:0] out2_imag_q;
round_sat #(9, 8, 8, 8) uOut2_rs_Re (out2_real, out2_real_q);
round_sat #(9, 8, 8, 8) uOut2_rs_IM (out2_imag, out2_imag_q);

///////////////////////////////////////////////////////////////////////////////////////////////
always @(posedge clk or negedge rst) begin
        if (!rst) begin
            out1_real     <= 17'b0;
            out1_imag     <= 17'b0;
            out2_real     <= 17'b0;
            out2_imag     <= 17'b0;
        end
        else begin
            out1_real   <= in1_real + out_real_comp_q;  //S(18,27)
            out1_imag   <= in1_imag + out_imag_comp_q;  //S(18,27)

            out2_real   <= in1_real - out_real_comp_q;  //S(18,27)
            out2_imag   <= in1_imag - out_imag_comp_q;  //S(18,27)
        end
    end
/*always @(*) begin

            out1_real   = in1_real + out_real_comp_q;  //S(18,27)
            out1_imag   = in1_imag + out_imag_comp_q;  //S(18,27)

            out2_real   = in1_real - out_real_comp_q;  //S(18,27)
            out2_imag   = in1_imag - out_imag_comp_q;  //S(18,27)
end*/


assign out1_mac_real = out1_real_q;
assign out1_mac_imag = out1_imag_q;

assign out2_mac_real = out2_real_q;
assign out2_mac_imag = out2_imag_q;

endmodule
