function d = derivative(f,x,h)
%Emilia Wróblewska 291674 
%Function finding the approximate derivative of 
%function handle f at point x

for i=1:5
    d = (8*f(x+h) - f(x+2*h) - 8*f(x-h) + f(x-2*h))/(12*h);
    if imag(d) ~= 0 || d == 0
        h = h + 1e-9;
    else
        break;
    end
end

end