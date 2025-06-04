module FFT_Top #(   parameter         TWIDDLE_LENGTH = 16,
                   	parameter         RAM_DEPTH = 16,
					parameter         IN_ELEMENT_LENGTH = 8,
					parameter         OUT_WORD_WIDTH  = 16
)
(
	input logic  						   clk,    // Clock
	input logic  						   clk_en, // Clock Enable
	input logic  						   rst,  // Asynchronous reset active low
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_0, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_1, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_2, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_3, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_4, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_5, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_6, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_7, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_8, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_9, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_10, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_11, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_12, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_13, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_14, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_15, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_16,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_17,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_18,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_19,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_20,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_21,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_22,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_23,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_24,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_25,  
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_26, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_27, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_28, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_29, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_30, 
	input logic signed [IN_ELEMENT_LENGTH-1:0] in_31,
	
    output logic        out_real [0:31],
    output logic        out_imag [0:31]    
);

logic signed [TWIDDLE_LENGTH-1:0] Twiddle_ram_real [RAM_DEPTH-1:0];
logic signed [TWIDDLE_LENGTH-1:0] Twiddle_ram_imag [RAM_DEPTH-1:0];

reg  [2:0] Stage_counter;


// output without parallel_2_serial
logic signed [OUT_WORD_WIDTH-1:0] out_0_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_1_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_2_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_3_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_4_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_5_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_6_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_7_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_8_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_9_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_10_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_11_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_12_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_13_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_14_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_15_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_16_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_17_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_18_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_19_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_20_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_21_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_22_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_23_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_24_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_25_real;  
logic signed [OUT_WORD_WIDTH-1:0] out_26_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_27_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_28_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_29_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_30_real; 
logic signed [OUT_WORD_WIDTH-1:0] out_31_real;	  

logic signed [OUT_WORD_WIDTH-1:0] out_0_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_1_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_2_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_3_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_4_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_5_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_6_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_7_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_8_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_9_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_10_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_11_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_12_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_13_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_14_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_15_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_16_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_17_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_18_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_19_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_20_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_21_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_22_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_23_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_24_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_25_imag;  
logic signed [OUT_WORD_WIDTH-1:0] out_26_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_27_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_28_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_29_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_30_imag; 
logic signed [OUT_WORD_WIDTH-1:0] out_31_imag;	









logic signed [IN_ELEMENT_LENGTH-1:0] inreg_0;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_1;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_2;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_3;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_4;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_5;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_6;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_7;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_8;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_9;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_10;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_11;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_12;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_13;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_14;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_15;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_16;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_17;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_18;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_19;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_20;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_21;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_22;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_23;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_24;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_25;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_26;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_27;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_28;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_29;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_30;
logic signed [IN_ELEMENT_LENGTH-1:0] inreg_31;

// Twiddle factor ROM for 32-point FFT (k=0 to 15)
assign Twiddle_ram_real[0]  =  16'b0000000100000000;     assign Twiddle_ram_imag[0]  =16'b0000000000000000;
assign Twiddle_ram_real[1]  =  16'b0000000011111011;     assign Twiddle_ram_imag[1]  =16'b1111111111001110;
assign Twiddle_ram_real[2]  =  16'b0000000011101101;     assign Twiddle_ram_imag[2]  =16'b1111111110011110;
assign Twiddle_ram_real[3]  =  16'b0000000011010101;     assign Twiddle_ram_imag[3]  =16'b1111111101110010;
assign Twiddle_ram_real[4]  =  16'b0000000010110101;     assign Twiddle_ram_imag[4]  =16'b1111111101001011;
assign Twiddle_ram_real[5]  =  16'b0000000010001110;     assign Twiddle_ram_imag[5]  =16'b1111111100101011;
assign Twiddle_ram_real[6]  =  16'b0000000001100010;     assign Twiddle_ram_imag[6]  =16'b1111111100010011;
assign Twiddle_ram_real[7]  =  16'b0000000000110010;     assign Twiddle_ram_imag[7]  =16'b1111111100000101;
assign Twiddle_ram_real[8]  =  16'b0000000000000000;     assign Twiddle_ram_imag[8]  =16'b1111111100000000;
assign Twiddle_ram_real[9]  =  16'b1111111111001110;     assign Twiddle_ram_imag[9]  =16'b1111111100000101;
assign Twiddle_ram_real[10] =  16'b1111111110011110;     assign Twiddle_ram_imag[10] =16'b1111111100010011;
assign Twiddle_ram_real[11] =  16'b1111111101110010;     assign Twiddle_ram_imag[11] =16'b1111111100101011;
assign Twiddle_ram_real[12] =  16'b1111111101001011;     assign Twiddle_ram_imag[12] =16'b1111111101001011;
assign Twiddle_ram_real[13] =  16'b1111111100101011;     assign Twiddle_ram_imag[13] =16'b1111111101110010;
assign Twiddle_ram_real[14] =  16'b1111111100010011;     assign Twiddle_ram_imag[14] =16'b1111111110011110;
assign Twiddle_ram_real[15] =  16'b1111111100000101;     assign Twiddle_ram_imag[15] =16'b1111111111001110;

//intermidiate wirres for in1
reg signed [TWIDDLE_LENGTH-1:0] in1_real_0;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_0;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_1;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_1;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_2;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_2;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_3;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_3;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_4;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_4;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_5;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_5;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_6;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_6;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_7;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_7;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_8;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_8;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_9;   	reg signed [TWIDDLE_LENGTH-1:0] in1_imag_9;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_10;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_10;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_11;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_11;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_12;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_12;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_13;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_13;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_14;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_14;
reg signed [TWIDDLE_LENGTH-1:0] in1_real_15;    reg signed [TWIDDLE_LENGTH-1:0] in1_imag_15;

//intermidiate wirres for twiddle factors(in2)
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_0_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_0_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_1_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_1_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_2_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_2_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_3_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_3_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_4_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_4_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_5_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_5_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_6_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_6_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_7_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_7_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_8_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_8_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_9_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_9_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_10_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_10_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_11_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_11_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_12_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_12_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_13_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_13_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_14_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_14_imag;
reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_15_real;   	    reg signed [TWIDDLE_LENGTH-1:0] Twiddle_mac_15_imag;

//intermidiate wirres for in3
reg signed [TWIDDLE_LENGTH-1:0] in3_real_0;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_0;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_1;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_1;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_2;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_2;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_3;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_3;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_4;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_4;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_5;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_5;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_6;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_6;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_7;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_7;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_8;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_8;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_9;   	reg signed [TWIDDLE_LENGTH-1:0] in3_imag_9;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_10;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_10;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_11;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_11;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_12;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_12;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_13;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_13;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_14;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_14;
reg signed [TWIDDLE_LENGTH-1:0] in3_real_15;    reg signed [TWIDDLE_LENGTH-1:0] in3_imag_15;


//intermidiate wirres for out1
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_0_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_0_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_1_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_1_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_2_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_2_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_3_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_3_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_4_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_4_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_5_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_5_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_6_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_6_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_7_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_7_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_8_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_8_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_9_real ;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_9_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_10_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_10_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_11_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_11_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_12_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_12_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_13_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_13_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_14_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_14_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_15_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_1_mac_15_imag;

//intermidiate wirres for out2
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_0_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_0_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_1_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_1_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_2_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_2_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_3_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_3_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_4_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_4_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_5_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_5_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_6_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_6_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_7_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_7_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_8_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_8_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_9_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_9_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_10_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_10_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_11_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_11_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_12_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_12_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_13_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_13_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_14_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_14_imag;
logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_15_real;   	logic signed [OUT_WORD_WIDTH-1:0] out_2_mac_15_imag;

