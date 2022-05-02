clc,clear,close all

exp = importdata('Data\expdata.mat');
% plot(exp(1).data(:,3),exp(1).data(:,1))

%% Correct data

% for j = 1:105
% testdata = exp(j);
% 
% % delta_s = zeros(length(testdata.data),1);
% for i = 1:length(testdata.data)
% % delta_s = delta_data - delta_m
% 
% delta_s(i) = testdata.data(i,3) - (testdata.data(i,1) / 11400);    
% 
% end
% 
% all(j).delta_s = delta_s'
% end


c_machine = 1/11400; %[mm/N]

for i = 1:105
   delta_machine = exp(i).data(:,1).*c_machine;
   

   exp(i).data(:,6) = exp(i).data(:,3) - delta_machine;
end


for k = 1:105
    exp(k).data(:,3) = exp(k).data(:,6);
    exp(k).data(:,6) = [];
end


%% Plot to check if correct
% figure(1)
% plot(exp.data(:,3),exp.data(:,1))
% hold on
% plot(delta_s,exp.data(:,1))
% grid
% legend('Experimential','Corrected')


%% Overwrite and save corrected data
% testdata.data(:,1) = delta_s;

save('cordata.mat','exp')
