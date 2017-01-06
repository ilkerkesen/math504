function [A,b] = get_Axb(n)
h = 1/n;
n1 = (n-1)*(n-1);
A = zeros(n1,n1);
b = ones(n1,1);
for i = 1:n-1
    for j = 1:n-1
        ind = (i-1) * (n-1) + j;
        A(ind,ind) = 4/(h*h) + exp((i+j)*h);
        
        if i == 1
            b(ind) = b(ind) + 1/(h*h);
        else
            A(ind,(i-2)*(n-1)+j) = -1/(h*h);
        end
        
        if i ~= n-1
            A(ind,i*(n-1)+j) = -1/(h*h);
        end
        
        if j ~= 1
            A(ind,ind-1) = -1/(h*h);
        end
        
        if j ~= n-1
            A(ind,ind+1) = -1/(h*h);
        end
    end
end
end