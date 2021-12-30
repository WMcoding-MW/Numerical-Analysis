function plot_lagrange()
    %
    % Sketchs the graph of Langrange polynomials assuming equidistant 
    % points between [0, 1] of degree 3. Plots L_{3,0}, L_{3,1},...,L_{3,3}. 
    % 
syms x
n = 4; % degree + 1
numerator = 1;
denominator = 1; 
L = linspace(0,1,n); % equidistant n-amount of points between 0 and 1
for z = 1:n
    if z == 1 % special case for the first iteration i.e. L_{n,0}
        for c = 2:n
         numerator = numerator * (x - L(c)); 
         denominator = denominator * (L(z) - L(c));
        end
        polynomial = numerator / denominator;
    else % base case for all x > 0 i.e. L_{n,x}
        for c = 1:n
            if c ~= z % ensures the the current z value does not appear 
                      % in the numerator, as well as to ensure the 
                      % denomiator does not have /0
            numerator = numerator * (x - L(c));
            denominator = denominator * (L(z) - L(c));
            end
        end
           polynomial = numerator / denominator;
                 disp(polynomial);
    end
    fplot(polynomial, [0,1], 'LineWidth',1); % plots the polynomial
    hold on
    numerator = 1; % resets numerator
    denominator = 1; %resets denomiator
end
legend('L_{3,0}','L_{3,1}','L_{3,2}', 'L_{3,3}');
end
