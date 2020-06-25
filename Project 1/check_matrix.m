function b = check_matrix(A)
%function checks if input matrix A is 
%symmetric and positive definite

b = issymmetric(A);
if b == 0
    disp('Matrix is not symmetric!');
    return;
end

d = eig(A);
b = all(d > 0);

end