function h = ChannelPowerGain(Rho0, Q, W, H, K, M, N)
%H Summary of this function goes here
%   Detailed explanation goes here
h = zeros(K,M,N);
for k = 1:K
    for m = 1:M
        for n = 1:N
            h(k,m,n) = Rho0 / (H^2 + norm(Q(m,:,n) - W(k,:))^2);
        end
    end
end

end

