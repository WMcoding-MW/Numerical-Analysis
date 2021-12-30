function newtonAlgorithm(fname, x1, n)
%
% Combines the bi-section and newton's method in order to best approximate
% the root.
%
% Input
%       fname the function handle
%       x1 initial x value
%       n maximum number of iterations
%
syms x
derivative = diff(fname);

for i = 1:n
    disp("iteration: ")
    disp(i)
    xn = x1 - 2*(double(subs(fname,x,x1))/double(subs(derivative,x,x1))); %computing newtons method
    disp("x: ");
    disp(xn);
    disp("f(x): ")
    disp(double(subs(fname,x,xn)))
    x1 = xn;
end
end