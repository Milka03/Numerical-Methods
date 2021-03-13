function root = secant(f,a,b)

x0 = a;
x1 = b;
maxerr = 1e-15;
iterations = 100;

for i=1:iterations 
    f0 = feval(f,x0); %value f(x0)
    f1 = feval(f,x1); %value f(x1)
    %disp (f0); disp(f1);
    if (f1-f0) == 0
        %disp(' You divide by zero! ');
        root = NaN;
        return;
    end
    root = x1-((x1-x0)/(f1-f0))*f1; 
    err = abs(root-x1);
    
    if err < maxerr 
        break
    end
    x0 = x1;
    x1 = root;
end

if i == 100 
    root = NaN;
end

end