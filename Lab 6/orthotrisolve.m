function x = orthotrisolve(a,b,c,r)
%Emilia Wróblewska 291674
%Function solving a system of linear equations Ax = r, where A is
%a tridiagonal matrix with diagonals a,b,c and r is a vertical vector.
%Matrix A is first reduced to an upper-triangular form using orthogonal
%transformations i.e. Householder reflections. Then the solution to the
%system - vector x - is computed using backward substitution.

%Initialize variables that will be frequently used
n = size(r,1);
I = eye(2);
%Vector d for new nonzero elements that may appear during triangularization
d = zeros(n-2,1);

for i=1:n-2
    %Construct 2x2 Housholder matrix using first "column" of given 2 rows
    x = [b(i); a(i)];
    y = [norm(x); 0];
    w = (x-y)/norm(x-y);
    H = I - 2*(w*w');
    %Construct matrix including all nonzero values from 2 consecutive rows
    A = [b(i),c(i),0; a(i),b(i+1),c(i+1)];
    %Multiply H*A and update corresponding values of vectors b,c,d and r
    Res = H*A;
    b(i) = Res(1,1);
    c(i) = Res(1,2);
    d(i) = Res(1,3);
    b(i+1) = Res(2,2);
    c(i+1) = Res(2,3);
    r([i i+1]) = H*r([i i+1]);
end

%Last step of reduction to upper-triangular form
x = [b(n-1); a(n-1)];
y = [norm(x); 0];
w = (x-y)/norm(x-y);
H = I - 2*(w*w');
%The matrix with nonzero values from last 2 rows is 2x2
A = [b(n-1),c(n-1); a(n-1),b(n)];
%Multiply H*A and update corresponding values of vectors b,c,d and r
Res = H*A;
b(n-1) = Res(1,1);
c(n-1) = Res(1,2);
b(n) = Res(2,2);
r([n-1 n]) = H*r([n-1 n]);

%Solve the system of linear equations by backward substitution
x = zeros(n,1);
x(n) = r(n)/b(n);
x(n-1) = (r(n-1) - (c(n-1)*x(n))) / b(n-1);

%The only nonzero values from final matrix are stored in vectors b,c,d
%so the algorithm is simplified into following form
for i=n-2:-1:1
    x(i) = (r(i) - (c(i)*x(i+1) + d(i)*x(i+2))) / b(i);
end

end