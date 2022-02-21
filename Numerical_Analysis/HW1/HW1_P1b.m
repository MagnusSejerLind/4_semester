%% 1.b
% Determine the intersection points using the Newton-Raphson algorithm
clc,clear,close

% initial guess
x0 = [1 2];

% System of functions
f = fun(x);


% Jacobian
J = jac(x0)


% Solving the system of equations
x = x - J\f(:)

%%%%% Print %%%%%%%


function f = fun(x0) 
% x = x(1), y = x(2)
    f(1) = x(1)^2 + x(2)^2 -5;
    f(2) = x(1) - 1 - x(2);
end


function J = Jac(x0)

h = ones(3)*1E-10;

for j = 1:3

    for i = 1


        fc = fun(x0+h) - fun(x0);    % Function change
        J(i,j) = fc(i)/h(1);       % Jacobian calculated

    end

end







