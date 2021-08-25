function [nu, power_constraint] = PowerOptimization(A, P, Q, K, M, N, Rho0, H, W, noise, d_min)
%POWEROPTIMIZATION Summary of this function goes here
%   Detailed explanation goes here
SINRs = SINR(K, M, N, Rho0, Q, W, H, P,noise);
nu = min(1/N*sum(sum(A.*(log2(1 + SINRs)),3),2));
power_constraint = P;
end

