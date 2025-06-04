# 32_point_FFT_Using_Cooley_Tukey_algorithm

The problem of frequency selective channels is a significant one in wireless communications. An equalizer can 
be used to invert the channel and cancel the effect of channel selectivity, but it’s too complex to implement if 
the channel is too selective. A better approach to combat selective channels is orthogonal frequency division 
multiplexing (OFDM) in which the channel is divided into many small sub-channels, converting the selective 
channel into small flat sub-channels. At the transmitter, the subcarriers are modulated in frequency domain, and 
then IFFT is used to transform this into time domain samples. At the receiver, the time domain samples are 
transformed back to frequency domain using FFT for further processing. 

![image](https://github.com/user-attachments/assets/67a4da1e-1e20-4d2a-b45a-2f2c8f65e478)

[32_Point_FFT_Using_Cooley_Tukey_Algorithm.pdf](https://github.com/user-attachments/files/20591560/32_Point_FFT_Using_Cooley_Tukey_Algorithm.pdf)
