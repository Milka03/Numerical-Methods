% MENU
clear
clc
finish=9;  
control=1;

%default data %
syms x;
x0 = 0;
x1 = 1;
n = 5;
tol = 1e-10;
max_iter = 100;

while control~=finish 

    control=menu('Menu', 'Change initial guess x0',...
                 'Change initial guess x1',...
                 'Change degree n of polynomial',...
                 'Change tolerance',...
                 'Change maximum number of iterations',...
                 'Display variables', 'Find root',...
                 'Plot function', 'FINISH');

    switch control
        case 1
            x0=input('x0=');

        case 2
            x1=input('x1=');

        case 3
            n=input('n=');
            
        case 4
            tol=input('tol=');

        case 5
            max_iter=input('max_iter=');
        
        case 6
            disp('---- Variables ----');
            disp('x0 =');disp(x0)
            disp('x1 =');disp(x1)
            disp('Degree n =');disp(n)
            disp('tolerance =');disp(tol)
            disp('max_iteration =');disp(max_iter)
            
        case 7
             px=chebyshevT(n,x);
            [root, i] = king_method(n,x0,x1,tol,max_iter);
            p0=vpa(subs(px,x,root));
            disp('---- Finding root ----');
            disp('Chebyshev Polynomial p(x) =');disp(px)
            disp('Root x =');disp(root)
            disp('i =');disp(i)
            disp('Value at p(x) =');disp(p0)
            
        case 8
            f=@(x) chebyshevT(n,x);
            fplot(f,[-1,1])
            ylim([-1 1])
            grid on
            xlabel('x')
            ylabel('f(x)')
            title('Chebyshev polynomial')
            
        case 9
            disp('FINISH')
            close
    end
end
