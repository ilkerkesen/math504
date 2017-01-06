h = 0.001;
[A,b] = get_Axb(40);
tic(); x1 = jacobi(A,b); toc();
tic(); x2 = gaussseidel(A,b); toc();
tic(); x3 = conjugategradient(A,b); toc();