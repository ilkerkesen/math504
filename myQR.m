function [eigvals] = myQR(A)
[m,n] = size(A);
if m == 1
    eigvals = A(1);
elseif m == 2
    D = det(A); T = trace(A);
    L1 = T/2 + sqrt(T^2/4-D);
    L2 = T/2 - sqrt(T^2/4-D);
    eigvals = [L1; L2];
else
    while true
        vals = myQR(A(n-1:n,n-1:n));
        diff = abs(vals - A(n,n));
        muk = vals(1);
        if diff(1) > diff(2)
            muk = vals(2);
        end
        A = qrIteration(A,muk);
        if A(n,n-1) < 10^-15
            eigvals = [myQR(A(1:n-1,1:n-1)); A(n,n)];
            return;
        end
    end
end
end