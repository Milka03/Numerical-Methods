function [root, i] = king_method(n,a,b,maxerr,iterations)

x0 = a;
x1 = b;
syms x;
f=chebyshevT(n,x);
%disp('f = '); disp(f);

for i=1:iterations
    
    f0=vpa(subs(f,x,x0)); %value f(x0)
    f1=vpa(subs(f,x,x1)); %value f(x1)
    if (f1-f0)==0
        disp(' You divide by zero! ');
        return;
    end
    root=x1-((x1-x0)/(f1-f0))*f1; 
    err=abs(root-x1);
    
    if err<maxerr 
        break
    end
    x0=x1;
    x1=root;
end

end