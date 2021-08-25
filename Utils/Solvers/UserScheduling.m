function [nu, sum_A_k, sum_A_m] = UserScheduling(A, P, Q, K, M, N, Rho0, H, W, noise)
%USERSCHEDULING Summary of this function goes here
%   Detailed explanation goes here
SINRs = SINR(K, M, N, Rho0, Q, W, H, P,noise);
nu = mean(1/N*sum(sum(A.*(log2(1 + SINRs)),3),2));
sum_A_k = sum(A, 2);
sum_A_m = sum(A,1);
end