reg Final_stage_flag ;
logic clk2 ;
logic EN_REG ;

always @(posedge clk or negedge rst) begin
    if(!rst)
    	Stage_counter <= 0;
    else if(EN_REG == 1 && Stage_counter != 4)
    	Stage_counter <= Stage_counter + 'b1;	
    else 
    	Stage_counter <= 3'b0;
end

always @(posedge clk or negedge rst) begin
    if(!rst)
    	Final_stage_flag <= 0;
    else if(Stage_counter==4)
    	Final_stage_flag <= 1;
	else
	Final_stage_flag <= 0;
end


always @(*) begin 

	case (Stage_counter)
		
		5'd0 : begin // W0
			//Final_stage_flag = 0;
			//input1
			in1_real_0  = $signed({inreg_0,4'b0000});         in1_imag_0  = 0;
			in1_real_1  = $signed({inreg_8,4'b0000});         in1_imag_1  = 0;
			in1_real_2  = $signed({inreg_4,4'b0000});         in1_imag_2  = 0;
			in1_real_3  = $signed({inreg_12,4'b0000});        in1_imag_3  = 0;
			in1_real_4  = $signed({inreg_2,4'b0000});         in1_imag_4  = 0;
			in1_real_5  = $signed({inreg_10,4'b0000});   		in1_imag_5  = 0;
			in1_real_6  = $signed({inreg_6,4'b0000});   		in1_imag_6  = 0;
			in1_real_7  = $signed({inreg_14,4'b0000});   		in1_imag_7  = 0;
			in1_real_8  = $signed({inreg_1,4'b0000});    		in1_imag_8  = 0;
			in1_real_9  = $signed({inreg_9,4'b0000});    		in1_imag_9  = 0;
			in1_real_10 = $signed({inreg_5,4'b0000});    		in1_imag_10 = 0;
			in1_real_11 = $signed({inreg_13,4'b0000});   		in1_imag_11 = 0;
			in1_real_12 = $signed({inreg_3,4'b0000});    		in1_imag_12 = 0;
			in1_real_13 = $signed({inreg_11,4'b0000});   		in1_imag_13 = 0;
			in1_real_14 = $signed({inreg_7,4'b0000});    		in1_imag_14 = 0;
			in1_real_15 = $signed({inreg_15,4'b0000});   		in1_imag_15 = 0;

			//twiddle(input2)
			Twiddle_mac_0_real = Twiddle_ram_real[0];
			Twiddle_mac_0_imag = Twiddle_ram_imag[0];
			Twiddle_mac_1_real = Twiddle_ram_real[0];
			Twiddle_mac_1_imag = Twiddle_ram_imag[0];
			Twiddle_mac_2_real = Twiddle_ram_real[0];
			Twiddle_mac_2_imag = Twiddle_ram_imag[0];
			Twiddle_mac_3_real = Twiddle_ram_real[0];
			Twiddle_mac_3_imag = Twiddle_ram_imag[0];
			Twiddle_mac_4_real = Twiddle_ram_real[0];
			Twiddle_mac_4_imag = Twiddle_ram_imag[0];
			Twiddle_mac_5_real = Twiddle_ram_real[0];
			Twiddle_mac_5_imag = Twiddle_ram_imag[0];
			Twiddle_mac_6_real = Twiddle_ram_real[0];
			Twiddle_mac_6_imag = Twiddle_ram_imag[0];
			Twiddle_mac_7_real = Twiddle_ram_real[0];
			Twiddle_mac_7_imag = Twiddle_ram_imag[0];
			Twiddle_mac_8_real = Twiddle_ram_real[0];
			Twiddle_mac_8_imag = Twiddle_ram_imag[0];
			Twiddle_mac_9_real = Twiddle_ram_real[0];
			Twiddle_mac_9_imag = Twiddle_ram_imag[0];
			Twiddle_mac_10_real = Twiddle_ram_real[0];
			Twiddle_mac_10_imag = Twiddle_ram_imag[0];
			Twiddle_mac_11_real = Twiddle_ram_real[0];
			Twiddle_mac_11_imag = Twiddle_ram_imag[0];
			Twiddle_mac_12_real = Twiddle_ram_real[0];
			Twiddle_mac_12_imag = Twiddle_ram_imag[0];
			Twiddle_mac_13_real = Twiddle_ram_real[0];
			Twiddle_mac_13_imag = Twiddle_ram_imag[0];
			Twiddle_mac_14_real = Twiddle_ram_real[0];
			Twiddle_mac_14_imag = Twiddle_ram_imag[0];
			Twiddle_mac_15_real = Twiddle_ram_real[0];
			Twiddle_mac_15_imag = Twiddle_ram_imag[0];

			//input3
			in3_real_0  = $signed({inreg_16,4'b0000});   in3_imag_0  = 0;
			in3_real_1  = $signed({inreg_24,4'b0000});   in3_imag_1  = 0;
			in3_real_2  = $signed({inreg_20,4'b0000});   in3_imag_2  = 0;
			in3_real_3  = $signed({inreg_28,4'b0000});   in3_imag_3  = 0;
			in3_real_4  = $signed({inreg_18,4'b0000});   in3_imag_4  = 0;
			in3_real_5  = $signed({inreg_26,4'b0000});   in3_imag_5  = 0;
			in3_real_6  = $signed({inreg_22,4'b0000});   in3_imag_6  = 0;
			in3_real_7  = $signed({inreg_30,4'b0000});   in3_imag_7  = 0;
			in3_real_8  = $signed({inreg_17,4'b0000});   in3_imag_8  = 0;
			in3_real_9  = $signed({inreg_25,4'b0000});   in3_imag_9  = 0;
			in3_real_10 = $signed({inreg_21,4'b0000});   in3_imag_10 = 0;
			in3_real_11 = $signed({inreg_29,4'b0000});   in3_imag_11 = 0;
			in3_real_12 = $signed({inreg_19,4'b0000});   in3_imag_12 = 0;
			in3_real_13 = $signed({inreg_27,4'b0000});   in3_imag_13 = 0;
			in3_real_14 = $signed({inreg_23,4'b0000});   in3_imag_14 = 0;
			in3_real_15 = $signed({inreg_31,4'b0000});   in3_imag_15 = 0;
		end

		5'd1 : begin //W0, W8 
			//Final_stage_flag = 0;
			//input1
			in1_real_0  = out_1_mac_0_real;    in1_imag_0  = out_1_mac_0_imag;
			in1_real_1  = out_2_mac_0_real;    in1_imag_1  = out_2_mac_0_imag;
			in1_real_2  = out_1_mac_2_real;    in1_imag_2  = out_1_mac_2_imag;
			in1_real_3  = out_2_mac_2_real;    in1_imag_3  = out_2_mac_2_imag;
			in1_real_4  = out_1_mac_4_real;    in1_imag_4  = out_1_mac_4_imag;
			in1_real_5  = out_2_mac_4_real;    in1_imag_5  = out_2_mac_4_imag;
			in1_real_6  = out_1_mac_6_real;    in1_imag_6  = out_1_mac_6_imag;
			in1_real_7  = out_2_mac_6_real;    in1_imag_7  = out_2_mac_6_imag;
			in1_real_8  = out_1_mac_8_real;    in1_imag_8  = out_1_mac_8_imag;
			in1_real_9  = out_2_mac_8_real;    in1_imag_9  = out_2_mac_8_imag;
			in1_real_10 = out_1_mac_10_real;   in1_imag_10 = out_1_mac_10_imag;
			in1_real_11 = out_2_mac_10_real;   in1_imag_11 = out_2_mac_10_imag;
			in1_real_12 = out_1_mac_12_real;   in1_imag_12 = out_1_mac_12_imag;
			in1_real_13 = out_2_mac_12_real;   in1_imag_13 = out_2_mac_12_imag;
			in1_real_14 = out_1_mac_14_real;   in1_imag_14 = out_1_mac_14_imag;
			in1_real_15 = out_2_mac_14_real;   in1_imag_15 = out_2_mac_14_imag;

			//twiddle(input2)
			Twiddle_mac_0_real = Twiddle_ram_real[0];
			Twiddle_mac_0_imag = Twiddle_ram_imag[0];
			Twiddle_mac_1_real = Twiddle_ram_real[8];
			Twiddle_mac_1_imag = Twiddle_ram_imag[8];
			Twiddle_mac_2_real = Twiddle_ram_real[0];
			Twiddle_mac_2_imag = Twiddle_ram_imag[0];
			Twiddle_mac_3_real = Twiddle_ram_real[8];
			Twiddle_mac_3_imag = Twiddle_ram_imag[8];
			Twiddle_mac_4_real = Twiddle_ram_real[0];
			Twiddle_mac_4_imag = Twiddle_ram_imag[0];
			Twiddle_mac_5_real = Twiddle_ram_real[8];
			Twiddle_mac_5_imag = Twiddle_ram_imag[8];
			Twiddle_mac_6_real = Twiddle_ram_real[0];
			Twiddle_mac_6_imag = Twiddle_ram_imag[0];
			Twiddle_mac_7_real = Twiddle_ram_real[8];
			Twiddle_mac_7_imag = Twiddle_ram_imag[8];
			Twiddle_mac_8_real = Twiddle_ram_real[0];
			Twiddle_mac_8_imag = Twiddle_ram_imag[0];
			Twiddle_mac_9_real = Twiddle_ram_real[8];
			Twiddle_mac_9_imag = Twiddle_ram_imag[8];
			Twiddle_mac_10_real = Twiddle_ram_real[0];
			Twiddle_mac_10_imag = Twiddle_ram_imag[0];
			Twiddle_mac_11_real = Twiddle_ram_real[8];
			Twiddle_mac_11_imag = Twiddle_ram_imag[8];
			Twiddle_mac_12_real = Twiddle_ram_real[0];
			Twiddle_mac_12_imag = Twiddle_ram_imag[0];
			Twiddle_mac_13_real = Twiddle_ram_real[8];
			Twiddle_mac_13_imag = Twiddle_ram_imag[8];
			Twiddle_mac_14_real = Twiddle_ram_real[0];
			Twiddle_mac_14_imag = Twiddle_ram_imag[0];
			Twiddle_mac_15_real = Twiddle_ram_real[8];
			Twiddle_mac_15_imag = Twiddle_ram_imag[8];

			//input3
			in3_real_0  = out_1_mac_1_real;    in3_imag_0  = out_1_mac_1_imag;
			in3_real_1  = out_2_mac_1_real;    in3_imag_1  = out_2_mac_1_imag;
			in3_real_2  = out_1_mac_3_real;    in3_imag_2  = out_1_mac_3_imag;
			in3_real_3  = out_2_mac_3_real;    in3_imag_3  = out_2_mac_3_imag;
			in3_real_4  = out_1_mac_5_real;    in3_imag_4  = out_1_mac_5_imag;
			in3_real_5  = out_2_mac_5_real;    in3_imag_5  = out_2_mac_5_imag;
			in3_real_6  = out_1_mac_7_real;    in3_imag_6  = out_1_mac_7_imag;
			in3_real_7  = out_2_mac_7_real;    in3_imag_7  = out_2_mac_7_imag;
			in3_real_8  = out_1_mac_9_real;    in3_imag_8  = out_1_mac_9_imag;
			in3_real_9  = out_2_mac_9_real;    in3_imag_9  = out_2_mac_9_imag;
			in3_real_10 = out_1_mac_11_real;   in3_imag_10 = out_1_mac_11_imag;
			in3_real_11 = out_2_mac_11_real;   in3_imag_11 = out_2_mac_11_imag;
			in3_real_12 = out_1_mac_13_real;   in3_imag_12 = out_1_mac_13_imag;
			in3_real_13 = out_2_mac_13_real;   in3_imag_13 = out_2_mac_13_imag;
			in3_real_14 = out_1_mac_15_real;   in3_imag_14 = out_1_mac_15_imag;
			in3_real_15 = out_2_mac_15_real;   in3_imag_15 = out_2_mac_15_imag;
		end

		5'd2 : begin //W0, W4, W8, W12
			//Final_stage_flag = 0;
			//input1
			in1_real_0  = out_1_mac_0_real;    in1_imag_0  = out_1_mac_0_imag;
			in1_real_1  = out_1_mac_1_real;    in1_imag_1  = out_1_mac_1_imag;
			in1_real_2  = out_2_mac_0_real;    in1_imag_2  = out_2_mac_0_imag;
			in1_real_3  = out_2_mac_1_real;    in1_imag_3  = out_2_mac_1_imag;
			in1_real_4  = out_1_mac_4_real;    in1_imag_4  = out_1_mac_4_imag;
			in1_real_5  = out_1_mac_5_real;    in1_imag_5  = out_1_mac_5_imag;
			in1_real_6  = out_2_mac_4_real;    in1_imag_6  = out_2_mac_4_imag;
			in1_real_7  = out_2_mac_5_real;    in1_imag_7  = out_2_mac_5_imag;
			in1_real_8  = out_1_mac_8_real;    in1_imag_8  = out_1_mac_8_imag;
			in1_real_9  = out_1_mac_9_real;    in1_imag_9  = out_1_mac_9_imag;
			in1_real_10 = out_2_mac_8_real;    in1_imag_10 = out_2_mac_8_imag;
			in1_real_11 = out_2_mac_9_real;    in1_imag_11 = out_2_mac_9_imag;
			in1_real_12 = out_1_mac_12_real;   in1_imag_12 = out_1_mac_12_imag;
			in1_real_13 = out_1_mac_13_real;   in1_imag_13 = out_1_mac_13_imag;
			in1_real_14 = out_2_mac_12_real;   in1_imag_14 = out_2_mac_12_imag;
			in1_real_15 = out_2_mac_13_real;   in1_imag_15 = out_2_mac_13_imag;

			//twiddle(input2)
			Twiddle_mac_0_real = Twiddle_ram_real[0];
			Twiddle_mac_0_imag = Twiddle_ram_imag[0];
			Twiddle_mac_1_real = Twiddle_ram_real[4];
			Twiddle_mac_1_imag = Twiddle_ram_imag[4];
			Twiddle_mac_2_real = Twiddle_ram_real[8];
			Twiddle_mac_2_imag = Twiddle_ram_imag[8];
			Twiddle_mac_3_real = Twiddle_ram_real[12];
			Twiddle_mac_3_imag = Twiddle_ram_imag[12];
			Twiddle_mac_4_real = Twiddle_ram_real[0];
			Twiddle_mac_4_imag = Twiddle_ram_imag[0];
			Twiddle_mac_5_real = Twiddle_ram_real[4];
			Twiddle_mac_5_imag = Twiddle_ram_imag[4];
			Twiddle_mac_6_real = Twiddle_ram_real[8];
			Twiddle_mac_6_imag = Twiddle_ram_imag[8];
			Twiddle_mac_7_real = Twiddle_ram_real[12];
			Twiddle_mac_7_imag = Twiddle_ram_imag[12];
			Twiddle_mac_8_real = Twiddle_ram_real[0];
			Twiddle_mac_8_imag = Twiddle_ram_imag[0];
			Twiddle_mac_9_real = Twiddle_ram_real[4];
			Twiddle_mac_9_imag = Twiddle_ram_imag[4];
			Twiddle_mac_10_real = Twiddle_ram_real[8];
			Twiddle_mac_10_imag = Twiddle_ram_imag[8];
			Twiddle_mac_11_real = Twiddle_ram_real[12];
			Twiddle_mac_11_imag = Twiddle_ram_imag[12];
			Twiddle_mac_12_real = Twiddle_ram_real[0];
			Twiddle_mac_12_imag = Twiddle_ram_imag[0];
			Twiddle_mac_13_real = Twiddle_ram_real[4];
			Twiddle_mac_13_imag = Twiddle_ram_imag[4];
			Twiddle_mac_14_real = Twiddle_ram_real[8];
			Twiddle_mac_14_imag = Twiddle_ram_imag[8];
			Twiddle_mac_15_real = Twiddle_ram_real[12];
			Twiddle_mac_15_imag = Twiddle_ram_imag[12];

			//input3
			in3_real_0  = out_1_mac_2_real;    in3_imag_0  = out_1_mac_2_imag; 
			in3_real_1  = out_1_mac_3_real;    in3_imag_1  = out_1_mac_3_imag; 
			in3_real_2  = out_2_mac_2_real;    in3_imag_2  = out_2_mac_2_imag; 
			in3_real_3  = out_2_mac_3_real;    in3_imag_3  = out_2_mac_3_imag; 
			in3_real_4  = out_1_mac_6_real;    in3_imag_4  = out_1_mac_6_imag; 
			in3_real_5  = out_1_mac_7_real;    in3_imag_5  = out_1_mac_7_imag; 
			in3_real_6  = out_2_mac_6_real;    in3_imag_6  = out_2_mac_6_imag; 
			in3_real_7  = out_2_mac_7_real;    in3_imag_7  = out_2_mac_7_imag; 
			in3_real_8  = out_1_mac_10_real;   in3_imag_8  = out_1_mac_10_imag; 
			in3_real_9  = out_1_mac_11_real;   in3_imag_9  = out_1_mac_11_imag; 
			in3_real_10 = out_2_mac_10_real;   in3_imag_10 = out_2_mac_10_imag; 
			in3_real_11 = out_2_mac_11_real;   in3_imag_11 = out_2_mac_11_imag; 
			in3_real_12 = out_1_mac_14_real;   in3_imag_12 = out_1_mac_14_imag;
			in3_real_13 = out_1_mac_15_real;   in3_imag_13 = out_1_mac_15_imag;
			in3_real_14 = out_2_mac_14_real;   in3_imag_14 = out_2_mac_14_imag;
			in3_real_15 = out_2_mac_15_real;   in3_imag_15 = out_2_mac_15_imag;
		end

		5'd3 : begin //W0, W2, W4, W6, W8, W10, W12, W14
			//Final_stage_flag = 0;
			//input1
			in1_real_0  = out_1_mac_0_real;    in1_imag_0  = out_1_mac_0_imag;
			in1_real_1  = out_1_mac_1_real;    in1_imag_1  = out_1_mac_1_imag;
			in1_real_2  = out_1_mac_2_real;    in1_imag_2  = out_1_mac_2_imag;
			in1_real_3  = out_1_mac_3_real;    in1_imag_3  = out_1_mac_3_imag;
			in1_real_4  = out_2_mac_0_real;    in1_imag_4  = out_2_mac_0_imag;
			in1_real_5  = out_2_mac_1_real;    in1_imag_5  = out_2_mac_1_imag;
			in1_real_6  = out_2_mac_2_real;    in1_imag_6  = out_2_mac_2_imag;
			in1_real_7  = out_2_mac_3_real;    in1_imag_7  = out_2_mac_3_imag;
			in1_real_8  = out_1_mac_8_real;    in1_imag_8  = out_1_mac_8_imag;
			in1_real_9  = out_1_mac_9_real;    in1_imag_9  = out_1_mac_9_imag;
			in1_real_10 = out_1_mac_10_real;   in1_imag_10 = out_1_mac_10_imag;
			in1_real_11 = out_1_mac_11_real;   in1_imag_11 = out_1_mac_11_imag;
			in1_real_12 = out_2_mac_8_real;    in1_imag_12 = out_2_mac_8_imag;
			in1_real_13 = out_2_mac_9_real;    in1_imag_13 = out_2_mac_9_imag;
			in1_real_14 = out_2_mac_10_real;   in1_imag_14 = out_2_mac_10_imag;
			in1_real_15 = out_2_mac_11_real;   in1_imag_15 = out_2_mac_11_imag;

			//twiddle(input2)
			Twiddle_mac_0_real = Twiddle_ram_real[0];
			Twiddle_mac_0_imag = Twiddle_ram_imag[0];
			Twiddle_mac_1_real = Twiddle_ram_real[2];
			Twiddle_mac_1_imag = Twiddle_ram_imag[2];
			Twiddle_mac_2_real = Twiddle_ram_real[4];
			Twiddle_mac_2_imag = Twiddle_ram_imag[4];
			Twiddle_mac_3_real = Twiddle_ram_real[6];
			Twiddle_mac_3_imag = Twiddle_ram_imag[6];
			Twiddle_mac_4_real = Twiddle_ram_real[8];
			Twiddle_mac_4_imag = Twiddle_ram_imag[8];
			Twiddle_mac_5_real = Twiddle_ram_real[10];
			Twiddle_mac_5_imag = Twiddle_ram_imag[10];
			Twiddle_mac_6_real = Twiddle_ram_real[12];
			Twiddle_mac_6_imag = Twiddle_ram_imag[12];
			Twiddle_mac_7_real = Twiddle_ram_real[14];
			Twiddle_mac_7_imag = Twiddle_ram_imag[14];
			Twiddle_mac_8_real = Twiddle_ram_real[0];
			Twiddle_mac_8_imag = Twiddle_ram_imag[0];
			Twiddle_mac_9_real = Twiddle_ram_real[2];
			Twiddle_mac_9_imag = Twiddle_ram_imag[2];
			Twiddle_mac_10_real = Twiddle_ram_real[4];
			Twiddle_mac_10_imag = Twiddle_ram_imag[4];
			Twiddle_mac_11_real = Twiddle_ram_real[6];
			Twiddle_mac_11_imag = Twiddle_ram_imag[6];
			Twiddle_mac_12_real = Twiddle_ram_real[8];
			Twiddle_mac_12_imag = Twiddle_ram_imag[8];
			Twiddle_mac_13_real = Twiddle_ram_real[10];
			Twiddle_mac_13_imag = Twiddle_ram_imag[10];
			Twiddle_mac_14_real = Twiddle_ram_real[12];
			Twiddle_mac_14_imag = Twiddle_ram_imag[12];
			Twiddle_mac_15_real = Twiddle_ram_real[14];
			Twiddle_mac_15_imag = Twiddle_ram_imag[14];

			//input3
			in3_real_0  = out_1_mac_4_real;    in3_imag_0  = out_1_mac_4_imag; 
			in3_real_1  = out_1_mac_5_real;    in3_imag_1  = out_1_mac_5_imag; 
			in3_real_2  = out_1_mac_6_real;    in3_imag_2  = out_1_mac_6_imag; 
			in3_real_3  = out_1_mac_7_real;    in3_imag_3  = out_1_mac_7_imag; 
			in3_real_4  = out_2_mac_4_real;    in3_imag_4  = out_2_mac_4_imag; 
			in3_real_5  = out_2_mac_5_real;    in3_imag_5  = out_2_mac_5_imag; 
			in3_real_6  = out_2_mac_6_real;    in3_imag_6  = out_2_mac_6_imag; 
			in3_real_7  = out_2_mac_7_real;    in3_imag_7  = out_2_mac_7_imag; 
			in3_real_8  = out_1_mac_12_real;   in3_imag_8  = out_1_mac_12_imag;  
			in3_real_9  = out_1_mac_13_real;   in3_imag_9  = out_1_mac_13_imag;  
			in3_real_10 = out_1_mac_14_real;   in3_imag_10 = out_1_mac_14_imag; 
			in3_real_11 = out_1_mac_15_real;   in3_imag_11 = out_1_mac_15_imag; 
			in3_real_12 = out_2_mac_12_real;   in3_imag_12 = out_2_mac_12_imag; 
			in3_real_13 = out_2_mac_13_real;   in3_imag_13 = out_2_mac_13_imag; 
			in3_real_14 = out_2_mac_14_real;   in3_imag_14 = out_2_mac_14_imag;
			in3_real_15 = out_2_mac_15_real;   in3_imag_15 = out_2_mac_15_imag;

		end

		5'd4 : begin
			//Final_stage_flag = 1;
			//input1
			in1_real_0  = out_1_mac_0_real;    in1_imag_0  = out_1_mac_0_imag;
			in1_real_1  = out_1_mac_1_real;    in1_imag_1  = out_1_mac_1_imag;
			in1_real_2  = out_1_mac_2_real;    in1_imag_2  = out_1_mac_2_imag;
			in1_real_3  = out_1_mac_3_real;    in1_imag_3  = out_1_mac_3_imag;
			in1_real_4  = out_1_mac_4_real;    in1_imag_4  = out_1_mac_4_imag;
			in1_real_5  = out_1_mac_5_real;    in1_imag_5  = out_1_mac_5_imag;
			in1_real_6  = out_1_mac_6_real;    in1_imag_6  = out_1_mac_6_imag;
			in1_real_7  = out_1_mac_7_real;    in1_imag_7  = out_1_mac_7_imag;
			in1_real_8  = out_2_mac_0_real;    in1_imag_8  = out_2_mac_0_imag;
			in1_real_9  = out_2_mac_1_real;    in1_imag_9  = out_2_mac_1_imag;
			in1_real_10 = out_2_mac_2_real;    in1_imag_10 = out_2_mac_2_imag;
			in1_real_11 = out_2_mac_3_real;    in1_imag_11 = out_2_mac_3_imag;
			in1_real_12 = out_2_mac_4_real;    in1_imag_12 = out_2_mac_4_imag;
			in1_real_13 = out_2_mac_5_real;    in1_imag_13 = out_2_mac_5_imag;
			in1_real_14 = out_2_mac_6_real;    in1_imag_14 = out_2_mac_6_imag;
			in1_real_15 = out_2_mac_7_real;    in1_imag_15 = out_2_mac_7_imag;

			//twiddle(input2)
			Twiddle_mac_0_real = Twiddle_ram_real[0];
			Twiddle_mac_0_imag = Twiddle_ram_imag[0];
			Twiddle_mac_1_real = Twiddle_ram_real[1];
			Twiddle_mac_1_imag = Twiddle_ram_imag[1];
			Twiddle_mac_2_real = Twiddle_ram_real[2];
			Twiddle_mac_2_imag = Twiddle_ram_imag[2];
			Twiddle_mac_3_real = Twiddle_ram_real[3];
			Twiddle_mac_3_imag = Twiddle_ram_imag[3];
			Twiddle_mac_4_real = Twiddle_ram_real[4];
			Twiddle_mac_4_imag = Twiddle_ram_imag[4];
			Twiddle_mac_5_real = Twiddle_ram_real[5];
			Twiddle_mac_5_imag = Twiddle_ram_imag[5];
			Twiddle_mac_6_real = Twiddle_ram_real[6];
			Twiddle_mac_6_imag = Twiddle_ram_imag[6];
			Twiddle_mac_7_real = Twiddle_ram_real[7];
			Twiddle_mac_7_imag = Twiddle_ram_imag[7];
			Twiddle_mac_8_real = Twiddle_ram_real[8];
			Twiddle_mac_8_imag = Twiddle_ram_imag[8];
			Twiddle_mac_9_real = Twiddle_ram_real[9];
			Twiddle_mac_9_imag = Twiddle_ram_imag[9];
			Twiddle_mac_10_real = Twiddle_ram_real[10];
			Twiddle_mac_10_imag = Twiddle_ram_imag[10];
			Twiddle_mac_11_real = Twiddle_ram_real[11];
			Twiddle_mac_11_imag = Twiddle_ram_imag[11];
			Twiddle_mac_12_real = Twiddle_ram_real[12];
			Twiddle_mac_12_imag = Twiddle_ram_imag[12];
			Twiddle_mac_13_real = Twiddle_ram_real[13];
			Twiddle_mac_13_imag = Twiddle_ram_imag[13];
			Twiddle_mac_14_real = Twiddle_ram_real[14];
			Twiddle_mac_14_imag = Twiddle_ram_imag[14];
			Twiddle_mac_15_real = Twiddle_ram_real[15];
			Twiddle_mac_15_imag = Twiddle_ram_imag[15];

			//input3
			in3_real_0  = out_1_mac_8_real;    in3_imag_0  = out_1_mac_8_imag;
			in3_real_1  = out_1_mac_9_real;    in3_imag_1  = out_1_mac_9_imag;
			in3_real_2  = out_1_mac_10_real;   in3_imag_2  = out_1_mac_10_imag;
			in3_real_3  = out_1_mac_11_real;   in3_imag_3  = out_1_mac_11_imag;
			in3_real_4  = out_1_mac_12_real;   in3_imag_4  = out_1_mac_12_imag;
			in3_real_5  = out_1_mac_13_real;   in3_imag_5  = out_1_mac_13_imag;
			in3_real_6  = out_1_mac_14_real;   in3_imag_6  = out_1_mac_14_imag;
			in3_real_7  = out_1_mac_15_real;   in3_imag_7  = out_1_mac_15_imag;
			in3_real_8  = out_2_mac_8_real;    in3_imag_8  = out_2_mac_8_imag;  
			in3_real_9  = out_2_mac_9_real;    in3_imag_9  = out_2_mac_9_imag;  
			in3_real_10 = out_2_mac_10_real;   in3_imag_10 = out_2_mac_10_imag; 
			in3_real_11 = out_2_mac_11_real;   in3_imag_11 = out_2_mac_11_imag; 
			in3_real_12 = out_2_mac_12_real;   in3_imag_12 = out_2_mac_12_imag; 
			in3_real_13 = out_2_mac_13_real;   in3_imag_13 = out_2_mac_13_imag; 
			in3_real_14 = out_2_mac_14_real;   in3_imag_14 = out_2_mac_14_imag;
			in3_real_15 = out_2_mac_15_real;   in3_imag_15 = out_2_mac_15_imag;

		end

		default : begin
			//input1 
			in1_real_0  = 0;   in1_imag_0  = 0;
			in1_real_1  = 0;   in1_imag_1  = 0;
			in1_real_2  = 0;   in1_imag_2  = 0;
			in1_real_3  = 0;   in1_imag_3  = 0;
			in1_real_4  = 0;   in1_imag_4  = 0;
			in1_real_5  = 0;   in1_imag_5  = 0;
			in1_real_6  = 0;   in1_imag_6  = 0;
			in1_real_7  = 0;   in1_imag_7  = 0;
			in1_real_8  = 0;   in1_imag_8  = 0;
			in1_real_9  = 0;   in1_imag_9  = 0;
			in1_real_10 = 0;   in1_imag_10 = 0;
			in1_real_11 = 0;   in1_imag_11 = 0;
			in1_real_12 = 0;   in1_imag_12 = 0;
			in1_real_13 = 0;   in1_imag_13 = 0;
			in1_real_14 = 0;   in1_imag_14 = 0;
			in1_real_15 = 0;   in1_imag_15 = 0;

			//twiddle(input2)
			Twiddle_mac_0_real  = 16'b0;
			Twiddle_mac_0_imag  = 16'b0;
			Twiddle_mac_1_real  = 16'b0;
			Twiddle_mac_1_imag  = 16'b0;
			Twiddle_mac_2_real  = 16'b0;
			Twiddle_mac_2_imag  = 16'b0;
			Twiddle_mac_3_real  = 16'b0;
			Twiddle_mac_3_imag  = 16'b0;
			Twiddle_mac_4_real  = 16'b0;
			Twiddle_mac_4_imag  = 16'b0;
			Twiddle_mac_5_real  = 16'b0;
			Twiddle_mac_5_imag  = 16'b0;
			Twiddle_mac_6_real  = 16'b0;
			Twiddle_mac_6_imag  = 16'b0;
			Twiddle_mac_7_real  = 16'b0;
			Twiddle_mac_7_imag  = 16'b0;
			Twiddle_mac_8_real  = 16'b0;
			Twiddle_mac_8_imag  = 16'b0;
			Twiddle_mac_9_real  = 16'b0;
			Twiddle_mac_9_imag  = 16'b0;
			Twiddle_mac_10_real = 16'b0;
			Twiddle_mac_10_imag = 16'b0;
			Twiddle_mac_11_real = 16'b0;
			Twiddle_mac_11_imag = 16'b0;
			Twiddle_mac_12_real = 16'b0;
			Twiddle_mac_12_imag = 16'b0;
			Twiddle_mac_13_real = 16'b0;
			Twiddle_mac_13_imag = 16'b0;
			Twiddle_mac_14_real = 16'b0;
			Twiddle_mac_14_imag = 16'b0;
			Twiddle_mac_15_real = 16'b0;
			Twiddle_mac_15_imag = 16'b0;

			//input3
			in3_real_0  = 0;   in3_imag_0  = 0;
			in3_real_1  = 0;   in3_imag_1  = 0;
			in3_real_2  = 0;   in3_imag_2  = 0;
			in3_real_3  = 0;   in3_imag_3  = 0;
			in3_real_4  = 0;   in3_imag_4  = 0;
			in3_real_5  = 0;   in3_imag_5  = 0;
			in3_real_6  = 0;   in3_imag_6  = 0;
			in3_real_7  = 0;   in3_imag_7  = 0;
			in3_real_8  = 0;   in3_imag_8  = 0;
			in3_real_9  = 0;   in3_imag_9  = 0;
			in3_real_10 = 0;   in3_imag_10 = 0;
			in3_real_11 = 0;   in3_imag_11 = 0;
			in3_real_12 = 0;   in3_imag_12 = 0;
			in3_real_13 = 0;   in3_imag_13 = 0;
			in3_real_14 = 0;   in3_imag_14 = 0;
			in3_real_15 = 0;   in3_imag_15 = 0;		
		end
	endcase
end

//--------------------------

ClkDiv #(.RATIO_WD(3)) clkdiv_inst (
    .i_ref_clk(clk),
    .i_rst(rst),
    .i_div_ratio(3'b101), 
    .o_div_clk(clk2)
);

INREG #(.IN_ELEMENT_LENGTH(8)) INREG_inst (
    .clk2(clk2),
    .rst_n(rst),
    .EN(clk_en),
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .in_4(in_4),
    .in_5(in_5),
    .in_6(in_6),
    .in_7(in_7),
    .in_8(in_8),
    .in_9(in_9),
    .in_10(in_10),
    .in_11(in_11),
    .in_12(in_12),
    .in_13(in_13),
    .in_14(in_14),
    .in_15(in_15),
    .in_16(in_16),
    .in_17(in_17),
    .in_18(in_18),
    .in_19(in_19),
    .in_20(in_20),
    .in_21(in_21),
    .in_22(in_22),
    .in_23(in_23),
    .in_24(in_24),
    .in_25(in_25),
    .in_26(in_26),
    .in_27(in_27),
    .in_28(in_28),
    .in_29(in_29),
    .in_30(in_30),
    .in_31(in_31),

    .inreg_0(inreg_0),
    .inreg_1(inreg_1),
    .inreg_2(inreg_2),
    .inreg_3(inreg_3),
    .inreg_4(inreg_4),
    .inreg_5(inreg_5),
    .inreg_6(inreg_6),
    .inreg_7(inreg_7),
    .inreg_8(inreg_8),
    .inreg_9(inreg_9),
    .inreg_10(inreg_10),
    .inreg_11(inreg_11),
    .inreg_12(inreg_12),
    .inreg_13(inreg_13),
    .inreg_14(inreg_14),
    .inreg_15(inreg_15),
    .inreg_16(inreg_16),
    .inreg_17(inreg_17),
    .inreg_18(inreg_18),
    .inreg_19(inreg_19),
    .inreg_20(inreg_20),
    .inreg_21(inreg_21),
    .inreg_22(inreg_22),
    .inreg_23(inreg_23),
    .inreg_24(inreg_24),
    .inreg_25(inreg_25),
    .inreg_26(inreg_26),
    .inreg_27(inreg_27),
    .inreg_28(inreg_28),
    .inreg_29(inreg_29),
    .inreg_30(inreg_30),
    .inreg_31(inreg_31), 
	.EN_REG(EN_REG)
);

// MACs instantation 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_0(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_0),
.in1_imag        (in1_imag_0),
.in2_real_twiddle(Twiddle_mac_0_real),
.in2_imag_twiddle(Twiddle_mac_0_imag),
.in3_real        (in3_real_0),
.in3_imag        (in3_imag_0),
.out1_mac_real   (out_1_mac_0_real),
.out1_mac_imag   (out_1_mac_0_imag),
.out2_mac_real   (out_2_mac_0_real),
.out2_mac_imag   (out_2_mac_0_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_1(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_1),
.in1_imag        (in1_imag_1),
.in2_real_twiddle(Twiddle_mac_1_real),
.in2_imag_twiddle(Twiddle_mac_1_imag),
.in3_real        (in3_real_1),
.in3_imag        (in3_imag_1),
.out1_mac_real   (out_1_mac_1_real),
.out1_mac_imag   (out_1_mac_1_imag),
.out2_mac_real   (out_2_mac_1_real),
.out2_mac_imag   (out_2_mac_1_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_2(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_2),
.in1_imag        (in1_imag_2),
.in2_real_twiddle(Twiddle_mac_2_real),
.in2_imag_twiddle(Twiddle_mac_2_imag),
.in3_real        (in3_real_2),
.in3_imag        (in3_imag_2),
.out1_mac_real   (out_1_mac_2_real),
.out1_mac_imag   (out_1_mac_2_imag),
.out2_mac_real   (out_2_mac_2_real),
.out2_mac_imag   (out_2_mac_2_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_3(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_3),
.in1_imag        (in1_imag_3),
.in2_real_twiddle(Twiddle_mac_3_real),
.in2_imag_twiddle(Twiddle_mac_3_imag),
.in3_real        (in3_real_3),
.in3_imag        (in3_imag_3),
.out1_mac_real   (out_1_mac_3_real),
.out1_mac_imag   (out_1_mac_3_imag),
.out2_mac_real   (out_2_mac_3_real),
.out2_mac_imag   (out_2_mac_3_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_4(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_4),
.in1_imag        (in1_imag_4),
.in2_real_twiddle(Twiddle_mac_4_real),
.in2_imag_twiddle(Twiddle_mac_4_imag),
.in3_real        (in3_real_4),
.in3_imag        (in3_imag_4),
.out1_mac_real   (out_1_mac_4_real),
.out1_mac_imag   (out_1_mac_4_imag),
.out2_mac_real   (out_2_mac_4_real),
.out2_mac_imag   (out_2_mac_4_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_5(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_5),
.in1_imag        (in1_imag_5),
.in2_real_twiddle(Twiddle_mac_5_real),
.in2_imag_twiddle(Twiddle_mac_5_imag),
.in3_real        (in3_real_5),
.in3_imag        (in3_imag_5),
.out1_mac_real   (out_1_mac_5_real),
.out1_mac_imag   (out_1_mac_5_imag),
.out2_mac_real   (out_2_mac_5_real),
.out2_mac_imag   (out_2_mac_5_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_6(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_6),
.in1_imag        (in1_imag_6),
.in2_real_twiddle(Twiddle_mac_6_real),
.in2_imag_twiddle(Twiddle_mac_6_imag),
.in3_real        (in3_real_6),
.in3_imag        (in3_imag_6),
.out1_mac_real   (out_1_mac_6_real),
.out1_mac_imag   (out_1_mac_6_imag),
.out2_mac_real   (out_2_mac_6_real),
.out2_mac_imag   (out_2_mac_6_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_7(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_7),
.in1_imag        (in1_imag_7),
.in2_real_twiddle(Twiddle_mac_7_real),
.in2_imag_twiddle(Twiddle_mac_7_imag),
.in3_real        (in3_real_7),
.in3_imag        (in3_imag_7),
.out1_mac_real   (out_1_mac_7_real),
.out1_mac_imag   (out_1_mac_7_imag),
.out2_mac_real   (out_2_mac_7_real),
.out2_mac_imag   (out_2_mac_7_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_8(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_8),
.in1_imag        (in1_imag_8),
.in2_real_twiddle(Twiddle_mac_8_real),
.in2_imag_twiddle(Twiddle_mac_8_imag),
.in3_real        (in3_real_8),
.in3_imag        (in3_imag_8),
.out1_mac_real   (out_1_mac_8_real),
.out1_mac_imag   (out_1_mac_8_imag),
.out2_mac_real   (out_2_mac_8_real),
.out2_mac_imag   (out_2_mac_8_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_9(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_9),
.in1_imag        (in1_imag_9),
.in2_real_twiddle(Twiddle_mac_9_real),
.in2_imag_twiddle(Twiddle_mac_9_imag),
.in3_real        (in3_real_9),
.in3_imag        (in3_imag_9),
.out1_mac_real   (out_1_mac_9_real),
.out1_mac_imag   (out_1_mac_9_imag),
.out2_mac_real   (out_2_mac_9_real),
.out2_mac_imag   (out_2_mac_9_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_10(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_10),
.in1_imag        (in1_imag_10),
.in2_real_twiddle(Twiddle_mac_10_real),
.in2_imag_twiddle(Twiddle_mac_10_imag),
.in3_real        (in3_real_10),
.in3_imag        (in3_imag_10),
.out1_mac_real   (out_1_mac_10_real),
.out1_mac_imag   (out_1_mac_10_imag),
.out2_mac_real   (out_2_mac_10_real),
.out2_mac_imag   (out_2_mac_10_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_11(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_11),
.in1_imag        (in1_imag_11),
.in2_real_twiddle(Twiddle_mac_11_real),
.in2_imag_twiddle(Twiddle_mac_11_imag),
.in3_real        (in3_real_11),
.in3_imag        (in3_imag_11),
.out1_mac_real   (out_1_mac_11_real),
.out1_mac_imag   (out_1_mac_11_imag),
.out2_mac_real   (out_2_mac_11_real),
.out2_mac_imag   (out_2_mac_11_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_12(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_12),
.in1_imag        (in1_imag_12),
.in2_real_twiddle(Twiddle_mac_12_real),
.in2_imag_twiddle(Twiddle_mac_12_imag),
.in3_real        (in3_real_12),
.in3_imag        (in3_imag_12),
.out1_mac_real   (out_1_mac_12_real),
.out1_mac_imag   (out_1_mac_12_imag),
.out2_mac_real   (out_2_mac_12_real),
.out2_mac_imag   (out_2_mac_12_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_13(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_13),
.in1_imag        (in1_imag_13),
.in2_real_twiddle(Twiddle_mac_13_real),
.in2_imag_twiddle(Twiddle_mac_13_imag),
.in3_real        (in3_real_13),
.in3_imag        (in3_imag_13),
.out1_mac_real   (out_1_mac_13_real),
.out1_mac_imag   (out_1_mac_13_imag),
.out2_mac_real   (out_2_mac_13_real),
.out2_mac_imag   (out_2_mac_13_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_14(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_14),
.in1_imag        (in1_imag_14),
.in2_real_twiddle(Twiddle_mac_14_real),
.in2_imag_twiddle(Twiddle_mac_14_imag),
.in3_real        (in3_real_14),
.in3_imag        (in3_imag_14),
.out1_mac_real   (out_1_mac_14_real),
.out1_mac_imag   (out_1_mac_14_imag),
.out2_mac_real   (out_2_mac_14_real),
.out2_mac_imag   (out_2_mac_14_imag)
); 

ButterFly_MAC #(.inWordWidth_1(16),.inWordWidth_2(16),.outWordWidth(16)) mac_15(
.clk             (clk),
.rst             (rst),
//.clr             (clr),
.in1_real        (in1_real_15),
.in1_imag        (in1_imag_15),
.in2_real_twiddle(Twiddle_mac_15_real),
.in2_imag_twiddle(Twiddle_mac_15_imag),
.in3_real        (in3_real_15),
.in3_imag        (in3_imag_15),
.out1_mac_real   (out_1_mac_15_real),
.out1_mac_imag   (out_1_mac_15_imag),
.out2_mac_real   (out_2_mac_15_real),
.out2_mac_imag   (out_2_mac_15_imag)
); 

parallel_2_serial parallel_2_serial_unit (
    .clk    (clk),
    .rst_n  (rst),
    .enable (Final_stage_flag),

    // Real inputs
    .real_0  (out_1_mac_0_real),
    .real_1  (out_1_mac_1_real),
    .real_2  (out_1_mac_2_real),
    .real_3  (out_1_mac_3_real),
    .real_4  (out_1_mac_4_real),
    .real_5  (out_1_mac_5_real),
    .real_6  (out_1_mac_6_real),
    .real_7  (out_1_mac_7_real),
    .real_8  (out_1_mac_8_real),
    .real_9  (out_1_mac_9_real),
    .real_10 (out_1_mac_10_real),
    .real_11 (out_1_mac_11_real),
    .real_12 (out_1_mac_12_real),
    .real_13 (out_1_mac_13_real),
    .real_14 (out_1_mac_14_real),
    .real_15 (out_1_mac_15_real),
    .real_16 (out_2_mac_0_real),
    .real_17 (out_2_mac_1_real),
    .real_18 (out_2_mac_2_real),
    .real_19 (out_2_mac_3_real),
    .real_20 (out_2_mac_4_real),
    .real_21 (out_2_mac_5_real),
    .real_22 (out_2_mac_6_real),
    .real_23 (out_2_mac_7_real),
    .real_24 (out_2_mac_8_real),
    .real_25 (out_2_mac_9_real),
    .real_26 (out_2_mac_10_real),
    .real_27 (out_2_mac_11_real),
    .real_28 (out_2_mac_12_real),
    .real_29 (out_2_mac_13_real),
    .real_30 (out_2_mac_14_real),
    .real_31 (out_2_mac_15_real),

    // Imag inputs
    .imag_0  (out_1_mac_0_imag),
    .imag_1  (out_1_mac_1_imag),
    .imag_2  (out_1_mac_2_imag),
    .imag_3  (out_1_mac_3_imag),
    .imag_4  (out_1_mac_4_imag),
    .imag_5  (out_1_mac_5_imag),
    .imag_6  (out_1_mac_6_imag),
    .imag_7  (out_1_mac_7_imag),
    .imag_8  (out_1_mac_8_imag),
    .imag_9  (out_1_mac_9_imag),
    .imag_10 (out_1_mac_10_imag),
    .imag_11 (out_1_mac_11_imag),
    .imag_12 (out_1_mac_12_imag),
    .imag_13 (out_1_mac_13_imag),
    .imag_14 (out_1_mac_14_imag),
    .imag_15 (out_1_mac_15_imag),
    .imag_16 (out_2_mac_0_imag),
    .imag_17 (out_2_mac_1_imag),
    .imag_18 (out_2_mac_2_imag),
    .imag_19 (out_2_mac_3_imag),
    .imag_20 (out_2_mac_4_imag),
    .imag_21 (out_2_mac_5_imag),
    .imag_22 (out_2_mac_6_imag),
    .imag_23 (out_2_mac_7_imag),
    .imag_24 (out_2_mac_8_imag),
    .imag_25 (out_2_mac_9_imag),
    .imag_26 (out_2_mac_10_imag),
    .imag_27 (out_2_mac_11_imag),
    .imag_28 (out_2_mac_12_imag),
    .imag_29 (out_2_mac_13_imag),
    .imag_30 (out_2_mac_14_imag),
    .imag_31 (out_2_mac_15_imag),

    // Outputs (serial 1-bit outputs)
    .real_out(out_real),  
    .imag_out(out_imag)   
);


assign out_0_real = (Final_stage_flag)? out_1_mac_0_real : 16'b0;
assign out_0_imag = (Final_stage_flag)? out_1_mac_0_imag : 16'b0;
assign out_1_real = (Final_stage_flag)? out_1_mac_1_real : 16'b0;
assign out_1_imag = (Final_stage_flag)? out_1_mac_1_imag : 16'b0;
assign out_2_real = (Final_stage_flag)? out_1_mac_2_real : 16'b0;
assign out_2_imag = (Final_stage_flag)? out_1_mac_2_imag : 16'b0;
assign out_3_real = (Final_stage_flag)? out_1_mac_3_real : 16'b0;
assign out_3_imag = (Final_stage_flag)? out_1_mac_3_imag : 16'b0;
assign out_4_real = (Final_stage_flag)? out_1_mac_4_real : 16'b0;
assign out_4_imag = (Final_stage_flag)? out_1_mac_4_imag : 16'b0;
assign out_5_real = (Final_stage_flag)? out_1_mac_5_real : 16'b0;
assign out_5_imag = (Final_stage_flag)? out_1_mac_5_imag : 16'b0;
assign out_6_real = (Final_stage_flag)? out_1_mac_6_real : 16'b0;
assign out_6_imag = (Final_stage_flag)? out_1_mac_6_imag : 16'b0;
assign out_7_real = (Final_stage_flag)? out_1_mac_7_real : 16'b0;
assign out_7_imag = (Final_stage_flag)? out_1_mac_7_imag : 16'b0;
assign out_8_real = (Final_stage_flag)? out_1_mac_8_real : 16'b0;
assign out_8_imag = (Final_stage_flag)? out_1_mac_8_imag : 16'b0;
assign out_9_real = (Final_stage_flag)? out_1_mac_9_real : 16'b0;
assign out_9_imag = (Final_stage_flag)? out_1_mac_9_imag : 16'b0;
assign out_10_real = (Final_stage_flag)? out_1_mac_10_real : 16'b0;
assign out_10_imag = (Final_stage_flag)? out_1_mac_10_imag : 16'b0;
assign out_11_real = (Final_stage_flag)? out_1_mac_11_real : 16'b0;
assign out_11_imag = (Final_stage_flag)? out_1_mac_11_imag : 16'b0;
assign out_12_real = (Final_stage_flag)? out_1_mac_12_real : 16'b0;
assign out_12_imag = (Final_stage_flag)? out_1_mac_12_imag : 16'b0;
assign out_13_real = (Final_stage_flag)? out_1_mac_13_real : 16'b0;
assign out_13_imag = (Final_stage_flag)? out_1_mac_13_imag : 16'b0;
assign out_14_real = (Final_stage_flag)? out_1_mac_14_real : 16'b0;
assign out_14_imag = (Final_stage_flag)? out_1_mac_14_imag : 16'b0;
assign out_15_real = (Final_stage_flag)? out_1_mac_15_real : 16'b0;
assign out_15_imag = (Final_stage_flag)? out_1_mac_15_imag : 16'b0;

assign out_16_real = (Final_stage_flag)? out_2_mac_0_real : 16'b0;
assign out_16_imag = (Final_stage_flag)? out_2_mac_0_imag : 16'b0;
assign out_17_real = (Final_stage_flag)? out_2_mac_1_real : 16'b0;
assign out_17_imag = (Final_stage_flag)? out_2_mac_1_imag : 16'b0;
assign out_18_real = (Final_stage_flag)? out_2_mac_2_real : 16'b0;
assign out_18_imag = (Final_stage_flag)? out_2_mac_2_imag : 16'b0;
assign out_19_real = (Final_stage_flag)? out_2_mac_3_real : 16'b0;
assign out_19_imag = (Final_stage_flag)? out_2_mac_3_imag : 16'b0;
assign out_20_real = (Final_stage_flag)? out_2_mac_4_real : 16'b0;
assign out_20_imag = (Final_stage_flag)? out_2_mac_4_imag : 16'b0;
assign out_21_real = (Final_stage_flag)? out_2_mac_5_real : 16'b0;
assign out_21_imag = (Final_stage_flag)? out_2_mac_5_imag : 16'b0;
assign out_22_real = (Final_stage_flag)? out_2_mac_6_real : 16'b0;
assign out_22_imag = (Final_stage_flag)? out_2_mac_6_imag : 16'b0;
assign out_23_real = (Final_stage_flag)? out_2_mac_7_real : 16'b0;
assign out_23_imag = (Final_stage_flag)? out_2_mac_7_imag : 16'b0;
assign out_24_real = (Final_stage_flag)? out_2_mac_8_real : 16'b0;
assign out_24_imag = (Final_stage_flag)? out_2_mac_8_imag : 16'b0;
assign out_25_real = (Final_stage_flag)? out_2_mac_9_real : 16'b0;
assign out_25_imag = (Final_stage_flag)? out_2_mac_9_imag : 16'b0;
assign out_26_real = (Final_stage_flag)? out_2_mac_10_real : 16'b0;
assign out_26_imag = (Final_stage_flag)? out_2_mac_10_imag : 16'b0;
assign out_27_real = (Final_stage_flag)? out_2_mac_11_real : 16'b0;
assign out_27_imag = (Final_stage_flag)? out_2_mac_11_imag : 16'b0;
assign out_28_real = (Final_stage_flag)? out_2_mac_12_real : 16'b0;
assign out_28_imag = (Final_stage_flag)? out_2_mac_12_imag : 16'b0;
assign out_29_real = (Final_stage_flag)? out_2_mac_13_real : 16'b0;
assign out_29_imag = (Final_stage_flag)? out_2_mac_13_imag : 16'b0;
assign out_30_real = (Final_stage_flag)? out_2_mac_14_real : 16'b0;
assign out_30_imag = (Final_stage_flag)? out_2_mac_14_imag : 16'b0;
assign out_31_real = (Final_stage_flag)? out_2_mac_15_real : 16'b0;
assign out_31_imag = (Final_stage_flag)? out_2_mac_15_imag : 16'b0;

endmodule : FFT_Top