function [X,Y,Z] = problem1_2(A,xi,xf,yi,yf,h)
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
I = eye(size(A));
Z = zeros(size(X));
for k = 1:numel(X)
    z = X(k)+Y(k)*i;
    Z(k) = min(svd(A-z*I));
end
end
