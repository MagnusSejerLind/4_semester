%% 1.a
% Plots the functions to determine the intersection points
close,clear,clc

% Define functions
f1 = @(x,y) x^2+y^2-5;
f2 = @(x) x.^2 - 1;

ch = ezplot(f1);

ch.LineColor='b';
ch.LineWidth=1.5;

% Plot the functions
hold on
fplot(f2,'k', LineWidth=1.5)
ylim ([-3 3])
xlim ([-3 3])
legend('$\sqrt{-x^2 + 5}$', '$x^2 - 1$','interpreter', 'latex','AutoUpdate','off');
title('Graphical Intersection')
xlabel('x')
ylabel('y')
hYLabel = get(gca,'YLabel');
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
grid

% Intersections determined from plot
ins = [1.600, 1.562, -1.600, 1.562];

% Plot the intersection points
plot(ins(1),ins(2),'rO',LineWidth=2)
plot(ins(3),ins(4),'rO',LineWidth=2)

fprintf('The points of intersections are determined to be (±%.2f,%.2f)\n' , ins(1),ins(2))
print('1_a', '-depsc');  