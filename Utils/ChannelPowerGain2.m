function h = ChannelPowerGain2(Rho0, Q, W, H, K, M, N)
%CHANNELPOWERGAIN2 Summary of this function goes here
%   Detailed explanation goes here
h = zeros(K,M,N);
for n = 1:N
    W2 = repmat(W, [1,1,M]);
    W3 = permute(W2, [3,2,1]);
    Q2 = Q(:,:,n);
    Q3 = repmat(Q2, [1,1,K]);
    temp1 = vecnorm(Q3 - W3, 2, 2).^2 + H^2;
    temp2 = reshape(temp1, M, K);
    h(:,:,n) = Rho0./temp2';
end
end

