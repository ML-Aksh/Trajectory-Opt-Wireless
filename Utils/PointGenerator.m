function W = PointGenerator(Radius, K)
%POINTGENERATOR Summary of this function goes here
%   Detailed explanation goes here
x0 = Radius;
y0 = Radius;
R = 0.65*Radius;
t = linspace(0, 2*pi, K + 1);
t = t(1:end-1);
deltaR = 0.35*Radius.*(-1+2.*rand(K,1))
X = x0 + (R+deltaR).*cos(t)';
Y = y0 + (R+deltaR).*sin(t)';
W = [X,Y];
scatter(X,Y);
end

