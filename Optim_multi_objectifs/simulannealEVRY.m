function [opt_sol cost T s final_cost] = simulannealEVRY(FUN,init,lb,ub,cyc,opt)
%simulannealEVRY Bound constrained optimization using simulated annealing.
%
%   simulannealEVRY attempts to solve problems of the form:
%       min F(X)  subject to  LB <= X <= UB
%        X                     
%                              
%   X = simulannealEVRY(FUN,init,lb,ub,cyc,opt) starts at init (column vector) and finds a local minimum X to
%   the objective function FUN. It defines a set of lower and upper
%   bounds on the design variables, X, so that a solution is found in the
%   range lb <= X <= ub. FUN accepts input X and returns a scalar
%   function value evaluated at X. init, lb and ub may be a scalar or a
%   column vector. Cyc is the total distance of the trip and opt is the
%   coefficient of the linear scalairization method (MOOP).
%
%   Examples:
%    In construction

%   See also SAOPTIMSET, PATTERNSEARCH, GA, FMINSEARCH.

kmax=1000;
T(1,1)=0.001;%Initial temperature
s(:,1)=init;
emin=0;%minimum energy per meter (convergence of algorithm
cost(1,1)=FUN(init,cyc,opt);
k=2;
sol(1,1)=1;
prob(1,1)=0;
final_cost(1,1)=cost(1,1);
distb=ub-lb;

while k<kmax% & cost(k-1,1)/cyc.dtot>emin
    for i=1:size(s,1)
        s(i,k)=s(i,sol(end,1))+T(k-1,1)/T(1,1)*(distb(i,1)*(rand()-0.5));%(1-k/kmax)*
        if s(i,k)>ub(i,1)
            s(i,k)=2*ub(i,1)-s(i,k);
        elseif s(i,k)<lb(i,1)
            s(i,k)=2*lb(i,1)-s(i,k);
        end
    end
    %s(:,k) = s(:,k-1)+(1-k/kmax)*((ub-lb).*rand(5,1)+lb-s(:,k-1));%creating new solution
    cost(k,1) = FUN(s(:,k),cyc,opt);%Evaluating new solution
    if cost(k,1)<final_cost(end,1) | rand()<exp(-(cost(k,1)-final_cost(end,1))/cyc/T(k-1,1));
        if cost(k,1)>final_cost(end,1)
            prob(end+1,1)=exp(-(cost(k,1)-final_cost(end,1))/cyc/T(k-1,1));
        end
        sol(end+1,1)=k;
        final_cost(end+1,1)=cost(k,1); 
    end
    T(k,1)=0.99*T(k-1,1);
    k=k+1;
end
opt_sol=s(:,sol(end,1));

