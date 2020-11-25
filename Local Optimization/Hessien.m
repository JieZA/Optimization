%% Hessien de la Fontion J(x,y) au point X0
%-----------------------------------------------
%J: Valeur de cette fonction à point X
%X: Point(x,y)
%-----------------------------------------------

function H = Hessien(X)
h11 = 1200*X(1)^2 - 400*X(2) + 2;
h12 = -400*X(1);
h21 = -100*X(1);
h22 = 200;
H = [h11 h12;h21 h22];
end

