function root = newton(f,guess)
%Emilia Wróblewska 291674
%Newton method for finding a root of given function f
%taking an initial guess equal to "guess"

%function handle for calculating derivative of f
delta = 1e-8;
d = @(x)((8*f(x+delta) - f(x+2*delta) - 8*f(x-delta) + f(x-2*delta))./(12*delta));
 
iterations = 70;
maxerr = 1e-15;

for n=1:iterations
    oldgss = guess;
    fp = d(guess);
    %Condition to avoid dividing by 0 or obtaining complex numbers
    if fp == 0 || imag(fp) ~= 0
        root = NaN;
        return;
    end
    newgss = guess - (f(guess)/fp);
    %Checking if our calculated root has established exactness
    if abs(newgss-oldgss) < maxerr
        root = newgss;
        break;
    end
    guess = newgss;
end

%If the root wasn't found in established number of iterations
%return NaN to inform nlin function there was no root
if n == iterations 
    root = NaN;
end

end