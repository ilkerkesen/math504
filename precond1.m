function [x] = precond1(A,b)
D = diag(diag(A));
M = D^-1;
to = 10^-10;
x = zeros(size(b));
r = b;
p = x;
beta = 1;
z = M*r;
rho = z'*r;
while sqrt(rho) > to*norm(b,2)
    p = z+beta*p;
    alpha = rho/(p'*A*p);
    x = x + alpha*p;
    r = r - alpha*A*p;
    rhohat = norm(r,2)^2;
    z = M*r;
    rhoold = rho;
    rho = z'*r;
    beta = rho/rhoold;
end
end