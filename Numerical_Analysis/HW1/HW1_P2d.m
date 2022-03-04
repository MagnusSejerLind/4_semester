%% 2d
clc,clear,close

% Data
x = [1993 1995 1997 1999 2001 2003 2005 2007 2009]'; % Year
y = [12.0 12.7 13.0 15.2 18.2 19.8 24.1 28.1 NaN]';  % Toxin concentration

% Removing the unknown value
x = x(1:length(x)-1);
y = y(1:length(y)-1);


xx = linspace(min(x),max(x)+2,100);

yy_int = spline(x,y,xx);


plot(xx,yy_int)

for i = 1:length(xx)
    if xx(i) == 2009
        fprintf('The toxin concentration in 2009 is approximated using cubic spline interpolation to be %.1f\n',yy_int(i))
        break
    end
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
legend('Data points','Cubic spline',Location='northwest')
ylim([10 30])


print('2_d', '-depsc');  
