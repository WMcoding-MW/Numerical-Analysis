function xn = secantroot(a, b, fname, nint)
%
% Input a,b the bounds of the domain
%       fname the function handle
%       nint the number of interations
%
% Output xn the approximate root
syms x
x1 = b; %setting inital x1 and x0
x0 = a;
found = false; %condition for if-else
for n = 1:nint
    nom = x1-x0; %numerator
    denom = double(subs(fname,x,x1)) - double(subs(fname,x,x0)); %denomiator
    frac = nom/denom; %fraction calculation
    xn = x1 - double(subs(fname,x,x1)) * frac; %computes x_{n+1}
    cond1 = double(subs(fname,x,x1))*double(subs(fname,x,xn)); %f(x_{n})*f(x_{n+1})
    cond2 = double(subs(fname,x,x0))*double(subs(fname,x,xn)); %f(x_{n-1})*f(x_{n+1})
    if(cond1 < 0) %updates the b value, in order to bracket the root
        x1 = xn;
        found = true;
    end
    if(cond2 < 0 && found == false) %updates the a value, in order to bracket the root
        x0 = xn;
    end
found = false;
end
end