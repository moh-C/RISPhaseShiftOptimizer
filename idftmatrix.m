function [dftmat] = idftmatrix(K, M)
    w = zeros(K, M);
    for k=0:K-1
        for l=0:M-1
            w(k+1,l+1) = exp((1i)*2*pi*k*l/K);
        end
    end
    dftmat=w;
end