
% Numerator and denominator of transfer function
num = [0 0 14000];
den = [1 45 3100 14500];

% Express transfer function
TF = tf(num,den);

% Determine poles and zeros
P = pole(TF);
Z = zero(TF);

figure(1)

% Pole & Zero plot of system
pzplot(TF)

grid
a = findobj(gca,'type','line');
for i = 1:length(a)
    set(a(i),'markersize',10) % change marker size
    set(a(i), 'linewidth',2)  % change linewidth
end

