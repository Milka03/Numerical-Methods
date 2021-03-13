function Y = fun4(X)
%Emilia Wróblewska 291674
%Function returning matrix Y of calculated values of function (sin(x)-x)/x^3
%for respective arguments from input matrix X

%function handle for f specified in the task
f = @(x)(sin(x)-x)./((x.^2).*x);

%function handle for Maclaurin series of f used to calculate f(x) around 0
%(instead of x^(2n) write x^2*x^2 *...*x^2 n times for higher efficiency)
t = @(x)(-1/6 + (x.^2)/120 - (x.^2).*(x.^2)/5040 + (x.^2).*(x.^2).*(x.^2)/362880 - ...
    (x.^2).*(x.^2).*(x.^2).*(x.^2)/39916800 + (x.^2).*(x.^2).*(x.^2).*(x.^2).*(x.^2)/6227020800 - ...
    (x.^2).*(x.^2).*(x.^2).*(x.^2).*(x.^2).*(x.^2)/1307674368000);

%First fill Y with calculated values of f 
Y = f(X);
%Locate values which are around 0 in X
Index0 = (abs(X) <= 0.5);
tempX = X(Index0);
%Fill corresponding locations in Y with calculated values of Maclaurin series
Y(Index0) = t(tempX);

end