function result = midpoint(f,a,b,m)
%Emilia Wróblewska 291674
%Function implementing composite midpoint rule used for calculating 
%elements in first column of Romberg table in smartRM function

h = (abs(b - a))/m;
sum = 0;

for k = 0:m-1
    tk = a + k*h;
    tk1 = a + (k+1)*h;
    sum = sum + f((tk + tk1)/2);
end

result = h*sum;
end