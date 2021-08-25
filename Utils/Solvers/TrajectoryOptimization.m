function [nu, speed_constraint, initial_final, inter_uav_distance] = TrajectoryOptimization(A, P, Q, K, M, N, Rho0, H, W, noise, d_min)
%USERSCHEDULING Summary of this function goes here
%   Detailed explanation goes here
SINRs = SINR(K, M, N, Rho0, Q, W, H, P,noise);
nu = min(1/N*sum(sum(A.*(log2(1 + SINRs)),3),2));
speed_constraint = vecnorm(Q(:,:,1:end-1) - Q(:,:,2:end),2,2);
initial_final = norm(Q(:,:,1) - Q(:,:,N));
inter_uav_distance = distance_constraint(Q, M, N, d_min);
end

