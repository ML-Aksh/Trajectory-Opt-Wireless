function gamma = SINR(K, M, N, Rho0, Q, W, H, P, noise)
%SINR Summary of this function goes here
%   Detailed explanation goes here
gamma = zeros(K, M, N);
%tic
h = ChannelPowerGain2(Rho0, Q, W, H, K, M, N);
%toc
for n = 1:N
    H_slice = h(:,:,n);
    P_slice =  P(:,n);
    summation_noise = H_slice * P_slice;
    P_magnified = H_slice .* repmat(P_slice', [K,1]);
    gamma(:,:,n) = P_magnified ./ (summation_noise - P_magnified + noise);
end
%tocs

