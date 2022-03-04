%% 1.b
% Determine the intersection points using the Newton-Raphson algorithm
clc,clear,close

% initial guess
x0 = [1 2]';

x = x0;
n = 0;
E = 1; % Error


while E>1e-5 && n<20

% System of functions
f = fun(x);

% Jacobian
J = Jac(x);

    x_old = x;

    % Solving the system of equations
    x = x - (J\f(:));

    E = norm(x - x_old); 
    
    n = n+1;
        fprintf('n = %.0f --> (x,y) = (%.4f , %.4f)\n',n,x(1),x(2))

end


function f = fun(x) 
% x = x(1), y = x(2)
    f(1) = (x(1)^2 + x(2)^2) -5;
    f(2) = (x(1)^2 - 1) - x(2);
end


function J = Jac(x)
J = zeros(2);
P = 1E-10;   % Pertubance

for j = 1:2

    h = zeros(2,1);
    h(j) = P;

    for i = 1:2


        fc = fun(x+h) - fun(x);    % Function change
        J(i,j) = fc(i)/P;          % Jacobian calculated

    end

end

end

