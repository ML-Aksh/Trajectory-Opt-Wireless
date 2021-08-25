function gamma = SINRfor(K, M, N, Rho0, Q, W, H, P, noise)
%SINRFOR Summary of this function goes here
%   Detailed explanation goes here
gamma = ones(K, M, N);

h = ChannelPowerGain(Rho0, Q, W, H, K, M, N);
sums = zeros(K,N);
for n = 1:K
    for k = 1:K
        sum = 0;
        for m = 1:M
            sum = sum + P(m,n)*h(k,m,n);
         %   disp('in the loop')
        end
        sums(k,n) = sum;
       
        extraneous = sum + noise;
        for j = 1:M
           % disp('something')
           %disp(P(m,n)*h(k,m,n))
           %disp('text')
           %disp(extraneous - P(m,n)*h(k,m,n));
           
           disp(P(m,n)*h(k,m,n)/(extraneous - P(m,n)*h(k,m,n)))
           gamma(k,j,n) = P(j,n)*h(k,j,n)/(extraneous - P(j,n)*h(k,j,n));
           %gamma(k,m,n) = P(m,n)*h(k,m,n)/(extraneous - P(m,n)*h(k,m,n));
        end
    end
end
end

