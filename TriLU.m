% Name: William Marks
% ID: 30131510
function [l,u] = TriLU(a,b,c,n)
% This function calculates the l and u vectors based on the given vectors
% from a tridiagonal matrix. in order to satisfy the equation A=LU 
%
% Input: a - the diagonal of matrix A
%        b - the subdiagonal of matrix A
%        c - the superdiagonal of matrix A
% Output: l - the subdiagonal of matrix L
%         u - the diagonal of matrix U

u = zeros(1, n);  %generates a 1 x n array filled with zeros
l = zeros(1, n-1);   %generates a 1 x n-1 array filled with zeros
    if(n < 2)
        disp("Error: n is too small");  %ensures n >= 2
    else
        u(1) = a(1);    %sets u(1) = a(1) since they will always be equivalent, as well as it's needed in order to calculate l(i)
        for i = 1:n-1
            l(i) = b(i)/u(i);   
            u(i+1) = a(i+1)-l(i)*c(i); 
        end
    end
end