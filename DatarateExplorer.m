function [RateVector] = DatarateExplorer(VT, CurrentConfig, ProposedConfig)
    %load Params.mat N;
    N = length(CurrentConfig);
    PhaseVector = repmat(CurrentConfig, 1, N);
    PhaseVector = PhaseVector - diag(diag(PhaseVector)) + diag(ProposedConfig);
    
    PhaseVector(:, N+1) = CurrentConfig;
    RateVector = DataRate(VT, PhaseVector);
    RateVector = RateVector(1:N) - RateVector(N + 1);
end

