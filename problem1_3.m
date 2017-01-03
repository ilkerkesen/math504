function [X,Y,Z] = problem1_3(A,xi,xf,yi,yf,h,k)
[V,D] = eig(A);
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
I = eye(size(A));
Z = zeros(size(X));
Q = V(:,1:k);
for i = 1:numel(X)
    z = X(i)+Y(i)*i;
    Z(i) = get_sign(Q'*(A-z*I)*Q);
end
end

