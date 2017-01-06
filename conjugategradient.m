function [x] = conjugategradient(A,b)
to = 10^-10;
x = zeros(size(b));
r = b;
p = x;
beta = 1;
rho = norm(r,2)^2;
while sqrt(rho) > to*norm(b,2)
    p = r+beta*p;
    alpha = rho/(p'*A*p);
    x = x + alpha*p;
    r = r - alpha*A*p;
    rhoold = rho;
    rho = norm(r,2)^2;
    beta = rho/rhoold;
end
end

