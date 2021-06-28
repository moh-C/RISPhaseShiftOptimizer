function [FinalConfiguration] = PhaseShiftOptimizer(VT, InitialConfiguration)
% The main function for phase shift optimization
    load Params.mat PossiblePS N;
    TopK = +inf;
    % progressing = true;
    CurrentConfig = reshape(InitialConfiguration, [], 1);
    HyperParam = 0.75;
    while TopK > 0
        % Identifying the unexplored phases
        UnexploredPhases = PhaseProposal(CurrentConfig);
        % After changing each element's configuration and comparing them
        % with our initial configuration, let's see the impact
        RatesVec = zeros(N, length(PossiblePS)-1);
        for i=1:length(PossiblePS)-1
            RatesVec(:, i) = DatarateExplorer(VT, CurrentConfig, UnexploredPhases(:, i));
        end
        % Out of all the proposed configurations, select the ones which
        % have a positive impact. There also is an option of selecting a
        % subset of those elements
        [maxRates, maxRatesidx] = max(RatesVec, [], 2);
        TopK = length(find(maxRates > 0));
        [~,TopBiratesIdx] = maxk(maxRates,int8(TopK*HyperParam));
        idx = sub2ind(size(UnexploredPhases), TopBiratesIdx, maxRatesidx(TopBiratesIdx));
        CurrentConfig(TopBiratesIdx) = UnexploredPhases(idx);
        fprintf("Datarate: %f\n", DataRate(VT, CurrentConfig)/1e6);
    end
    FinalConfiguration = CurrentConfig;
end