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

plot(G,'.')
