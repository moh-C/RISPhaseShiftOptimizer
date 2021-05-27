function [FinalConfiguration] = PhaseShiftOptimizer(VT, InitialConfiguration)
% The main function for phase shift optimization
    TopK = +inf;
    progressing = true;
    while TopK > 0 && progressing
        UnexploredPhases = PhaseProposal(CurrentConfig);
        % #TODO: PhaseProposal function should be implemented. This
        % function provides the phase shifts that are feasible. For
        % example, if you have 2 bits and the current state for that
        % particular element is +1, this function will return -3, -1, 3
        % This process is repeated for all of the elements
    end
    FinalConfiguration = VT*InitialConfiguration;
end