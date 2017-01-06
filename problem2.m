% rng(1)
C = randn(5); C = (C+C')/2; C = hess(C);
eig(C)
myQR(C)
sum(eig(C))
sum(myQR(C))