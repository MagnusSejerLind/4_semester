%% HW1 P2a
clc,clear,close

% Data
x = [1993 1995 1997 1999 2011 2003 2005 2007 2009]'; % Year
y = [12.0 12.7 13.0 15.2 18.2 19.8 24.1 28.1 NaN]';  % Toxin concentration

% Removing the unknown value
x = x(1:length(x)-1);
y = y(1:length(y)-1);


xx = linspace(min(x),max(x),100);
yy_int = zeros(length(xx),1);

for k = 1:length(xx)
P = 0;  % Starts with a new polynomial

    for j = 1:length(x)
        L = 1;
        for i = 1:length(x)
            if  i ~= j  % Skips i=j
                  L = L * (xx(k) - x(i)) / (x(j) - x(i));    % Calculate L_j values and multiply the results together
            end            
        end
        P = P + L*y(j);     % Scaling the L value with the known y value at the given point, the sums the product
    end
    yy_int(k) = P;     % Interpolated values
end


% Plot data points
figure(1)
plot(x,y,'Ob',MarkerFaceColor='b',LineWidth=2)
hold on

% Plot interpolation polynomial
plot(xx,yy_int,LineWidth=2)
title('Concentration of Toxin')
xlabel('Year')
ylabel('Toxin conc.')
grid on
legend('Data points','Lagrange polynomial',Location='northwest')
ylim([10 30])


print('2_a', '-depsc');  

%% 2b
for i = 1:length(xx)
    if xx(i) == 2009
        fprintf('The toxin concentration in 2009 is approximated using a Lagrange polynomial to be %.1f\n',yy_int(i))
        break
    end
end


%% 2c
clc,clear,close

% Data
x_mod = [1993 1995 2011 2003 2005 2007]'; % Year
y_mod = [12.0 12.7 18.2 19.8 24.1 28.1]';  % Toxin concentration



xx_mod = linspace(min(x_mod),max(x_mod),100);
yy_int_mod = zeros(length(xx_mod),1);

for k = 1:length(xx_mod)
P = 0;  % Starts with a new polynomial

    for j = 1:length(x_mod)
        L = 1;
        for i = 1:length(x_mod)
            if  i ~= j  % Skips i=j
                  L = L * (xx_mod(k) - x_mod(i)) / (x_mod(j) - x_mod(i));    % Calculate L_j values and multiply the results together
            end            
        end
        P = P + L*y_mod(j);     % Scaling the L value with the known y value at the given point, the sums the product
    end
    yy_int_mod(k) = P;     % Interpolated values
end


% Plot data points
figure(1)
plot(x_mod,y_mod,'Ob',MarkerFaceColor='b',LineWidth=2)
hold on

% Plot interpolation polynomial
plot(xx_mod,yy_int_mod,LineWidth=2)
title('Concentration of Toxin - Modified data')
xlabel('Year')
ylabel('Toxin conc.')
grid on
legend('Data points','Lagrange polynomial',Location='northwest')
ylim([10 30])

print('2_c', '-depsc');  

% Missing data points
for i = 1:length(xx_mod)
    if xx_mod(i) == 1997
        fprintf('The toxin concentration in 1997 is approximated using a Lagrange polynomial to be %.1f\n',yy_int_mod(i))
        break
    end
end
for j = 1:length(xx_mod)
    if xx_mod(j) == 1999
        fprintf('The toxin concentration in 1999 is approximated using a Lagrange polynomial to be %.1f\n',yy_int_mod(j))
        break
    end
end



