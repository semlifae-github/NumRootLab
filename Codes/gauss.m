C = [1 0; 0 1]
b= [2 2]'
A = [C b];                                                  %Augmented Matrix
n= size(A,1);                                               %number of eqns/variables
x = zeros(n,1);                                             %variable matrix [x1 x2 ... xn] coulmn
for i=1:n-1
    for j=i+1:n
        m = A(j,i)/A(i,i)
        A(j,:) = A(j,:) - m*A(i,:)
    end
end
x(n) = A(n,n+1)/A(n,n)
for i=n-1:-1:1
    summ = 0
    for j=i+1:n
        summ = summ + A(i,j)*x(j,:)
        x(i,:) = (A(i,n+1) - summ)/A(i,i)
    end
end

msgbox(sprintf("Matriz Aumentada Final:\n%s", mat2str(x, 4)), 'Matriz Aumentada', 'help');
