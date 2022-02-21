%% Problem 3
clc,clear

% Function
f = @(x) -0.0547.*x.^4 + 0.8646.*x.^3 -4.1562.*x.^2;

% Limits of integration
a = 0;      % Lower
b = 8;     % upper



%% 3.b

n = 100;    % Number of paneles 

h = (b-a)/n;    % uniform spacing
x = linspace(a,b,n+1);

I = 0;
for i = 1:n
    I = I + h/2* (f(x(i)) + f(x(i+1)));
end

I_trapezoidal = I;

fprintf('The integral using the trapezoidal method is %.3f\n',I_trapezoidal)


%% 3.c
n = 30;    % Number of paneles 


h = (b-a)/n;    % uniform spacing
x = linspace(a,b,n+1);  

I = 0;
for i = 1:2:n-1     % skips all even values
    I = I + h/3 * ( f(x(i)) + 4*f(x(i+1)) + f(x(i+2)) );
end

I_Simpson = I;

fprintf('The integral using Simpsons method is %.3f\n',I_Simpson)









