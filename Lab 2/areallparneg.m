function c = areallparneg(A)
%Emilia Wróblewska 291674
%Function checking if all rows and columns of 
%given matrix A are partial-negative.

[rows,cols] = size(A);

if rows >= cols
   iterations = rows;
else
    iterations = cols;
end

for i = 1:iterations
    if i <= rows
        %Checking if there is at least one row with all non-negative values
        if all(A(i,:) >= 0) == true
            c = false;
            return;
        end
    end
    if i <= cols
       %Checking if there is at least one column with all non-negative values
       if all(A(:,i) >= 0) == true
            c = false;
            return;
        end
    end
end

c = true;
end