function [Rate] = DataRateUB(VT)
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
    load Params.mat Subcarriers Taps NoisePower Power Bandwidth;
    FM = dftmatrix(Subcarriers, Taps);
    h = VT;
    H_pad =FM*h;
    % Throughput
    Rate = Bandwidth/(Subcarriers + Taps - 1) * sum(log2(1 + Power * sum(abs(H_pad), 2).^2 / (NoisePower))); 
end