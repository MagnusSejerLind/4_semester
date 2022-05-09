
clc,clear,close


load cordata.mat
%%
clear
s.a1 = [1 0 ; 5 3]
s.a2 = [2 ; 5 ; 7]

%%

for j = 1:538
    M.D3_1 =  exp(1).data(j,:)
    M.D3_2 =  exp(2).data(j,:)
    M.D3_3 =  exp(3).data(j,:)
    M.D3_4 =  exp(4).data(j,:)
    M.D3_5 =  exp(5).data(j,:)
end


% for i = 1:5
%     
%     for j = 1:538
%     B.A(i)=    exp(i).data(j,:)
%     
%     end

% end


%%
M_sum = zeros(538,5);
for i = 1:5

    A(i) = exp(i).data(end-XX,:)



    M = exp(i).data;
    M_sum = M_sum + M;
end
m = M_sum ./ 5;


%%



figure()
hold on
% for i = 1:5:15
for i = 1:5
    plot(exp(i).data(:,3),exp(i).data(:,1),LineWidth=2)
end

grid
legend('t=1','t=2','t=4')
