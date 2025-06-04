% Parameters
clear all;
clc;
N = 32;
word_length_ip = 8;  % word length of input samples
fraction_length_ip = 4; % fraction length of input samples
word_length_stages = 16; % word length of output and each stage samples
fraction_length_stages = 8; % fractional length of output and each stage samples

iterations = 3; % number of input samples generated
evm_values = zeros(1,iterations); % vector that contatins the calculateed evm value in each loop iteration

for iteration_counter = 1:iterations
    %% Data generation
    x = randi([-2^(3) 2^(3)-1], 1, N) .* (-1+2*rand(1,N)); % genrate floating point numbers between 8 and 7 
    % convert random samples of type double into S4.4 samples
    x_fp = fi(x, 1, word_length_ip, fraction_length_ip,'RoundingMethod', 'Round', 'OverflowAction', 'Saturate');
    % round and sat is used as in RTL 
    X_ref = fft(x,N); % calculate reference fft using matlab built in function to use in EVM calculations
    %% Save Input data
    datasaved = x_fp;
    filename_real_input = 'input_data.txt';
    fileID_real_input_DDC = fopen(filename_real_input, 'w');
    hex_x_t_inputDDC_real = hex(datasaved(:));
    
    for i = 1:length(hex_x_t_inputDDC_real)
        fprintf(fileID_real_input_DDC, '%s\n', hex_x_t_inputDDC_real(i, :)); 
    end
    fclose("all");
    
    % bit reverse input to match architecture
    stage_output = fi(x_fp(bitrevorder(1:N)), 1, word_length_stages, fraction_length_stages,'RoundingMethod', 'Round', 'OverflowAction', 'Saturate');
    
    % twiddle factors
    W = fi(exp(-1j*2*pi*(0:N/2-1)/N), 1, word_length_stages, fraction_length_stages,'RoundingMethod', 'Round', 'OverflowAction', 'Saturate');
    
    %% Fixed point model of FFT
    for s = 1:log2(N)
        m = 2^s;
        half_m = m / 2;
        for k = 0:(N/m - 1)
            for j = 0:(half_m - 1)
                index_1 = k * m + j + 1;
                index_2 = index_1 + half_m;
    
                twiddle = W(j * N / m + 1);
                odd_part = fi(stage_output(index_2) * twiddle, 1, word_length_stages, fraction_length_stages, 'RoundingMethod', 'Round', 'OverflowAction', 'Saturate');
                even_part = stage_output(index_1);
    
                stage_output(index_1) = fi(even_part + odd_part, 1, word_length_stages, fraction_length_stages,'RoundingMethod', 'Round', 'OverflowAction', 'Saturate'); % MAC output 1
                stage_output(index_2) = fi(even_part - odd_part, 1, word_length_stages, fraction_length_stages,'RoundingMethod', 'Round', 'OverflowAction', 'Saturate'); % MAC output 2
            end
        end
    end
    
    X = stage_output;  % fixed point fft model output
    
    %% Save data of Output stage
    datasaved_real = real(X);
    filename_real_input = 'stage5_out_real.txt';
    fileID_real_input_DDC = fopen(filename_real_input, 'w');
    hex_x_t_inputDDC_real = hex(datasaved_real(:));
    
    for i = 1:length(hex_x_t_inputDDC_real)
        fprintf(fileID_real_input_DDC, '%s\n', hex_x_t_inputDDC_real(i, :)); 
    end
    
    fclose("all");
    
    datasaved_imag = imag(X);
    filename_real_input = 'stage5_out_imag.txt';
    fileID_real_input_DDC = fopen(filename_real_input, 'w');
    hex_x_t_inputDDC_real = hex(datasaved_imag(:));
    
    for i = 1:length(hex_x_t_inputDDC_real)
        fprintf(fileID_real_input_DDC, '%s\n', hex_x_t_inputDDC_real(i, :)); 
    end
    fclose("all");
    
    % calculate evm between floating point and fixed point fft results
    evm_values(iteration_counter) = EVm(double(X), double(X_ref)); 

end

fprintf("The resulting EVM is %2f \n",mean(evm_values));

%% EVM Function
function result_db = EVm(Sig1, Sig2)

% Measure the EVM and average over both the subcarriers and the OFDM symbols.
evm = comm.EVM('MaximumEVMOutputPort',true,...
    'XPercentileEVMOutputPort',true, 'XPercentileValue',100,...
    'SymbolCountOutputPort',true,'AveragingDimensions',[1 2]);

[rmsEVM,maxEVM,pctEVM,numSym]=evm(Sig1,Sig2);

% Display RMS EVM (Percent)
% disp(['RMS EVM (%): ', num2str(rmsEVM)]);

% Convert RMS EVM to dB
evm_dB = -20 * log10(rmsEVM / 100);
% disp(['RMS EVM (dB): ', num2str(evm_dB)]);
result_db= evm_dB;
end

