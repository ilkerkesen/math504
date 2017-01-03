function [X,Y,Z] = problem1_4(A,xi,xf,yi,yf,h,k)
[V,D] = eig(A);
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
Z = zeros(size(X));
V = V(:,1:k);
D = D(1:k,1:k);
[Q,R] = qr(V,0);
T = R*D/R;
I = eye(size(T));
for i = 1:numel(X)
    z = X(i)+Y(i)*i;
    Z(i) = get_sign(T-z*I);
end
end

