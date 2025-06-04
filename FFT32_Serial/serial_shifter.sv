module parallel_2_serial (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,

    input  logic signed [15:0] real_0,  real_1,  real_2,  real_3,  real_4,  real_5,  real_6,  real_7,
    input  logic signed [15:0] real_8,  real_9,  real_10, real_11, real_12, real_13, real_14, real_15,
    input  logic signed [15:0] real_16, real_17, real_18, real_19, real_20, real_21, real_22, real_23,
    input  logic signed [15:0] real_24, real_25, real_26, real_27, real_28, real_29, real_30, real_31,

    input  logic signed [15:0] imag_0,  imag_1,  imag_2,  imag_3,  imag_4,  imag_5,  imag_6,  imag_7,
    input  logic signed [15:0] imag_8,  imag_9,  imag_10, imag_11, imag_12, imag_13, imag_14, imag_15,
    input  logic signed [15:0] imag_16, imag_17, imag_18, imag_19, imag_20, imag_21, imag_22, imag_23,
    input  logic signed [15:0] imag_24, imag_25, imag_26, imag_27, imag_28, imag_29, imag_30, imag_31,

    output logic        real_out [0:31],
    output logic        imag_out [0:31]
);

    // real shifter instances
    serial_shifter_mod u_real_0  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_0),  .out(real_out[0]));
    serial_shifter_mod u_real_1  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_1),  .out(real_out[1]));
    serial_shifter_mod u_real_2  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_2),  .out(real_out[2]));
    serial_shifter_mod u_real_3  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_3),  .out(real_out[3]));
    serial_shifter_mod u_real_4  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_4),  .out(real_out[4]));
    serial_shifter_mod u_real_5  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_5),  .out(real_out[5]));
    serial_shifter_mod u_real_6  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_6),  .out(real_out[6]));
    serial_shifter_mod u_real_7  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_7),  .out(real_out[7]));
    serial_shifter_mod u_real_8  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_8),  .out(real_out[8]));
    serial_shifter_mod u_real_9  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_9),  .out(real_out[9]));
    serial_shifter_mod u_real_10 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_10), .out(real_out[10]));
    serial_shifter_mod u_real_11 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_11), .out(real_out[11]));
    serial_shifter_mod u_real_12 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_12), .out(real_out[12]));
    serial_shifter_mod u_real_13 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_13), .out(real_out[13]));
    serial_shifter_mod u_real_14 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_14), .out(real_out[14]));
    serial_shifter_mod u_real_15 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_15), .out(real_out[15]));
    serial_shifter_mod u_real_16 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_16), .out(real_out[16]));
    serial_shifter_mod u_real_17 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_17), .out(real_out[17]));
    serial_shifter_mod u_real_18 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_18), .out(real_out[18]));
    serial_shifter_mod u_real_19 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_19), .out(real_out[19]));
    serial_shifter_mod u_real_20 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_20), .out(real_out[20]));
    serial_shifter_mod u_real_21 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_21), .out(real_out[21]));
    serial_shifter_mod u_real_22 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_22), .out(real_out[22]));
    serial_shifter_mod u_real_23 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_23), .out(real_out[23]));
    serial_shifter_mod u_real_24 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_24), .out(real_out[24]));
    serial_shifter_mod u_real_25 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_25), .out(real_out[25]));
    serial_shifter_mod u_real_26 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_26), .out(real_out[26]));
    serial_shifter_mod u_real_27 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_27), .out(real_out[27]));
    serial_shifter_mod u_real_28 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_28), .out(real_out[28]));
    serial_shifter_mod u_real_29 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_29), .out(real_out[29]));
    serial_shifter_mod u_real_30 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_30), .out(real_out[30]));
    serial_shifter_mod u_real_31 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(real_31), .out(real_out[31]));

    // Serial shifter instantiations
    serial_shifter_mod u_imag_0  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_0),  .out(imag_out[0]));
    serial_shifter_mod u_imag_1  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_1),  .out(imag_out[1]));
    serial_shifter_mod u_imag_2  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_2),  .out(imag_out[2]));
    serial_shifter_mod u_imag_3  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_3),  .out(imag_out[3]));
    serial_shifter_mod u_imag_4  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_4),  .out(imag_out[4]));
    serial_shifter_mod u_imag_5  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_5),  .out(imag_out[5]));
    serial_shifter_mod u_imag_6  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_6),  .out(imag_out[6]));
    serial_shifter_mod u_imag_7  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_7),  .out(imag_out[7]));
    serial_shifter_mod u_imag_8  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_8),  .out(imag_out[8]));
    serial_shifter_mod u_imag_9  (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_9),  .out(imag_out[9]));
    serial_shifter_mod u_imag_10 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_10), .out(imag_out[10]));
    serial_shifter_mod u_imag_11 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_11), .out(imag_out[11]));
    serial_shifter_mod u_imag_12 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_12), .out(imag_out[12]));
    serial_shifter_mod u_imag_13 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_13), .out(imag_out[13]));
    serial_shifter_mod u_imag_14 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_14), .out(imag_out[14]));
    serial_shifter_mod u_imag_15 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_15), .out(imag_out[15]));
    serial_shifter_mod u_imag_16 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_16), .out(imag_out[16]));
    serial_shifter_mod u_imag_17 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_17), .out(imag_out[17]));
    serial_shifter_mod u_imag_18 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_18), .out(imag_out[18]));
    serial_shifter_mod u_imag_19 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_19), .out(imag_out[19]));
    serial_shifter_mod u_imag_20 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_20), .out(imag_out[20]));
    serial_shifter_mod u_imag_21 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_21), .out(imag_out[21]));
    serial_shifter_mod u_imag_22 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_22), .out(imag_out[22]));
    serial_shifter_mod u_imag_23 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_23), .out(imag_out[23]));
    serial_shifter_mod u_imag_24 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_24), .out(imag_out[24]));
    serial_shifter_mod u_imag_25 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_25), .out(imag_out[25]));
    serial_shifter_mod u_imag_26 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_26), .out(imag_out[26]));
    serial_shifter_mod u_imag_27 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_27), .out(imag_out[27]));
    serial_shifter_mod u_imag_28 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_28), .out(imag_out[28]));
    serial_shifter_mod u_imag_29 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_29), .out(imag_out[29]));
    serial_shifter_mod u_imag_30 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_30), .out(imag_out[30]));
    serial_shifter_mod u_imag_31 (.clk(clk), .rst_n(rst_n), .enable(enable), .data_in(imag_31), .out(imag_out[31]));

endmodule
