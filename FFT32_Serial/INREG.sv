module INREG #(parameter IN_ELEMENT_LENGTH = 8)
(
	input wire  						   clk2,	// Clock
	input wire  						   rst_n,	// Asynchronous reset active low
	input wire  						   EN,		//  Enable
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_0, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_1, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_2, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_3, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_4, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_5, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_6, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_7, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_8, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_9, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_10, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_11, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_12, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_13, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_14, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_15, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_16,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_17,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_18,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_19,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_20,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_21,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_22,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_23,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_24,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_25,  
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_26, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_27, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_28, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_29, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_30, 
	input wire signed [IN_ELEMENT_LENGTH-1:0] in_31,
	
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_0, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_1, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_2, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_3, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_4, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_5, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_6, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_7, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_8, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_9, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_10, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_11, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_12, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_13, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_14, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_15, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_16,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_17,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_18,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_19,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_20,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_21,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_22,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_23,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_24,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_25,  
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_26, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_27, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_28, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_29, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_30, 
	output reg signed [IN_ELEMENT_LENGTH-1:0] inreg_31,	 
	output reg 							      EN_REG	
);


always @(posedge clk2 or negedge rst_n) begin
    if(!rst_n) 	
		begin
			inreg_0  <= 0;
			inreg_1  <= 0;
			inreg_2  <= 0;
			inreg_3  <= 0;
			inreg_4  <= 0;
			inreg_5  <= 0;
			inreg_6  <= 0;
			inreg_7  <= 0;
			inreg_8  <= 0;
			inreg_9  <= 0;
			inreg_10 <= 0;
			inreg_11 <= 0;
			inreg_12 <= 0;
			inreg_13 <= 0;
			inreg_14 <= 0;
			inreg_15 <= 0;
			inreg_16 <= 0;
			inreg_17 <= 0;
			inreg_18 <= 0;
			inreg_19 <= 0;
			inreg_20 <= 0;
			inreg_21 <= 0;
			inreg_22 <= 0;
			inreg_23 <= 0;
			inreg_24 <= 0;
			inreg_25 <= 0;
			inreg_26 <= 0;
			inreg_27 <= 0;
			inreg_28 <= 0;
			inreg_29 <= 0;
			inreg_30 <= 0;
			inreg_31 <= 0;
			EN_REG   <= 0;
		end	
	else
		begin 
			inreg_0  <= in_0;
			inreg_1  <= in_1;
			inreg_2  <= in_2;
			inreg_3  <= in_3;
			inreg_4  <= in_4;
			inreg_5  <= in_5;
			inreg_6  <= in_6;
			inreg_7  <= in_7;
			inreg_8  <= in_8;
			inreg_9  <= in_9;
			inreg_10 <= in_10;
			inreg_11 <= in_11;
			inreg_12 <= in_12;
			inreg_13 <= in_13;
			inreg_14 <= in_14;
			inreg_15 <= in_15;
			inreg_16 <= in_16;
			inreg_17 <= in_17;
			inreg_18 <= in_18;
			inreg_19 <= in_19;
			inreg_20 <= in_20;
			inreg_21 <= in_21;
			inreg_22 <= in_22;
			inreg_23 <= in_23;
			inreg_24 <= in_24;
			inreg_25 <= in_25;
			inreg_26 <= in_26;
			inreg_27 <= in_27;
			inreg_28 <= in_28;
			inreg_29 <= in_29;
			inreg_30 <= in_30;
			inreg_31 <= in_31;
			EN_REG   <= EN;
		end    	
end

endmodule 