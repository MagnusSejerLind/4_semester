%% 1.c
clc,clear,close

% Constants
u = 0.08;
alpha = 0.0001;
L = 1;

% Step size
deltax = 0.01;
deltat = 0.05;

t_max = 8; % Max time

x = (0:deltax:L);
t = (0:deltat:t_max+2*deltat);

% Solution vector
T = zeros(length(t),length(x));

% IC
for i = 1:length(x)
    if x(i) <= 0.2 
        T(1,i) = 1 - (10.*x(i)-1).^2;
    end
end

% BC
T(:,1) = 0;
T(:,end) = 0;

% Figure
hf = figure();
hp = plot(x,T(1,:),LineWidth=2);
ht = text(0.1,1, '', Interpreter='latex');
ylim([-.1 1.1])
title('Crank-Nicholson implicit scheme')
xlabel('x')


% Coeffcients
C1 = (u*deltat) / (4*deltax);
C2 = (alpha*deltat) / (2*deltax^2);


% Express B matrix [ -(C2+C1) (1+2*C2) -(C2-C1) ]
B = eye(length(x)-2,length(x)-2);
B(B==1) = (1+2*C2);
for i = 1:length(x)-2%**(t)
    if i ~= length(x)-2
        B(i,i+1) = -(C2-C1);
    end
    if i > 1
        B(i,i-1) = -(C2+C1);
    end
end

% Initialize b vector
b = zeros(length(x)-2,1);%****(x)
% BC
b(1) = (1-2*C2)*T(1,1) + (C2-C1)*T(1,2);
b(end) = (C2+C1)*T(1,end-1) + (1-2*C2)*T(1,end);




% Solve the system
for it = 2:length(t)-2


    for ix = 2:length(x)-2
         % Update b vector
         b(ix) = (C2+C1)*T(it-1,ix-1) + (1-2*C2)*T(it-1,ix) + (C2-C1)*T(it-1,ix+1);
    end

    
    % Solution
    T(it,(2:end-1)) = B\b;


    % Plot
    hp.YData = T(it,:);
    ht.String = ['t = ' num2str(t(it)) ' s'];
    pause(0.01)
    
    if i == length(t)
         hp.YData = U(nt,:);
        ht.String = ['t = ' num2str(t(nt)) ' s'];
    end

end


print('HW3_1c_figure', '-depsc');  
