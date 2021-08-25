function inter_uav_distance = inter_uav_dist_constraint(Q,Q_old, M, N, d_min)
%INTER_UAV_DIST_CONSTRAINT Summary of this function goes here
%   Detailed explanation goes here
inter_uav_distance = ones(M, M, N);

for n = 1:N
    for m = 1:M
        for j = m+1:M
        inter_uav_distance(m,j,n) = -norm(Q_old(m,:,n) - Q_old(j,:,n))^2 +  2*(Q_old(m,:,n) - Q_old(j,:,n))*(Q(m,:,n) - Q(j,:,n))' >= d_min^2;
        end
    end
end
end

