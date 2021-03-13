function result = trapezoidal(f,a,b,m)
%Emilia Wróblewska 291674
%Function implementing composite trapezoidal rule used for calculating 
%first element of Romberg table in smartRM function 

h = (abs(b - a))/m;
sum = 0;

for k = 1:m-1
  tk = a + k*h;
  sum = sum + f(tk);
end

result = h * ((f(a) + f(b))/2 + sum);
end