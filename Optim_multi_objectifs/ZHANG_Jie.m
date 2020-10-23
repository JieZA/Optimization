%***************************************************************
%Travaux Pratique: Planification de trajectoires multi-objectifs
%Auteur: ZHANG Jie
%Date:23/10/2020
%
%Les réponse/justifications de chaque question sont données soit
%par les codes, soit par les comentaires.
%***************************************************************

clear all
clc;
a=1; %Accélération
d=-2; %Décélération
v=50/3.6; %Vitesse constante
D=1000; %Distance totale
pho=1.2;
S=1;
Cx=0.75;
m=1500;
p=0;
Crr=0.015;
g=9.81;
A=pho*S*Cx;

%% Q1
%C'est un problème continu en chaque phase, la phase d'accélération, 
%la phase de vistesse constante, la phase de décélération.

%% Q2
%Les valeurs à optimiser: a, d, v, avec 0.4<=a<=3, 10/3.6<=v<=130/3.6,
%-5<=d<=-0.4, dv=D-da-dd>=0

%% Q3
%a*ta=v, v/2*ta=da, alors da=v^2/(2a)
%v+d*td=0, v/2*td=dd, alors dd=-v^2/(2d)
%dv=D-da-dd, alors dv=D-v^2(1/2a-1/2d)

%% Q4 Q5
%Déplacement de chaque phase
da=v^2/(2*a); %Accélération
dd=-v^2/(2*d); %Décélération
dv=D-da-dd; %Vitesse constante

%temp passé de chaque phase
%ta=v/a; td=-v/d; tv=dv/v=(D-v^2(1/(2a)-1/(2d)))/v=D/v-v*(1/(2a)-1/(2d));
ta=v/a;
td=-v/d;
tv=dv/v;

%Consommation d'énergies de chaque phase
Ca=(A*a^3)/8*ta^4+a*((m*a+m*p*g+Crr*m*g))*ta^2/2;
Cv=(1/2*A*v^2+m*0+m*p*g+Crr*m*g)*v*tv;
Cd=((A*d^3)/8*(d*td+v)^4+d*((m*d+m*p*g+Crr*m*g))*(d*td+v)^2/2);

% Cost(a,v,d,0.7)

%% Q6
%Voir la fonction "Cost"

%% Q7 Q8
Distance=[4000,1000,500,200] %4 distqnce différentes pour comparer les fronts pareto
alpha=linspace(0.99,1,100); % Générer un ensemble de alpha

Optimisation=zeros(3,100); %Matrice pour stocker les vecteurs optimisés
Consommation=zeros(2,100); %Matrice pour stocker les objectifs optimisés de consommation et de temps 

init=[a;v;d];
lb=[0.4;10/3.6;-5];
ub=[3;130/3.6;-0.4];
cyc=D;

figure(1)% Front pareto pour D=Distance(1)=4000
for i=1:100
    opt=alpha(i);
    [opt_sol cost T s final_cost] = simulannealEVRY(@Cout,init,lb,ub,Distance(1),opt);
    Conso=Calcul_objectifs(opt_sol,cyc);
    Consommation(1,i)=Conso(1);
    Consommation(2,i)=Conso(2);
    scatter(Consommation(1,i),Consommation(2,i));
    hold on
    Optimisation(:,i)=opt_sol;
end
hold off
title('Front pareto pour Distance=4km')
xlabel('Temps');
ylabel('Consommation');

figure(2)% Front pareto pour D=Distance(2)=1000
for i=1:100
    opt=alpha(i);
    [opt_sol cost T s final_cost] = simulannealEVRY(@Cout,init,lb,ub,Distance(2),opt);
    Conso=Calcul_objectifs(opt_sol,cyc);
    Consommation(1,i)=Conso(1);
    Consommation(2,i)=Conso(2);
    scatter(Consommation(1,i),Consommation(2,i));
    hold on
    Optimisation(:,i)=opt_sol;
end
hold off
title('Front pareto pour Distance=1km')
xlabel('Temps');
ylabel('Consommation');

figure(2)% Front pareto pour D=Distance(2)=500
for i=1:100
    opt=alpha(i);
    [opt_sol cost T s final_cost] = simulannealEVRY(@Cout,init,lb,ub,Distance(3),opt);
    Conso=Calcul_objectifs(opt_sol,cyc);
    Consommation(1,i)=Conso(1);
    Consommation(2,i)=Conso(2);
    scatter(Consommation(1,i),Consommation(2,i));
    hold on
    Optimisation(:,i)=opt_sol;
end
hold off
title('Front pareto pour Distance=0.5km')
xlabel('Temps');
ylabel('Consommation');










