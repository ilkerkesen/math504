A5 = randn(5);
TD5 = hess(A5);
[U,R5] = qrTriD(TD5);
Q = TD5/R5;
norm(eye(5)-Q'*Q)