function [nu,min_rate, sum_A_k, sum_A_m] = UserScheduling(nu_input, A, P, Q, K, M, N, Rho0, H, W, noise)
%USERSCHEDULING Summary of this function goes here
%   Detailed explanation goes here
nu = nu_input;
SINRs = SINR(K, M, N, Rho0, Q, W, H, P,noise);
min_rate = 1/N*sum(sum(A.*(log2(1 + SINRs)),3),2);
sum_A_k = sum(A, 2);
sum_A_m = sum(A,1);
end

