clc
clear all
close all

global fcount
lb=[-5 -5];
ub=[5 5];
A=[-2,-1;-1,-1];
b=[-4;5];
Aeq=[];
beq=[];
nonlcon=[];
navars=2;
fcount=0;

[X,fval]=ga(@Objective_function,navars,A,b,Aeq,beq,lb,ub,nonlcon);
display('The point of minima is:')
display(X)
