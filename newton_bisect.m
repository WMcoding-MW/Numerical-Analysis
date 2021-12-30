% Name: William Marks
% ID: 30131510
function [xl,fx,nf,af,bf] = newton_bisect(a, b, fname, tolx, nmax)
%
% Combines the bi-section and newton's method in order to best approximate
% the root.
%
% Input a the left endpoint of the interval
%       b the right endpoint of the interval
%       fname the function handle
%       tolx the tolerance of f(x) i.e. f(x)<1.000000000000000e-15 
%       nmax the mmaximum number of function evaluations
%
% Output xl the approximate root of f(x) = 0
%        fx the value of f at x
%        nf the number of times the root has been evaluated
%        af the updated left bracket
%        bf the updated right bracket 
%
syms x %making x a symbol, in order to use functions

derivative = diff(fname); %taking the derivative of fname

xl = a; %x1 = a
nf = 0; 
found = false;

    
    while(found == false && nmax > nf)
        top = double(subs(fname,x,xl));
        bottom = double(subs(derivative,x,xl));
        xnew = xl - top/bottom; %newtons method calculation
        xl = double(xnew);
        if(xl >= a && xl <= b) %if x is an element of [a,b]
            top = double(subs(fname,x,xl));
            if(top > 0) %determines if x is negative or positive
                        %in order to tell what side the root is on
                b = xl;
            else
                a = xl;
            end
        else %if x is not an element of [a,b]

        xnew = (a+b)/2; %bi-section method
        xl = double(xnew);
        top = double(subs(fname,x,xl));

            if(top > 0)%determines if x is negative or positive
                       %in order to tell what side the root is on
                b = xl;
            else
                a = xl;
            end
        end
        nf = nf+1; % increments the counter by 1
        if(abs(top) <= tolx)
        found = true;
        end
    end %end of while
        af = a;
        bf = b;
        fx = double(subs(fname,x,xl));
end %end of function