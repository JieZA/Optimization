%--------------------------------------------------------------------------
%Authors        : Jie Zhang
%Theme          : Travail pratique - optimisation local sans locale
%Date and Time  : 25/11/2020 at 08:30
%--------------------------------------------------------------------------
close all;
clc;

%L’objectif de ce TP est d’utiliser le logiciel Matlab (MathWorks) afin 
%de comparer différents algorithmes de recherche linéaire pour la 
%minimisation locale d’une fonction définie sur Rn.
%--------------------------------------------------------------------------

%**************************************************************************
%**************************  Partie I  ************************************
%**************************************************************************

%% Question 1 Implementer une fonction avec la contrainte Armijo
%--------------------------------------------------------------------------
%Voir la fonction "gradient_backtrack"
%--------------------------------------------------------------------------

%% Question 2 Minimiser la fonction J en 2D :
%--------------------------------------------------------------------------
% Voire la fonction J "Function_J"

beta = 0.1;alpha_init = 1;tau = 0.3;X0 = [0 1];N = 100;
[Xn_1,val_1] = gradient_backtrack(@Function_J,@grad,beta,alpha_init,tau,X0,N);
%valeur minimum est donc le dernière composant du vectoeur val

%Ligne de niveau de la fonction sur [-1 2]
beta = 0.1;alpha_init = 1;tau = 0.3;X0 = [0 1];N = 100;
x = linspace(-1,2,N);
y_niveauplus = []; y_niveaumoin = [];
k = size(Xn_1 ,1);
figure, 
for i = 1:k
    C = val_1(i);
    y1 = x.^2 + sqrt((C - (x - 1).^2)./100);
    y_niveauplus = [y_niveauplus;y1];
    plot(x,y1,'red','LineWidth',0.5); hold on;
end
xlabel('x'); ylabel('y');
title('Ligne de niveau +')

figure, 
for i = 1:k
    C = val_1(i);
    y2 = x.^2 - sqrt((C - (x - 1).^2)./100);
    y_niveaumoin = [y_niveaumoin;y2];
    plot(x,y2,'blue','LineWidth',0.5); hold on;
end
xlabel('x'); ylabel('y');
title('Ligne de niveau -')

N_ = linspace(0,N+1,N+1);
figure,plot(N_,val_1','red','LineWidth',2);
xlabel('N'); ylabel('J(XN)');
title('Evaluation de la valeur de J(x,y) avec methode backtracking')
s = sprintf('%s%f','The minimum of J caculated by the methode backtracking is: ',val_1(k)); 
disp(s);
%--------------------------------------------------------------------------

%**************************************************************************
%**************************  Partie II  ***********************************
%**************************************************************************

%% Question 1 Implémenter un algorithme de trouver un pas convenable
%--------------------------------------------------------------------------
%Voir la fonction "Goldstein"
%Tester la même démarche que dans la Partie I
beta = 0.1; beta2 = 0.001;alpha_init = 1;tau1 = 0.4;tau2 = 0.99;
X0 = [0 1];N = 100;
[Xn_2,val_2] = Goldstein(@Function_J,@grad,X0,beta,beta2,alpha_init,tau1,tau2,N);
N_ = linspace(0,N+1,N+1);
figure,plot(N_,val_2','red','LineWidth',2);
xlabel('N'); ylabel('J(XN)');
title('Evaluation de la valeur de J(x,y) avec methode Goldstein')
s = sprintf('%s%f','The minimum of J caculated by the methode Goldstein is: ',val_2(k));
disp(s);
% On peut voir le vecteur val_2 que l'algorithm se trompe dans un minimum
% local
%--------------------------------------------------------------------------

%**************************************************************************
%**************************  Partie III  **********************************
%**************************************************************************

%% Question 1 Implémenter une methode Newton
%--------------------------------------------------------------------------
%Voir la fonction "Newton"
%Tester la même démarche que dans la Partie II
X0 = [0 1];N = 100;
[Xn_3,val_3] = Newton(@Function_J,@grad,@Hessien,X0,N);

N_ = linspace(0,N+1,N+1);
figure,plot(N_,val_3','red','LineWidth',2);
xlabel('N'); ylabel('J(XN)');
title('Evaluation de la valeur de J(x,y) avec methode Newton')
s = sprintf('%s%f','The minimum of J(x,y) caculated by the methode Newton is: ',val_3(k)); 
disp(s);
%--------------------------------------------------------------------------

%**************************************************************************
%**************************  Partie IV  ***********************************
%**************************************************************************

%% Question 1 Implémenter une methode Newton
%--------------------------------------------------------------------------
%Voir la fonction "BFGS"
%Tester la même démarche que dans la Partie III
X0 = [0 1];N = 100;
[Xn_4,val_4] = BFGS(@Function_J,@grad,X0,N);

N_ = linspace(0,N+1,N+1);
figure,plot(N_,val_4','red','LineWidth',2);
xlabel('N'); ylabel('J(XN)');
title('Evaluation de la valeur de J(x,y) avec methode BFGS')
s = sprintf('%s%f','The minimum of J(x,y) caculated by the methode BFGS is: ',val_4(k)); 
disp(s);
%--------------------------------------------------------------------------

%**************************************************************************
%**************************  Partie V  ************************************
%**************************************************************************

%% Question 1 Conclure sur l’efficacité comparée des méthodes de gradient, Newton et BFGS.
%--------------------------------------------------------------------------
%Parmis ces 4 méthodes, la méthode backtracking est efficace, ce qui nous
%permet d'obtnir un minimum global. La méthode Goldstein peut très rpidement 
%dimunuer la valeur de J(x,y), mais souvent elle se trompe dans un minimum 
%local. La méthode New est un compremis entre l'efficacité et la prcésion,
%c'est à dire sa vitesse est plus rapide que backtracking mais avec une
%pire précision.La méthode BFGS dans ce cas ne nous permet de converger cet
%algorithme.
%--------------------------------------------------------------------------




