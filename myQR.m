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
    eigvals = [L1; L2];
else
    while true
        Ann = A(n,n);
        vals = eig(A(n-1:n,n-1:n));
        diff = abs(vals - Ann);
        muk = vals(1);
        if diff(1) > diff(2)
            muk = vals(2);
        end
        % muk = A(n,n);
        A = qrIteration(A,muk);
        for k=n-1:2
            if A(n,k) < 10^-15
                eigvals = [myQR(A(1:n-1,1:n-1)); myQR(A(n,n))];
                return;
            end
        end
%         if A(n,n-1) < 5*(10^-15)
%             eigvals = [myQR(A(1:n-1,1:n-1)); myQR(A(n,n))];
%             break;
%         elseif A(n,n-2) < 5*(10^-15)
%             eigvals = [myQR(A(1:n-2,1:n-2)); myQR(A(n-1:n,n-1:n))];
%             break;
%         end

    end
end
end