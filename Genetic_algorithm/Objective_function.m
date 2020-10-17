%*************************************%
%function:X(1)^2+10*X(2)^2-3*X(1)*X(2)%
%*************************************%

function f=Objective_function(X)
global fcount
fcount=fcount+1;
f=X(1)^2+10*X(2)^2-3*X(1)*X(2);