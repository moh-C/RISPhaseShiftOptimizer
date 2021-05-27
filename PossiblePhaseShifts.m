function [PhaseShifts] = PossiblePhaseShifts(bits)
% Given a number of bits, this function returns the possible phase shifts.
    PhaseShifts = zeros(2^bits, 1);
    for i=0:2^(bits-1)-1
        PhaseShifts(2*i+1) = 2*i+1;
        PhaseShifts(2*i+2) = -2*i-1;
    end
    PhaseShifts = sort(PhaseShifts);
end