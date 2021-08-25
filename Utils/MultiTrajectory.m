function trajectory = MultiTrajectory(X,Vmax, T, N)
%MULTITRAJECTORY Summary of this function goes here
%   Detailed explanation goes here
dim = size(X);
num_users = dim(1);
X1 = X;
X2 = [X(2:end,:);X(1,:)];
total_distance = sum(vecnorm(X1 - X2, 2, 2));
path_distance = vecnorm(X1 - X2, 2, 2);
max_distance = Vmax*T;
%disp(max_distance);
x0 = X1(1,1);
y0 = X1(1,2);
trajectory = [];
if total_distance < max_distance
    for i = 1:num_users
        disp(i)
        N_allocated = floor(path_distance(i)/total_distance*N);
        trajectory_part_x = linspace(X1(i,1), X2(i,1), N_allocated);
        trajectory_part_y = linspace(X1(i,2), X2(i,2), N_allocated);
        trajectory_add = [trajectory_part_x;trajectory_part_y];
        trajectory = [trajectory, trajectory_add];
    end
end
trajectory_dim = size(trajectory);
N_add = N - trajectory_dim(2);
trajectory = [repmat([x0;y0], [1,N_add]), trajectory];
end

