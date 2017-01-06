function [x] = jacobi(A,b)
x = zeros(size(b));
L = tril(A);
D = diag(diag(A));
L = L-D;
U = triu(A);
U = U-D; % xk -x = ek
to = 10^-10;
while true
    x = -(D^-1)*(L+U)*x + (D^-1)*b;
    err = norm(b-A*x,2)/norm(b,2);
    if err <= to
        break;
    end
end
end

