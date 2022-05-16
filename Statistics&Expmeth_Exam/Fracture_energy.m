clc,clear,close all

corexp = importdata("cordata.mat");

b = 15;  % [mm]
w = 45;  % [mm]
a = 22;  % [mm]
f = -4.5680;  % f(a/w)
E = 1.54*1E3; % [Mpa]


F = zeros(length(corexp),1);
K_1 = F;
for i = 1:105
    F(i) = max(corexp(i).data(:,1));

    K_1(i) = ( (F(i)) / (b * sqrt(w)) ) * f; 

end
K_1 = K_1';


% Fracture energy
G = ((K_1.^2) ./ E) * 1000; % [J/mm]

% plot(G,'.')
% bar(G)


%% Fracture energy mean
% Determine mean fracture energy for each geometery

inx = 1;
G_iSum = 0;
G_mean = zeros(1,length(G)/5)
for i = 1:length(G)
    G_iSum = G_iSum + G(i);
    if rem(i,5) == 0
        G_mean(inx) = G_iSum/5;
        inx = inx + 1;
        G_iSum = 0
    end

end


%% Bar plot of fracture energy
% Relates geometery to fracture energy
close

figure()
bar(G_mean)

title('Fracture Energy vs Geometery')
ylabel('Fracture Energy')
xlabel('Geometery')
grid
ylim([0 max(G_mean+2E3)])
% Set ticks
% xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
% xticklabels({'','3d_d1s1t1','-2\pi','-\pi','0','\pi','2\pi','3\pi'})


% Subplot fracture energy of geometery






