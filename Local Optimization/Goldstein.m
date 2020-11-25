%% Partie II: gradient_backtrack2, condition de Goldstein
%-----------------------------------------------
%Xn: Tous les X0 calculé à chaque itération,output 
%val: vecteur pour stocker la valeur de fonction a chaque etape
%-----------------------------------------------
%Grad: Fonction pour calculer le gradient
%FUN: Fonction à résoudre
%alpha_init: Paramètre d'entrée
%beta,beta2:Paramètre d'entrée
%pb: Paramètre du procédé de backtracking
%tau1,tau2: pas pour dimunier alpha
%X0: Point initial
%N: Nombre iteration
%-----------------------------------------------

function [Xn,val] = Goldstein(FUN,Grad,X0,beta,beta2,alpha_init,tau1,tau2,N)

%initialisation du vecteur Xn
Xn = X0; 
val = FUN(X0);

for i=1:N

    gradient_X0 = Grad(X0);
    d = -gradient_X0;
    alpha = alpha_init;
    
    n = 0;
    while  n<1000
        n = n+1;
        if beta*alpha*dot(d, gradient_X0) > FUN(X0+alpha*d)-FUN(X0)
            alpha = alpha *tau1;
        end
        if beta2*alpha*dot(d, gradient_X0) < FUN(X0+alpha*d)-FUN(X0)
            alpha = alpha *tau2;
        end
    end
    
    X0 = X0+alpha*d;
    Xn = [Xn;X0];
    val = [val;FUN(X0)];

end

end


