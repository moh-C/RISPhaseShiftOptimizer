function [Rate] = DataRate(VT, RISConfig)
% This function returns the throughput that is achieved with a particular
% phase shift configuration. Inputs are:
% VT = the cascaded channel of Tx-RIS and RIS-Rx
% RISConfig = is the phase shift.
% RISConfig should be [-2*n-1], [2*n+1] for n in range(2^(bits-1)).
% For example we have two bits, the result is -3, -1, 1, 3 since n is [0, 2)
% Parameters specified in the driver code are:
% NoisePower = the power of noise (or an estimation of it)
% Bandwidth = the allocated bandwidth for the simulations
% Subcarriers = the number of subcarriers in OFDM transmission
% Taps = Number of taps
% Power = Power for each subcarrier
% Bits = bits for RIS. Due to obvious reasons, RIS can't have continous
% phase shift, thus, there is a need for phase shift quantization.
% bits = 1 corresponds to a phase shift of -1, +1 (a binary phase shift)
% bits = 2 corresponds to -3, -1, +1, +3 and so on
    load Params.mat Subcarriers Taps NoisePower Bits Power Bandwidth;
    FM = dftmatrix(Subcarriers, Taps);
    % Phase shift mapping - It has to be (2*n+1)*(pi/2^b) wherein b is the
    % number of bits and n belongs to [0, 2^(b-1))
    w_matrix_ph = RISConfig*pi/(2^Bits);
    w_matrix = exp(1i*w_matrix_ph);
    h = VT*w_matrix;
    H_pad =FM*h(1:Taps, :);
    % Throughput
    Rate = Bandwidth/(Subcarriers + Taps - 1) * sum(log2(1 + Power * abs(H_pad).^2 / (NoisePower))); 
end

