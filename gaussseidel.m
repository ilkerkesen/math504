function [x] = gaussseidel(A,b)
x = zeros(size(b));
L = tril(A);
D = diag(diag(A));
L = L-D;
to = 10^-10;
M = ((D+L')\L)*((D+L)\L');
P = A - M;
N = M;
while true
    x = -(P^-1)*(N*x-b);
    % x = P\(-M*x) + P\b;
    err = norm(b-A*x,2)/norm(b,2);
    if err <= to
        break;
    end
end
end

