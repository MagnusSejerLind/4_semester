%% Problem 3.c
clc,clear

% Function
f = @(x) -0.0547*x.^4 + 0.8646*x.^3 -4.1562*x.^2 + 6.2917*x + 2;

% Limits of integration
a = 0;     % Lower
b = 8;     % upper

n = 30;    % Number of paneles 


h = (b-a)/n;    % uniform spacing
x = linspace(a,b,n+1);  

I = 0;
for i = 1:2:n-1     % skips all even values
    I = I + h/3 * ( f(x(i)) + 4*f(x(i+1)) + f(x(i+2)) );
end

I_Simpson = I;

fprintf('The integral using Simpsons method with %g panels is %.3f\n',n,I_Simpson)

