h = [0.05, 0.025, 0.01, 0.005];

fprintf('jaboci takes lots of time, so running it once only\n');
[A,b] = get_Axb(1/h(1));
tic(); x1 = jacobi(A,b); toc();
fprintf('\ntiming profiling in order for four times\n');
fprintf('1. Gauss-Seidel\n2. CG\n3. Jacobi/PCG\n');
fprintf('4. Gauss-Seidel/PCG\n\n')
for k = 1:numel(h)
    [A,b] = get_Axb(1/h(k));
    % tic(); x1 = jacobi(A,b); toc();
    fprintf('h=%f\n',h(k));
    tic(); x2 = gaussseidel(A,b); toc();
    tic(); x3 = conjugategradient(A,b); toc();
    tic(); x4 = precond1(A,b); toc();
    tic(); x5 = precond2(A,b); toc();
    fprintf('\n');
end

fprintf('test correctness\n');
to = 10^-8;
sum(abs(x3-x2) >= to) == 0
sum(abs(x3-x4) >= to) == 0
sum(abs(x5-x4) >= to) == 0