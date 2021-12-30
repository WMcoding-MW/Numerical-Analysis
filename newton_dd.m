%Author: William Marks
%SN: 30131510
function a = newton_dd(X, F, n)
    % Evaluates the a values in a polynomial of size n using newtons
    % method.
    % a_0 + a_1 * x + a_2 * x^2 + ... + a_n * x^n
    %
    % Input     X   the x values of the data points
    %           F   the y/f(x) values of the data points
    %           n   the degree of the polynomial P_n(x)
    % 
    % Output    a   the a values of the polynomial
    i = length(X);
    b = [n-1]; 
    a = [n-1];
    l = 1;
    if i >= n % check if the n < length of the data points
         a(1) = F(1); 
        for c = 1:n-1 % loops until it's reached depth specified 
            for z = 1:i-1 % loops until it's calculated every value of the current column
                b(z) = (F(z+1) - F(z))/(X(z+1+(c-1)) - X(z));
                i = i+1;
            end
            a(c+1) = b(1);
            F = b;
            c = c+1;
            i = length(F);
        end
    else
        disp('error: length of x or y <= n'); 
    end
            
end