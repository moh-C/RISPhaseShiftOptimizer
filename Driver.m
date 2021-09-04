%% This is the driver code
clc; close all; clear;
%% Simulation parameters
Subcarriers = 500; % Number of subcarriers in OFDM transmission
Taps = 20; % Number of taps in OFDM transmission
NoisePower = db2pow(-174+9)/1000*10e6; %W per Hz
Bandwidth = 10e6; % Bandwidth for the transmission
Power = 1/Subcarriers; % Power for each of the subcarriers
Bits = 1; % Number of bits for discrete phase shift quantization
N = 4096; % Number of RIS elements
PossiblePS = PossiblePhaseShifts(Bits); % Explained in function header
save Params.mat

%% Running the algorithm
dSR = 110; % Source to RIS [m]
dRD = 10; % RIS to Destination [m]
VT = GenerateChannel(1, dSR, dRD);
InitialConfig = STM(VT);
UpperBound = DataRateUB(VT)/1e6;

%% Running aggressive algorithm
FinalConfig = PhaseShiftOptimizer(VT, InitialConfig);

%% Reporting the results
fprintf("The initial rate was: %f\nThe final rate is: %f\n", ...
    DataRate(VT, InitialConfig)/1e6, DataRate(VT, FinalConfig)/1e6);