function [X Y] = circle(center,radius,n)
THETA = linspace(0, 2 * pi, n);
RHO = ones(1, n) * radius;
[X Y] = pol2cart(THETA, RHO);
X = X + center(1);
Y = Y + center(2);