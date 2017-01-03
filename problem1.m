% problem1
xi = -2; xf = 6; yi = -5; yf = 5; h = 0.01;
rng(7)
A = randn(10,10)*10;
[X,Y,Z] = problem1_3(A,xi,xf,yi,yf,h,3);
contour(X,Y,Z);