function [config] = STM(VT)
    N = 4096;    
    [~,VT_I] = max(abs(VT));
    VT_idx = VT_I + (0:1:(N-1))*20;
    VT_max = VT(VT_idx);
    tau_theta_ph = max(angle(VT_max)) - angle(VT_max);
    tau_theta_ph = tau_theta_ph - pi/2;
    tau_theta_bool = 1-(tau_theta_ph >= -pi/2 & tau_theta_ph < pi/2);
    tau_theta_bin = pi*tau_theta_bool;
    config = real(exp(-1i*tau_theta_bin'));
end