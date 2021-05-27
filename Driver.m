%% This is the driver code
clc; close all; clear;
%% Setting the parameters for simulations
% VT = the cascaded channel
% load VT.mat
% Initial phase shift
Subcarriers = 500; % Number of subcarriers in OFDM transmission
Taps = 20; % Number of taps in OFDM transmission
NoisePower = 3e-14; % Estimated Noise power
Bandwidth = 10e6; % Bandwidth for the transmission
Power = 1e-3; % Power for each of the subcarriers
Bits = 1; % Number of bits for discrete phase shift quantization
N = 4096; % Number of RIS elements
PossiblePS = PossiblePhaseShifts(Bits); % Explained in function header
save Params.mat