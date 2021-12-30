%Author: William Marks
%SN: 30131510
function plot_newton_poly(X, F, n)
    %
    % Sketchs the graph of P_n(x) and the interpolation points. 
    % a_0 + a_1 * x + a_2 * x^2 + ... + a_n * x^n
    %
    % Input     X   the x values of the data points
    %           F   the y/f(x) values of the data points
    %           n   the number of points
    % 
    syms x;
    a = newton_dd(X,F,n);
    c = linspace(-1,1,100); %creates 100 equidistant points between [-1,1]
    f =  1/(1+x^2); %creates the function f(x)
    plot(X,F,'*','LineWidth',2); %plots the original coordinates/nodes
    ylim([-2,2])
    xlim([-2,2])
    hold on;
     fplot(f); %plots f(x)
       for z = 1:100
        yNew(z) = Horner_Newton(c(z), a, X, n-1); %calculates the interpolating polynomial
       end
    
    plot(c,yNew,'-','LineWidth',2); %plots the interpolated polynomial
    legend('{x_i,f(x_i)}','f(x)','p_n(x)'); 
end
