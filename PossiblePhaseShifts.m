function [PhaseShifts] = PossiblePhaseShifts(bits)
% Given a number of bits, this function returns the possible phase shifts.
% If the RIS is capable of 1-bit, the possible phase shifts are -1, +1
% while if the RIS is capable of having 2 bits, the possible phase shifts
% are: -3, -1, 1, 3
    PhaseShifts = zeros(2^bits, 1);
    for i=0:2^(bits-1)-1
        PhaseShifts(2*i+1) = 2*i+1;
        PhaseShifts(2*i+2) = -2*i-1;
    end
    PhaseShifts = sort(PhaseShifts);
end