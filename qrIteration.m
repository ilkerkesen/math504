function Anew = qrIteration(A,mu)
[n,n1] = size(A);
[U,R] = qrTriD(A - mu*eye(n));
for k = 1:n-1
    R(:,k:k+1) = R(:,k:k+1)-(R(:,k:k+1)*(2*U(:,k)))*U(:,k)';
end
Anew = R;
end