%Author: William Marks
%SN: 30131510
function c = Composite_Simpson(fname,a,b,n)
    % Approximates the integral of fname over [a,b] 
    % given n+1 sub-intervals, using the composite version
    % of simpsons rule. It's recommended to view the answer in
    % "format longE" to see the full precision. 
    %
    % Input     fname   the symbolic function
    %           a       lower bound on the integral
    %           b       upper bound on the integral
    %           n       the amount of sub-intervals   
    %
    % Output    c       approximated integral value
format longE
syms f(x)
f(x) = fname;
c = linspace(a, b, n+1); % makes equidistant n+1 points
sum = 0; 
    for z = 1:n % loops until it's applied simpsons rule n-times
        %sum = sum + Q_s(f)
    sum = sum + (c(z+1)-c(z))/6 * f(c(z)) + 2*((c(z+1)-c(z))/3) * f((c(z)+c(z+1))/2) + (c(z+1)-c(z))/6 * f(c(z+1));
    end
    c = sum;
end