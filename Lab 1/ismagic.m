function c=ismagic(A)
%Emilia Wróblewska 291674
%Function checking if given matrix A is a magic matrix.

%Checking if A is a square matrix (if not, A can't be magic)
[n,m]=size(A);
if n~=m
    c=false;
    return;
end

col=sum(A);            %row vector containing the sum of each column
rows=sum(A,2);         %column vector containing the sum of each row
d1=sum(diag(A));       %sum of the main diagonal elements
d2=sum(diag(flip(A))); %sum of counterdiagonal elements

%Checking if all elements in vectors 'col' and 'rows' are equal
if max(col)~=min(col) || max(rows)~=min(rows)
    c=false;
    return;
end

%Checking if matrix is magic (sum of elements in each
%row, column and main diagonals must be equal)
if max(col)==max(rows) && max(rows)==d1 && d1==d2
    c=true;
else
    c=false;
end
end