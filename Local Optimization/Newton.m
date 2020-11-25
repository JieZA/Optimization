%% Partie III: Methode Newton
%-----------------------------------------------
%Xn: Tous les X0 calculé à chaque itération,output 
%val: vecteur pour stocker la valeur de fonction a chaque etape
%-----------------------------------------------
%FUN: Fonction à résoudre
%Grad: Fonction pour calculer le gradient
%Hess: Fonction pour calculer le hessien
%X0: Point initial
%N: Nombre iteration
%-----------------------------------------------
function [Xn,val] = Newton(FUN,Grad,Hess,X0,N)

%initialisation du vecteur Xn
Xn = X0; 
val = FUN(X0);

for k=1:N

    gradient_X0 = Grad(X0);
    Hessien_X0 = Hess(X0);
    X0 = X0 - gradient_X0 * inv(Hessien_X0); % dans mon cas,inverse de l'énnonce pour satisfaire le dimension
    Xn = [Xn;X0];
    val = [val;FUN(X0)];

end

end

