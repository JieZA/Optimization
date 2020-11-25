%% Partie I: gradient_backtrack, Boucle de backtracking
%-----------------------------------------------
%Xn: Tous les X0 calculé à chaque itération,output 
%val: vecteur pour stocker la valeur de fonction a chaque etape
%-----------------------------------------------
%Grad: Fonction pour calculer le gradient
%FUN: Fonction à résoudre
%alpha_init: Paramètre d'entrée
%beta:Paramètre d'entrée
%tau: Paramètre du procédé de backtracking
%X0: Point initial
%N: Nombre iteration
%-----------------------------------------------

function [Xn,val] = gradient_backtrack(FUN,Grad,beta,alpha_init,tau,X0,N)

%initialisation du vecteur Xn, val
Xn = X0; 
val = FUN(X0);
dalpha = tau;

for i = 1:N

    gradient_X0 = Grad(X0);
    d = -gradient_X0;
    alpha = alpha_init;
    
    while FUN(X0 + alpha*d) > FUN(X0) + beta*alpha*dot(d, gradient_X0)
        alpha = alpha * dalpha;
    end
    
    X0 = X0 + alpha*d;
    Xn = [Xn;X0];
    val = [val;FUN(X0)]; 
    
end

end

