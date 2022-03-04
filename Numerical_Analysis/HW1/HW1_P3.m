%% Problem 3
clc,clear

% Function
f = @(x) -0.0547*x.^4 + 0.8646*x.^3 -4.1562*x.^2 + 6.2917*x + 2;

% Limits of integration
a = 0;     % Lower
b = 8;     % upper



%% 3.b

n = 400;        % Number of paneles 

h = (b-a)/n;    % uniform spacing
x = linspace(a,b,n+1);

I = 0;
for i = 1:n
    I = I + h/2* (f(x(i)) + f(x(i+1)));
end

I_trapezoidal = I;

fprintf('The integral using the trapezoidal method with %g panels is %.3f\n',n,I_trapezoidal)


%% 3.c
n = 50;    % Number of paneles 


h = (b-a)/n;    % uniform spacing
x = linspace(a,b,n+1);  

I = 0;
for i = 1:2:n-1     % skips all even values
    I = I + h/3 * ( f(x(i)) + 4*f(x(i+1)) + f(x(i+2)) );
end

I_Simpson = I;

fprintf('The integral using Simpsons method with %g panels is %.3f\n',n,I_Simpson)


%% 3d
% Order
n_gp = 3;

% Determine weight and Gauss points from table
[xi,w] = GaussTable(n_gp);

% Apply coordinate transform using x = ((b+a)/2 + (b-a)/2*xi)
phi = @(xi) -0.0547.*((b+a)/2 + (b-a)/2*xi).^4 + 0.8646.*((b+a)/2 + (b-a)/2*xi).^3 -4.1562.*((b+a)/2 + (b-a)/2*xi).^2 + 6.2917.*((b+a)/2 + (b-a)/2*xi) + 2;


% Scaling the limits using the Jacobian
J = (b -a) /2;


I_gauss = 0;
for i=1:n_gp
    I_gauss = I_gauss + w(i)*phi(xi(i))*J;
end
fprintf('The integral using %gth order Gauss quadrature is %.3f\n',n_gp,I_gauss)



% Gauss Table from lecture
function [xi,w] = GaussTable(nGP)
% Returns sampling points and weights for for Gauss quadrature of order n
%
% INPUTS:
%   nGP:      order of quadrature
%
% OUTPUTS:
%    xi:      sampling points
%     W:      weight functions


    switch nGP 
        case 1
            xi = 0;
            w  = 2;
        case 2
            xi = [-sqrt(1/3) sqrt(1/3)];
            w  = [1 1];
        case 3
            xi = [-sqrt(3/5) 0 sqrt(3/5)];
            w  = [5/9 8/9 5/9];
        case 4
            xi(1) = -sqrt(3/7 +2/7*sqrt(6/5));
            xi(2) = -sqrt(3/7 -2/7*sqrt(6/5));
            xi(3) =  sqrt(3/7 -2/7*sqrt(6/5));
            xi(4) =  sqrt(3/7 +2/7*sqrt(6/5));
            w(1) = (18-sqrt(30))/36;
            w(2) = (18+sqrt(30))/36;
            w(3) = (18+sqrt(30))/36;
            w(4) = (18-sqrt(30))/36;
        case 5
            xi(1) = -1/3*sqrt(5+2*sqrt(10/7));
            xi(2) = -1/3*sqrt(5-2*sqrt(10/7));
            xi(3) = 0;
            xi(4) =  1/3*sqrt(5-2*sqrt(10/7));
            xi(5) =  1/3*sqrt(5+2*sqrt(10/7));
            w(1) = (322-13*sqrt(70))/900;
            w(2) = (322+13*sqrt(70))/900;
            w(3) = 128/225;
            w(4) = (322+13*sqrt(70))/900;
            w(5) = (322-13*sqrt(70))/900;
    end

end





