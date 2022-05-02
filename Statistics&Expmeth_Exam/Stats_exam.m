
clc,clear,close all

exp = importdata('Data\expdata.mat');


% Correction of data
% 10 % is machine displacement in data
% delta_specimen = delta - delta_machine


plot(exp(1).data(:,3),exp(1).data(:,1))
