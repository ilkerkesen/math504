function [X,Y,Z] = problem1_4(A,xi,xf,yi,yf,h,k)
[V,D] = eig(A);
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
Z = zeros(size(X));
V = V(:,1:k);
D = D(1:k,1:k);
[Q,R] = qr(V,0);
T = R*D/R;
I = eye(size(T));
for k = 1:numel(X)
    z = X(k)+Y(k)*i;
    Z(k) = min(svd((T-z*I)));
end
end

