function [X,Y,Z] = problem1_2(A,xi,xf,yi,yf,h)
[X,Y] = meshgrid(xi:h:xf,yi:h:yf);
I = eye(size(A));
Z = zeros(size(X));
for i = 1:numel(X)
    z = X(i)+Y(i)*i;
    Z(i) = get_sign(A-z*I);
end
end

