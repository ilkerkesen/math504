function [eigvals] = myQR(A)
[m,n] = size(A);
if m ~= n
    error('dimensions mismatch');
end

if m == 1
    eigvals = [A(1)]';
elseif m == 2
    D = det(A); T = trace(A);
    L1 = T/2 + sqrt(T^2/4-D);
    L2 = T/2 - sqrt(T^2/4-D);
    eigvals = [L1 L2]';
else
    while true
        s = myQR(A(n-1:n,n-1:n));
        if abs(s(1) - A(n,n)) < abs(s(1) - A(n,n))
            muk = s(1);
        else
            muk = s(2);
        end
        A = hess(A);
        A = qrIteration(A,muk);
        if sum(A(n,1:n-1) < 10^-15) == n-1
            eigvals = [myQR(A(1:n-1,1:n-1)); myQR(A(n,n))];
            return;
        end
    end
end
end

