%% This is the driver code
clc; close all; clear;
%% Simulation parameters
Subcarriers = 500; % Number of subcarriers in OFDM transmission
Taps = 20; % Number of taps in OFDM transmission
NoisePower = 3.06e-13; % Estimated Noise power
Bandwidth = 10e6; % Bandwidth for the transmission
Power = 1; % Power for each of the subcarriers
Bits = 1; % Number of bits for discrete phase shift quantization
N = 4096; % Number of RIS elements
PossiblePS = PossiblePhaseShifts(Bits); % Explained in function header
save Params.mat

%% Loading the VT and Initial Configuration
% VT = the cascaded channel
% load VT.mat
load("./Old/VT_sparse.mat");
VT = VT_sparse(1).VT;
% Initial phase shift
InitialConfig = VT_sparse(1).STMInitialConfig;

%% Running the algorithm
FinalConfig = PhaseShiftOptimizer(VT, InitialConfig);

fprintf("Initial Rate: %f, Final Rate: %f\n",...
    DataRate(VT, InitialConfig)/1e6, DataRate(VT, FinalConfig)/1e6);