function A = growmat(n)
%Emilia Wróblewska 291674
%Function returning a specific matrix A of size nxn.

A = ones(n);     %creating nxn matrix of 1's
helper = 0:n-1;  %helper vector 

for i = 1:n  
    A(:,i) = linspace(1,n + (helper(i)*(n-1)),n)';
end

end