function [R] = DataRateCalculator(VT, w, noisePower, Bandwidth, Subcarriers, Taps, Power, bits)
    FM = dftmatrix(Subcarriers, Taps);
    % Phase shift mapping - It has to be (2*n+1)*(pi/2^b) wherein b is the
    % number of bits and n belongs to [0, 2^(b-1))
    w_matrix_ph = w*pi/(2^bits);
    w_matrix = exp(1i*w_matrix_ph);
    h = VT*w_matrix;
    H_pad =FM*h(1:Taps, :);
    % Throughput
    R = Bandwidth/(Subcarriers + Taps - 1) * sum(log2(1 + Power * abs(H_pad).^2 / (noisePower))); 
end

