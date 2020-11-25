%% Valeur de la fontion J(x,y) à résoudre au point X0
%-----------------------------------------------
%J: Valeur de cette fonction à point X
%X: Point(x,y)
%-----------------------------------------------

function J = Function_J(X)
J = 100*(X(2) - X(1)^2)^2 + (X(1) - 1)^2;
end


