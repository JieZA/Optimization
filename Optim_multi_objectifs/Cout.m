%********************************************************************
%Fonction de coûte
%********************************************************************

function f=Cout(x,cyc,opt)

D=cyc; %Distance totale
pho=1.2;
S=1;
Cx=0.75;
m=1500;
p=0;
Crr=0.015;
g=9.81;
A=pho*S*Cx;
a=x(1);
v=x(2);
d=x(3);

%Déplacement de chaque phase
da=v^2/(2*a);
dd=-v^2/(2*d);
dv=D-da-dd;

%temp passé de chaque phase
ta=v/a;
td=-v/d;
tv=dv/v;

%Consommation d'énergies de chaque phase
Ca=(A*a^3)/8*ta^4+a*((m*a+m*p*g+Crr*m*g))*ta^2/2;
Cv=(1/2*A*v^2+m*0+m*p*g+Crr*m*g)*v*tv;
Cd=((A*d^3)/8*(d*td+v)^4+d*((m*d+m*p*g+Crr*m*g))*(d*td+v)^2/2);

%Consommation totale 
C=Ca+Cv+Cd;

%Temp total
T=ta+td+tv;

f=opt*C+(1-opt)*T;
