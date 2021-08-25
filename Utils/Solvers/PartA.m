
%%
clear, clc;
K = 6;
%W = 2000*rand(K,2);
W = PointGenerator(1000,K);
d_min = 100;
T = 210;
H = 100;
NoisePower = 10^(-14);
d0 = 1;
Rho0 = 10^(-6);
Pmax = 0.1;
Vmax = 50;
epsilon = 10^-2;
M = 3;
%N = Vmax*T/(H*epsilon);
N = 150;
Tau = 100;
N2 = N*Tau;
%Slot_assignment = Tau * A
deltaT = T/N;
Max_Dist = deltaT * Vmax;
global history;
history.x = [];
history.fval = [];
global stopping;
stopping.x = [];
stopping.fval = [];
%%

%%
GeometricCenter = sum(W)/K;
Radius = max(vecnorm(W - GeometricCenter,2,2));
RadiusMax = Vmax * T / (2*pi);

filepath = 'packings/cci' + string(M) + '.txt';
Radii = load('radius.txt');
Radius_cp = Radii(M,2)*Radius/2;
cp_coords = load(filepath);
cp_coords = cp_coords(:, 2:3)*Radius;
R_traj = min(RadiusMax, Radius_cp);

Theta = linspace(0, 2*pi, N);
Small_Trajectory_Coords = GeometricCenter + cp_coords;
Xs = Small_Trajectory_Coords(:,1) + R_traj*cos(Theta);
Xs = reshape(Xs, [M, 1, N]);
Ys = Small_Trajectory_Coords(:,2) + R_traj*sin(Theta);
Ys = reshape(Ys, [M, 1, N]);
Trajectory_guess = [Xs, Ys];
%Q_guess = 
%plot(Xs(1,:), Ys(1,:), Xs(2,:), Ys(2,:));

for i = 1:M
    hold on
    plot(Xs(i,:), Ys(i,:));
end
scatter(W(:,1), W(:,2))
%%
traj1 = MultiTrajectory(X0, Vmax, T, N);
traj1 = reshape(traj1, [1,2,N]);
traj2 = MultiTrajectory(X1, Vmax, T, N);
traj2 = reshape(traj2, [1,2,N]);
traj3 = MultiTrajectory(X2, Vmax, T, N);
traj3 = reshape(traj3, [1,2,N]);
Q_init = [traj1;traj2;traj3];
Trajectory_guess = Q_init;
%%
P_init = ones(M, N)*Pmax;
%A_init = repmat([0.99*ones(K,1) zeros(K,M-1)], [1,1,N]);
A_init = rand(K,M);
A_init = .99 * A_init / sum(A_init, 'all');
A_init = repmat(A_init, [1,1,N]);
Q_init = Trajectory_guess;

%%
[obj, ~, ~] = UserScheduling(A_init, P_init, Trajectory_guess, K, M, N, Rho0, H, W, NoisePower);
%% Defining Optimization Setup
%A = zeros(K, M, N);
A = optimvar('A', K,M,N, 'Type', 'continuous', 'LowerBound', 0, "UpperBound", 1);
%Q = zeros(M, 2, N);
Q = optimvar('Q', M,2,N, 'Type', 'continuous', 'LowerBound', 0, 'UpperBound', 2000);
%P = zeros(M,N);
P = optimvar('P', M,N, 'Type', 'continuous', 'LowerBound', 0, 'UpperBound', Pmax);



[f, A_sum_k, A_sum_m] = fcn2optimexpr(@UserScheduling, A, P_init, Q_init, K, M, N, Rho0, H, W, NoisePower);
problem = optimproblem('ObjectiveSense', 'max');
problem.Objective = f;

problem.Constraints.cons1 = A_sum_k <= 1;
problem.Constraints.cons2 = A_sum_m <= 1;

%show(problem);

x0.A = A_init;

options = optimoptions('fmincon','OutputFcn',@outfun, 'Display', 'iter', 'MaxFunctionEvaluations', 200000, 'OptimalityTolerance', 1.0000e-04);
[sol, fval, exitflag, output] = solve(problem, x0, 'Options', options);
%obj = fcn2optimexpr
%problem.Objective = SINR
%%

function stop = outfun(x,optimValues,state)
         stop = false;
         global history;
         global stopping;

         switch state
             case 'init'
                 hold on
             case 'iter'
             % Concatenate current point and objective function
             % value with history. x must be a row vector.
               history.fval = [history.fval; optimValues.fval];
               history.x = [history.x; x];
               stopping.fval = optimValues.fval;
               stopping.x = x;

             case 'done'
                 hold off
             otherwise
         end
    end