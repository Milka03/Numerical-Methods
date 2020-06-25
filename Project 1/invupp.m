function X = invupp(A)

[m,n] = size(A);
if m~=n
    disp('m should be equal to n');
    return 
end

X = zeros(n);
d = diag(A);

if ~all(d)
    disp('Diagonal elements of A equals 0');
    return
end

for j=1:n
   X(j,j)=1/A(j,j);
   for i=j-1:-1:1
       s=0;
       for p=i+1:j
           s=s+A(i,p)*X(p,j);
       end
       X(i,j)= -s/A(i,i);
   end
end
end