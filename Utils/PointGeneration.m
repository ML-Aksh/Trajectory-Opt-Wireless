
x0 = 1000;
y0 = 1000;
R = 650;
t = linspace(0, 2*pi, 7);
t = t(1:end-1);
deltaR = 350.*(-1+2.*rand(6,1))
X = x0 + (R+deltaR).*cos(t)';
Y = y0 + (R+deltaR).*sin(t)';
W = [X,Y];
scatter(X,Y);