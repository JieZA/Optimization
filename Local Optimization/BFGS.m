%% Partie IV: Methode BFGS
%-----------------------------------------------
%Xn: Tous les X0 calculé à chaque itération,output 
%val: vecteur pour stocker la valeur de fonction a chaque etape
%-----------------------------------------------
%FUN: Fonction à résoudre
%Grad: Fonction pour calculer le gradient
%X0: Point initial
%N: Nombre iteration
%-----------------------------------------------
function [Xn,val] = Newton(FUN,Grad,X0,N)

%initialisation du vecteur Xn
Xn = X0; 
val = FUN(X0);
G0 = eye(2,2);
for k=1:N

    g0 = Grad(X0);
    X1 = X0 - g0*G0;
    d0 = X1 - X0;
    y0 = Grad(X1) - Grad(X0);
    G0 = G0 + y0'*y0./(y0'*d0) - G0*d0'*d0*G0./(d0*G0*d0');
    X0 = X1;
    
    Xn = [Xn;X0];
    val = [val;FUN(X0)];
    
end

end