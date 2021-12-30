% Name: William Marks
% ID: 30131510
function [x,nint] = myGaussSeidel(A,b,x,nmax,tol)
% This function is made in order to approximate a solution for Ax=b using 
% Gauss-Seidel method. 
% Input: A - the matrix A of Ax=b
%        b - the coefficent vector of Ax=b
%        x - the intial solution guess x^(0) = [0, ... ,0]
%        nmax - maximum number of iterations
%        tol - maximum tolerance for the error
% Output: x- the approximated solutions for Ax=b
%         nint- amount of intervals needed
l = size(A);
L1 = zeros(l(1),l(2));
n = 1;
for i=1:l(1)    %creates the L matrix
    for j=1:n
    L1(i,j) = A(i,j);
    end
    n = n+1;
end
L = inv(L1);
nint = 1;
error = tol+1;
while(nint < nmax && error > tol) %approximates the x-vector
    xn = x - L * A * x + L * b;
    nint = nint + 1;
    error = norm(xn - x)/norm(xn);
    x = xn;
end
end