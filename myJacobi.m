% Name: William Marks
% ID: 30131510
function [x,nint] = myJacobi(A,b,x,nmax,tol)
% This function is made in order to approximate a solution for Ax=b using 
% jacobi method. 
% Input: A - the matrix A of Ax=b
%        b - the coefficent vector of Ax=b
%        x - the intial solution guess x^(0) = [0, ... ,0]
%        nmax - maximum number of iterations
%        tol - maximum tolerance for the error
% Output: x- the approximated solutions for Ax=b
%         nint- amount of intervals needed

D = diag(A);
l = size(A);
D1 = zeros(l(1),l(2));
for i=1:l(1) %approximates the D-matrix
    D1(i,i) = D(i);
end
D = inv(D1);
nint = 1;
error = tol+1;
while(nint < nmax && error > tol) %approximates the x-vector
    xn = x - D * A * x + D * b;
    nint = nint + 1;
    error = norm(xn - x)/norm(xn);
    x = xn;
end
end