function [U,R] = qrTriD(A)
n = size(A,2);
u = zeros(2,n-1);
for k = 1:n-1
    v = A(k:k+1,k);
    v = (v-norm(v,2)*[1 0]');
    v = v / norm(v,2);
    U(1:2,k) = v;
    A(k:k+1,:) = A(k:k+1,:) - 2*v*(v'*A(k:k+1,:));
end
R = A;
end