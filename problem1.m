% problem1
xi = -2; xf = 6; yi = -5; yf = 5; h = 0.1;
rng(1)
A = rand(3,3)*2;
[X,Y,Z] = problem1_2(A,xi,xf,yi,yf,h);
figure;
contour(X,Y,Z);

[X,Y,Z] = problem1_3(A,xi,xf,yi,yf,h,3);
figure;
contour(X,Y,Z);

[X,Y,Z] = problem1_4(A,xi,xf,yi,yf,h,3);
figure;
contour(X,Y,Z);