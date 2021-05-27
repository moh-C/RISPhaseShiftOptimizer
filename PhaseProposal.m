function [PhaseLevels] = PhaseProposal(CurrentConfig)
% The phases to be exploited. Primarily, if you have a 2 bit system for 3
% elements and the current configuration is: [-3 3 1], the result will be
% [-1 1 3; -3 -1 1; -3 -1 3]
    load Params.mat PossiblePS N;
    PhaseLevels = zeros(N, length(PossiblePS)-1);
    for i=1:N
        PhaseLevels(i, :) = setdiff(PossiblePS, CurrentConfig(i));
    end
end