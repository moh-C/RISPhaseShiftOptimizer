function [Rate] = DataRate(VT, w, noisePower, Bandwidth, Subcarriers, Taps, Power, bits)
% This function returns the throughput that is achieved with a particular
% phase shift configuration. Inputs are:
% VT = the cascaded channel of Tx-RIS and RIS-Rx
% w = is the phase shift. w should be [-2*n-1], [2*n+1] for n in range(2^(bits-1)).
% For example we have two bits, the result is -3, -1, 1, 3 since n is [0, 2)
% noisePower = the power of noise
% Bandwidth = the allocated bandwidth for the simulations
% Subcarriers = the number of subcarriers in OFDM transmission
% Taps = is the number of taps
% Power = is the power for each subcarrier
% bits = bits for RIS. Due to obvious reasons, RIS can't have continous
% phase shift, thus, there is a need for phase shift quantization.
% bits = 1 corresponds to a phase shift of -1, +1 (a binary phase shift)
% bits = 2 corresponds to -3, -1, +1, +3 and so on

    FM = dftmatrix(Subcarriers, Taps);
    % Phase shift mapping - It has to be (2*n+1)*(pi/2^b) wherein b is the
    % number of bits and n belongs to [0, 2^(b-1))
    w_matrix_ph = w*pi/(2^bits);
    w_matrix = exp(1i*w_matrix_ph);
    h = VT*w_matrix;
    H_pad =FM*h(1:Taps, :);
    % Throughput
    Rate = Bandwidth/(Subcarriers + Taps - 1) * sum(log2(1 + Power * abs(H_pad).^2 / (noisePower))); 
end

