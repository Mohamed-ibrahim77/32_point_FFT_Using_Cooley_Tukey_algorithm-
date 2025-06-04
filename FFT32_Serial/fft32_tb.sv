`timescale 1ns/1ns
module fft32_tb();

    //import "DPI-C" function real matlab_model_dpi(input real x);


    parameter INPUT_LENGTH = 8;
    parameter out_LENGTH = 16;
    parameter CLK_PERIOD=10;

	logic  						   clk;    // Clock
	logic  						   clk_en; // Clock Enable
	logic  						   rst;  // Asynchronous reset active low
	logic signed [INPUT_LENGTH-1:0] in_0; 
	logic signed [INPUT_LENGTH-1:0] in_1; 
	logic signed [INPUT_LENGTH-1:0] in_2; 
	logic signed [INPUT_LENGTH-1:0] in_3; 
	logic signed [INPUT_LENGTH-1:0] in_4; 
	logic signed [INPUT_LENGTH-1:0] in_5; 
	logic signed [INPUT_LENGTH-1:0] in_6; 
	logic signed [INPUT_LENGTH-1:0] in_7; 
	logic signed [INPUT_LENGTH-1:0] in_8; 
	logic signed [INPUT_LENGTH-1:0] in_9; 
	logic signed [INPUT_LENGTH-1:0] in_10; 
	logic signed [INPUT_LENGTH-1:0] in_11; 
	logic signed [INPUT_LENGTH-1:0] in_12; 
	logic signed [INPUT_LENGTH-1:0] in_13; 
	logic signed [INPUT_LENGTH-1:0] in_14; 
	logic signed [INPUT_LENGTH-1:0] in_15; 
	logic signed [INPUT_LENGTH-1:0] in_16;  
	logic signed [INPUT_LENGTH-1:0] in_17;  
	logic signed [INPUT_LENGTH-1:0] in_18;  
	logic signed [INPUT_LENGTH-1:0] in_19;  
	logic signed [INPUT_LENGTH-1:0] in_20;  
	logic signed [INPUT_LENGTH-1:0] in_21;  
	logic signed [INPUT_LENGTH-1:0] in_22;  
	logic signed [INPUT_LENGTH-1:0] in_23;  
	logic signed [INPUT_LENGTH-1:0] in_24;  
	logic signed [INPUT_LENGTH-1:0] in_25;  
	logic signed [INPUT_LENGTH-1:0] in_26; 
	logic signed [INPUT_LENGTH-1:0] in_27; 
	logic signed [INPUT_LENGTH-1:0] in_28; 
	logic signed [INPUT_LENGTH-1:0] in_29; 
	logic signed [INPUT_LENGTH-1:0] in_30; 
	logic signed [INPUT_LENGTH-1:0] in_31;

	logic signed [out_LENGTH-1:0] out_0_real; 
	logic signed [out_LENGTH-1:0] out_1_real; 
	logic signed [out_LENGTH-1:0] out_2_real; 
	logic signed [out_LENGTH-1:0] out_3_real; 
	logic signed [out_LENGTH-1:0] out_4_real; 
	logic signed [out_LENGTH-1:0] out_5_real; 
	logic signed [out_LENGTH-1:0] out_6_real; 
	logic signed [out_LENGTH-1:0] out_7_real; 
	logic signed [out_LENGTH-1:0] out_8_real; 
	logic signed [out_LENGTH-1:0] out_9_real; 
	logic signed [out_LENGTH-1:0] out_10_real; 
	logic signed [out_LENGTH-1:0] out_11_real; 
	logic signed [out_LENGTH-1:0] out_12_real; 
	logic signed [out_LENGTH-1:0] out_13_real; 
	logic signed [out_LENGTH-1:0] out_14_real; 
	logic signed [out_LENGTH-1:0] out_15_real; 
	logic signed [out_LENGTH-1:0] out_16_real;  
	logic signed [out_LENGTH-1:0] out_17_real;  
	logic signed [out_LENGTH-1:0] out_18_real;  
	logic signed [out_LENGTH-1:0] out_19_real;  
	logic signed [out_LENGTH-1:0] out_20_real;  
	logic signed [out_LENGTH-1:0] out_21_real;  
	logic signed [out_LENGTH-1:0] out_22_real;  
	logic signed [out_LENGTH-1:0] out_23_real;  
	logic signed [out_LENGTH-1:0] out_24_real;  
	logic signed [out_LENGTH-1:0] out_25_real;  
	logic signed [out_LENGTH-1:0] out_26_real; 
	logic signed [out_LENGTH-1:0] out_27_real; 
	logic signed [out_LENGTH-1:0] out_28_real; 
	logic signed [out_LENGTH-1:0] out_29_real; 
	logic signed [out_LENGTH-1:0] out_30_real; 
	logic signed [out_LENGTH-1:0] out_31_real;	  

	logic signed [out_LENGTH-1:0] out_0_imag; 
	logic signed [out_LENGTH-1:0] out_1_imag; 
	logic signed [out_LENGTH-1:0] out_2_imag; 
	logic signed [out_LENGTH-1:0] out_3_imag; 
	logic signed [out_LENGTH-1:0] out_4_imag; 
	logic signed [out_LENGTH-1:0] out_5_imag; 
	logic signed [out_LENGTH-1:0] out_6_imag; 
	logic signed [out_LENGTH-1:0] out_7_imag; 
	logic signed [out_LENGTH-1:0] out_8_imag; 
	logic signed [out_LENGTH-1:0] out_9_imag; 
	logic signed [out_LENGTH-1:0] out_10_imag; 
	logic signed [out_LENGTH-1:0] out_11_imag; 
	logic signed [out_LENGTH-1:0] out_12_imag; 
	logic signed [out_LENGTH-1:0] out_13_imag; 
	logic signed [out_LENGTH-1:0] out_14_imag; 
	logic signed [out_LENGTH-1:0] out_15_imag; 
	logic signed [out_LENGTH-1:0] out_16_imag;  
	logic signed [out_LENGTH-1:0] out_17_imag;  
	logic signed [out_LENGTH-1:0] out_18_imag;  
	logic signed [out_LENGTH-1:0] out_19_imag;  
	logic signed [out_LENGTH-1:0] out_20_imag;  
	logic signed [out_LENGTH-1:0] out_21_imag;  
	logic signed [out_LENGTH-1:0] out_22_imag;  
	logic signed [out_LENGTH-1:0] out_23_imag;  
	logic signed [out_LENGTH-1:0] out_24_imag;  
	logic signed [out_LENGTH-1:0] out_25_imag;  
	logic signed [out_LENGTH-1:0] out_26_imag; 
	logic signed [out_LENGTH-1:0] out_27_imag; 
	logic signed [out_LENGTH-1:0] out_28_imag; 
	logic signed [out_LENGTH-1:0] out_29_imag; 
	logic signed [out_LENGTH-1:0] out_30_imag; 
	logic signed [out_LENGTH-1:0] out_31_imag;		



    
    
	integer input_file;
	integer stage5_file_real;
	integer stage5_file_imag;
	
task check_output_stage();  // compares final stage output of HDL with MATLAB
    automatic logic [out_LENGTH-1 : 0] reference_output_real;
    automatic logic [out_LENGTH-1 : 0] reference_output_imag;

    // sample 0
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_0_real  ) begin
        $display("Error in output stage in real part sample 0 at time %1d",$time);
    end
    if(reference_output_imag !== out_0_imag  ) begin
        $display("Error in output stage in imag part sample 0 at time %1d",$time);
    end

    // sample 1
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_1_real  ) begin
        $display("Error in output stage in real part sample 1 at time %1d",$time);
    end
    if(reference_output_imag !== out_1_imag  ) begin
        $display("Error in output stage in imag part sample 1 at time %1d",$time);
    end
    
    // sample 2
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_2_real  ) begin
        $display("Error in output stage in real part sample 2 at time %1d",$time);
    end
    if(reference_output_imag !== out_2_imag  ) begin
        $display("Error in output stage in imag part sample 2 at time %1d",$time);
    end

    // sample 3
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_3_real  ) begin
        $display("Error in output stage in real part sample 3 at time %1d",$time);
    end
    if(reference_output_imag !== out_3_imag  ) begin
        $display("Error in output stage in imag part sample 3 at time %1d",$time);
    end


    // sample 4
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_4_real  ) begin
        $display("Error in output stage in real part sample 4 at time %1d",$time);
    end
    if(reference_output_imag !== out_4_imag  ) begin
        $display("Error in output stage in imag part sample 4 at time %1d",$time);
    end



    // sample 5
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_5_real  ) begin
        $display("Error in output stage in real part sample 5 at time %1d",$time);
    end
    if(reference_output_imag !== out_5_imag  ) begin
        $display("Error in output stage in imag part sample 5 at time %1d",$time);
    end



    // sample 6
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_6_real  ) begin
        $display("Error in output stage in real part sample 6 at time %1d",$time);
    end
    if(reference_output_imag !== out_6_imag  ) begin
        $display("Error in output stage in imag part sample 6 at time %1d",$time);
    end



    // sample 7
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_7_real  ) begin
        $display("Error in output stage in real part sample 7 at time %1d",$time);
    end
    if(reference_output_imag !== out_7_imag  ) begin
        $display("Error in output stage in imag part sample 7 at time %1d",$time);
    end


    // sample 8
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_8_real  ) begin
        $display("Error in output stage in real part sample 8 at time %1d",$time);
    end
    if(reference_output_imag !== out_8_imag  ) begin
        $display("Error in output stage in imag part sample 8 at time %1d",$time);
    end



    // sample 9
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_9_real  ) begin
        $display("Error in output stage in real part sample 9 at time %1d",$time);
    end
    if(reference_output_imag !== out_9_imag  ) begin
        $display("Error in output stage in imag part sample 9 at time %1d",$time);
    end



    // sample 10
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_10_real  ) begin
        $display("Error in output stage in real part sample 10 at time %1d",$time);
    end
    if(reference_output_imag !== out_10_imag  ) begin
        $display("Error in output stage in imag part sample 10 at time %1d",$time);
    end


    // sample 11
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_11_real  ) begin
        $display("Error in output stage in real part sample 11 at time %1d",$time);
    end
    if(reference_output_imag !== out_11_imag  ) begin
        $display("Error in output stage in imag part sample 11 at time %1d",$time);
    end
    
    // sample 12
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_12_real  ) begin
        $display("Error in output stage in real part sample 12 at time %1d",$time);
    end
    if(reference_output_imag !== out_12_imag  ) begin
        $display("Error in output stage in imag part sample 12 at time %1d",$time);
    end


    // sample 13
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_13_real  ) begin
        $display("Error in output stage in real part sample 13 at time %1d",$time);
    end
    if(reference_output_imag !== out_13_imag  ) begin
        $display("Error in output stage in imag part sample 13 at time %1d",$time);
    end


    // sample 14
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_14_real  ) begin
        $display("Error in output stage in real part sample 14 at time %1d",$time);
    end
    if(reference_output_imag !== out_14_imag  ) begin
        $display("Error in output stage in imag part sample 14 at time %1d",$time);
    end


    // sample 15
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_15_real  ) begin
        $display("Error in output stage in real part sample 15 at time %1d",$time);
    end
    if(reference_output_imag !== out_15_imag  ) begin
        $display("Error in output stage in imag part sample 15 at time %1d",$time);
    end


    // sample 16
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_16_real  ) begin
        $display("Error in output stage in real part sample 16 at time %1d",$time);
    end
    if(reference_output_imag !== out_16_imag  ) begin
        $display("Error in output stage in imag part sample 16 at time %1d",$time);
    end


    // sample 17
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_17_real  ) begin
        $display("Error in output stage in real part sample 17 at time %1d",$time);
    end
    if(reference_output_imag !== out_17_imag  ) begin
        $display("Error in output stage in imag part sample 17 at time %1d",$time);
    end


    // sample 18
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_18_real  ) begin
        $display("Error in output stage in real part sample 18 at time %1d",$time);
    end
    if(reference_output_imag !== out_18_imag  ) begin
        $display("Error in output stage in imag part sample 18 at time %1d",$time);
    end


    // sample 19
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_19_real  ) begin
        $display("Error in output stage in real part sample 19 at time %1d",$time);
    end
    if(reference_output_imag !== out_19_imag  ) begin
        $display("Error in output stage in imag part sample 19 at time %1d",$time);
    end

    // sample 20
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_20_real  ) begin
        $display("Error in output stage in real part sample 20 at time %1d",$time);
    end
    if(reference_output_imag !== out_20_imag  ) begin
        $display("Error in output stage in imag part sample 20 at time %1d",$time);
    end

    // sample 21
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_21_real  ) begin
        $display("Error in output stage in real part sample 21 at time %1d",$time);
    end
    if(reference_output_imag !== out_21_imag  ) begin
        $display("Error in output stage in imag part sample 21 at time %1d",$time);
    end

    // sample 22
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_22_real  ) begin
        $display("Error in output stage in real part sample 22 at time %1d",$time);
    end
    if(reference_output_imag !== out_22_imag  ) begin
        $display("Error in output stage in imag part sample 22 at time %1d",$time);
    end

    // sample 23
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_23_real  ) begin
        $display("Error in output stage in real part sample 23 at time %1d",$time);
    end
    if(reference_output_imag !== out_23_imag  ) begin
        $display("Error in output stage in imag part sample 23 at time %1d",$time);
    end

    // sample 24
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_24_real  ) begin
        $display("Error in output stage in real part sample 24 at time %1d",$time);
    end
    if(reference_output_imag !== out_24_imag  ) begin
        $display("Error in output stage in imag part sample 24 at time %1d",$time);
    end

    // sample 25
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_25_real  ) begin
        $display("Error in output stage in real part sample 25 at time %1d",$time);
    end
    if(reference_output_imag !== out_25_imag  ) begin
        $display("Error in output stage in imag part sample 25 at time %1d",$time);
    end

    // sample 26
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_26_real  ) begin
        $display("Error in output stage in real part sample 26 at time %1d",$time);
    end
    if(reference_output_imag !== out_26_imag  ) begin
        $display("Error in output stage in imag part sample 26 at time %1d",$time);
    end


    // sample 27
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_27_real  ) begin
        $display("Error in output stage in real part sample 27 at time %1d",$time);
    end
    if(reference_output_imag !== out_27_imag  ) begin
        $display("Error in output stage in imag part sample 27 at time %1d",$time);
    end


    // sample 28
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_28_real  ) begin
        $display("Error in output stage in real part sample 28 at time %1d",$time);
    end
    if(reference_output_imag !== out_28_imag  ) begin
        $display("Error in output stage in imag part sample 28 at time %1d",$time);
    end

    // sample 29
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_29_real  ) begin
        $display("Error in output stage in real part sample 29 at time %1d",$time);
    end
    if(reference_output_imag !== out_29_imag  ) begin
        $display("Error in output stage in imag part sample 29 at time %1d",$time);
    end


    // sample 30
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_30_real  ) begin
        $display("Error in output stage in real part sample 30 at time %1d",$time);
    end
    if(reference_output_imag !== out_30_imag  ) begin
        $display("Error in output stage in imag part sample 30 at time %1d",$time);
    end

    // sample 31
    assert($fscanf(stage5_file_real, "%h\n", reference_output_real) );
    assert($fscanf(stage5_file_imag, "%h\n", reference_output_imag) );
    if(reference_output_real !== out_31_real  ) begin
        $display("Error in output stage in real part sample 31 at time %1d",$time);
    end
    if(reference_output_imag !== out_31_imag  ) begin
        $display("Error in output stage in imag part sample 31 at time %1d",$time);
    end
endtask

    
    initial begin
        clk =0;
        forever begin
            #5;
            clk = ~clk;
        end
        
    end

FFT_Top #(.TWIDDLE_LENGTH(out_LENGTH),.RAM_DEPTH(16),.IN_ELEMENT_LENGTH(INPUT_LENGTH),.OUT_WORD_WIDTH(out_LENGTH)) data_out(.*);


    logic signed [INPUT_LENGTH-1:0] stimulus_input [32];

	task stimulus_generate();
        for(int i =0; i<32; i++)
            assert($fscanf(input_file, "%h\n", stimulus_input[i]) );
            assign_stimulus();
    endtask


    task assign_stimulus();
        in_0 = stimulus_input[0];
        in_1 = stimulus_input[1];
        in_2 = stimulus_input[2];
        in_3 = stimulus_input[3];
        in_4 = stimulus_input[4];
        in_5 = stimulus_input[5];
        in_6 = stimulus_input[6];
        in_7 = stimulus_input[7];
        in_8 = stimulus_input[8];
        in_9 = stimulus_input[9];
        in_10 = stimulus_input[10];
        in_11 = stimulus_input[11];
        in_12 = stimulus_input[12];
        in_13 = stimulus_input[13];
        in_14 = stimulus_input[14];
        in_15 = stimulus_input[15];
        in_16 = stimulus_input[16];
        in_17 = stimulus_input[17];
        in_18 = stimulus_input[18];
        in_19 = stimulus_input[19];
        in_20 = stimulus_input[20];
        in_21 = stimulus_input[21];
        in_22 = stimulus_input[22];
        in_23 = stimulus_input[23];
        in_24 = stimulus_input[24];
        in_25 = stimulus_input[25];
        in_26 = stimulus_input[26];
        in_27 = stimulus_input[27];
        in_28 = stimulus_input[28];
        in_29 = stimulus_input[29];
        in_30 = stimulus_input[30];
        in_31 = stimulus_input[31];
    endtask

integer hdl_output_real_text;
integer hdl_output_imag_text;

task write_output_data();
	$fwrite(hdl_output_real_text, "%h\n", out_0_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_0_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_1_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_1_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_2_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_2_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_3_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_3_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_4_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_4_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_5_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_5_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_6_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_6_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_7_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_7_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_8_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_8_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_9_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_9_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_10_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_10_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_11_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_11_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_12_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_12_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_13_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_13_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_14_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_14_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_15_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_15_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_16_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_16_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_17_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_17_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_18_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_18_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_19_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_19_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_20_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_20_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_21_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_21_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_22_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_22_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_23_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_23_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_24_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_24_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_25_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_25_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_26_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_26_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_27_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_27_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_28_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_28_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_29_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_29_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_30_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_30_imag);
	$fwrite(hdl_output_real_text, "%h\n", out_31_real);
	$fwrite(hdl_output_imag_text, "%h\n", out_31_imag);

endtask



parameter iterations = 6;
initial begin
    
        input_file = $fopen("input_data.txt","r");
        stage5_file_real = $fopen("stage5_out_real.txt", "r");
        stage5_file_imag = $fopen("stage5_out_imag.txt", "r");
        hdl_output_real_text = $fopen("HDL_output_real.txt", "w");
        hdl_output_imag_text = $fopen("HDL_output_imag.txt", "w");
        rst = 0;
        clk_en = 0;
        #(CLK_PERIOD)
		rst = 1;
        clk_en = 1;
        repeat(iterations) begin    
            stimulus_generate();
            #(6*CLK_PERIOD)
            check_output_stage();
            // write HDL result to a text file
            write_output_data();
        end

		$fclose(input_file);
        $fclose(stage5_file_real);
        $fclose(stage5_file_imag);
		$fclose(hdl_output_real_text);
		$fclose(hdl_output_imag_text);
        $stop;


end
























endmodule

