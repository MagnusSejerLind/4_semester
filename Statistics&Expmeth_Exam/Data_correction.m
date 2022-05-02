
clc,clear,close all

exp = importdata('Data\expdata.mat');
% plot(exp(1).data(:,3),exp(1).data(:,1))
%%

% Correction of data
% 10 % is machine displacement in data
% delta_specimen = delta - delta_machine


%% Test
clc,close all
testdata = exp(1);

% Load / Elongation
% plot(testdata.data(:,3),testdata.data(:,1))



delta_s = zeros(length(testdata.data),1);
for i = 1:length(testdata.data);
% delta_s = delta_data - delta_m

delta_s(i) = testdata.data(i,3) - (testdata.data(i,1) / 11400);    

end



%%
figure(1)
plot(testdata.data(:,3),testdata.data(:,1))
hold on
plot(delta_s,testdata.data(:,1))
grid
legend('Experimential','Corrected')


%%
testdata.data(:,1) = delta_s;


save('cordata.mat','testdata')
