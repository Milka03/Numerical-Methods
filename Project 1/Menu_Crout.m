% MENU
clear
clc
finish=8;  
control=1;

%default value
A = [1,-3,2; -3,10,-5; 2,-5,6];

while control~=finish 

    control=menu('Menu', 'Input A', 'Display variables',...
    'Compute inverse of A','Find LU-factorization of A',...
    'Compute inverse of U','Compute XL = U^(-1)',...
    'Run Tests','FINISH');

    switch control
        case 1
            clearvars variables
            A=input('A = ');
            while check_matrix(A) == 0
                disp('Matrix is not positive definite');
                A=input('A = ');
            end
            
        case 2
            disp('A = ');disp(A)
            
        case 3
            In = crout_inverse(A);
            disp('Inverse of A = ');disp(In)

        case 4
            [L, U] = Crout(A);
            disp('LU-factorization of A = ');disp('L = ');
            disp(L);disp('U = ');disp(U)
            
        case 5
            [L, U] = Crout(A);
            u1 = invupp(U);
            disp('Inverse of U = ');disp(u1)
            
        case 6
            [L,U] = Crout(A);
            X = invupp(U)*invlower(L); 
            disp('Solution X = '); disp(X);
            
        case 7
            CroutErrors;
            
        case 8
            disp('FINISH')
            
    end
end