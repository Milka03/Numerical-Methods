function r = nlin(f)
%Emilia Wróblewska 291674
%Function for finding all real roots of given function handle f

r = [];  %empty vector for roots
a = -10; %beginning of the interval
b = 10;  %end of the interval

for i=a:0.01:b
    root = newton(f,i);
    if isnan(root) == false
        r(length(r)+1) = root;
    end
end 

r = uniquetol(r,1e-12); %eliminating duplicate roots

end