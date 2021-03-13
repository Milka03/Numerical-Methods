function [Q,err,K] = smartRM(f,a,b,tol,m0,Kmin,Kmax)
%Emilia Wróblewska 291674
%Function using semi-smart Romberg method for approximating
%value of finite integral of function handle f

%Allocate matrix for Romberg table with maximum possible size 
Rom = zeros(Kmax+1);
%Compute first element of Romberg table using composite trapezoidal rule
Rom(1,1) = trapezoidal(f,a,b,m0);

for i = 2:Kmax+1
    %Calculate first element in row using T_{i-1,0} value and midpoint rule
    mk = 2^(i-2);
    Rom(i,1) = (Rom(i-1,1) + midpoint(f,a,b,mk)) / 2;
    
    %Fill rest of the row with appropriate values
    for j = 2:i
        Rom(i,j) = (4^(j-1) * Rom(i,j-1) - Rom(i-1,j-1)) / (4^(j-1) - 1);
    end
    K = i-1;
    Q = Rom(i,i);
    
    %Compute and check the error condition only after reaching the
    %minimum number of extrapolation steps:
    if K >= Kmin
        errK = (abs(Rom(i,i) - Rom(i-1,i-1))) / (max(1,Rom(i,i)));
        errK1 = (abs(Rom(i-1,i-1) - Rom(i-2,i-2))) / (max(1,Rom(i-1,i-1)));
        if errK < tol && errK1 < tol
            err = max(errK,tol);
            break;
        end
    end
end

%If we reach maximum number of extrapolation steps without achieving
%desired accuracy, set output arguments to the most accurate values we got:
if (i-1) == Kmax
    K = Kmax;
    Q = Rom(i,i);
    errK = (abs(Rom(i,i) - Rom(i-1,i-1))) / (max(1,Rom(i,i)));
    err = max(errK,tol);
end
end