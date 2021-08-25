function distances = distance_constraint(Q, M, N, d_min)
%DISTANCE_CONSTRAING Summary of this function goes here
%   Detailed explanation goes here
distances = ones(M,M, N);
for n = 1:N
    for m = 1:M
        for j = m+1:M
            distances(m, j, n) = norm(Q(m,:,n) - Q(j, :, n))> d_min;
        end
    end
end
end

