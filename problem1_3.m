function [X,Y,Z] = problem1_3(A,xi,xf,yi,yf,h,k)
[V,D] = eig(A);
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
I = eye(size(A));
Z = zeros(size(X));
Q = V(:,1:k);
for k = 1:numel(X)
    z = X(k)+Y(k)*i;
    Z(k) = min(svd((Q'*(A-z*I)*Q)));
end
end

