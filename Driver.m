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
VT = GenerateChannel();
InitialConfig = STM(VT);
UpperBound = DataRateUB(VT)/1e6;

%% Running aggressive algorithm
start_1 = datetime;
FinalConfig2 = PhaseShiftOptimizer(VT, InitialConfig);
fprintf("Initial Rate: %f, Final Rate: %f\n",...
    DataRate(VT, InitialConfig)/1e6, DataRate(VT, FinalConfig2)/1e6);
time1 = datetime - start_1;
disp(time1);

%% Running greedy algorithm
start_2 = datetime;
FinalConfig = greedy_algorithm(VT, InitialConfig);
fprintf("Initial Rate: %f, Final Rate: %f\n",...
    DataRate(VT, InitialConfig)/1e6, DataRate(VT, FinalConfig)/1e6);
time2 = datetime - start_2;
disp(time2);