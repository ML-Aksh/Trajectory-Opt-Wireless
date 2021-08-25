function CirclePacking(R);
axis([0 2*R 0 2*R]); axis off; grid off; hold on;
[xoc, yoc] = circle([R R], R, 1000); % outer circle
plot(xoc, yoc, '-','linewidth',2,'color',0.5.*rand(1,3));
[xcc, ycc] = circle([R R], 1, 1000); % center circle
plot(xcc, ycc, '-','linewidth',2,'color',0.5.*rand(1,3));
numlapis = ((2*R) - (R+1)) / 2;
for cnt1 = 1 : numlapis
    lapis(cnt1) = cnt1 * 6;
    [xcoor, ycoor] = circle([R R], cnt1*2, lapis(cnt1)+1);
    for cnt2 = 1 : lapis(cnt1)
        [xc, yc] = circle([xcoor(cnt2)  ycoor(cnt2)], 1, 1000);       
        plot(xc, yc, '-','linewidth',2,'color',0.5.*rand(1,3));
    end
end