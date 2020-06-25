function [X] = crout_inverse(A)

[m,n] = size(A);
if m~=n
    disp('m should be equal to n');
    return 
end

d = diag(A);
if ~all(d)
    disp('Diagonal elements of A equals 0');
    return
end

[L, U] = Crout(A);
B = invlower(L);
C = invupp(U);
X = C*B;

end