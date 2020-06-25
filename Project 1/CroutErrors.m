function CroutErrors
%Crout algorythm Error check
clear
clc
in = input('Choose matrix(1 - pascal(3), 2 - pascal(5), 3 - pascal(10), 4 - hilb(10))');

if(in==1)    
    n=3;
    A=pascal(n);
elseif(in==2)
    n=5;
    A=pascal(n);
elseif(in==3)
    n=10;
    A=pascal(n);
elseif(in==4)
    n=10;
    A=hilb(n);
else
    n=4;
    A=pascal(n);
end

cond_A=cond(A);
disp('A='); disp(A);
disp('Condition numer of A = '); disp(cond_A);

%Inverse error (1)
I=eye(n);
Y=inv(A); %matlab inverse function
X=crout_inverse(A); %crout inverse
a1=inv(X); 
r_R=norm(A*X-I)/(norm(A)*norm(X)); % Right residual error
r_L=norm(X*A-I)/(norm(A)*norm(X)); % Left residual error
error_1=norm(a1-A)/norm(A);

disp('Matlab inv(A)='); disp(Y);
disp('Crout inverse(A)='); disp(X);
disp('Right residual error = '); disp(r_R);
disp('Left residual error = '); disp(r_L);
disp('Inverse error = '); disp(error_1);

%LU-decomposition error (2)
[L,U]=Crout(A); 
error_low=norm(A-L*L')/norm(A);
error_upp=norm(A-U*U')/norm(A);
disp('Lower error'); disp(error_low);
disp('Upper error'); disp(error_upp);

%Solving system XL = inv(U) error (3)
Z=crout_inverse(A); % The exact solution of our problem.
u1=Z*L;
H=u1*invlower(L);
e1=norm(H-Z)/norm(Z);
e2=e1/cond(A);
e3=norm(u1-A*H)/(norm(A)*norm(H));
disp('Relative error =');disp(e1)
disp('Forward stability error =');disp(e2)
disp('Backward stability error =');disp(e3)

end

