%% Gradient de la Fontion J(x,y) au point X0
%-----------------------------------------------
%J: Valeur de cette fonction à point X
%X: Point(x,y)
%-----------------------------------------------
function G = grad(X)
gx = -200*(X(2) - X(1)^2)*2*X(1) + 2*(X(1) - 1);
gy = 200*(X(2) - X(1)^2);
G = [gx gy];
end