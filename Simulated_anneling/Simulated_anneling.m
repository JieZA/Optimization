clear all;
clc

%%背包问题的模拟退火算法解
a=0.95;%温度衰减速度
mar_length=1000;%马氏链长度
k=[34 32 56 67 54 32 45 56 46 70];%物品价值
d=[8 12 24 16 6 9 35 21 18 19];%物品重量
restriction=50;%背包能够承受的最大重量
num=length(k);%物品数量
sol_new=round(rand(1,num));%随机生成初始解
sol_current=sol_new;
E_current=inf;E_best=inf;%E_current是当前解对应的目标函数，E_best是最优解，E_new是新解的目标函数值
t0=97;tf=3;t=t0;
while t>tf
    for i=1:mar_length
        %产生随机扰动
        temp1=ceil(rand*num); %全局大范围搜索,随机选取对象
        sol_new(1,temp1)=~sol_new(1,temp1);%随机改变某件物品取或不取
        %检查是否满足约束
        while (1)
            s=(sol_new*d'>restriction);
            if s
                %如果不满足约束随机放弃一个物品
                temp2=find(sol_new==1); %寻找需要拿取物品的索引值
                temp3=ceil(rand*length(temp2));%选择其中某一物品放弃
                sol_new(temp2(temp3))=~sol_new(temp2(temp3));%执行丢弃
            else
                break
            end
        end
        %计算背包中物品的价值模拟退火算法只能求最小值，所以价值取负
        E_new=sol_new*(-k');
        if E_new<E_current
            E_current=E_new;
            sol_current=sol_new;
            if E_new<E_best
                E_best=E_new;
                sol_best=sol_new;
            end
        else
            if (rand<exp(-(E_new-E_current)./t)) %t较高时，容易跳出局部最优解进行全局搜索
                 E_current=E_new;
                 sol_current=sol_new;
            else
                 sol_new=sol_current; %t较低的情况，程序跳出搜索的可能性变小，进行精确搜索
            end
        end
    end
    t=t*a;
end
disp('最优解为')
sol_best
disp('物品总价值为')
E_best
disp('背包中物品总重量')
sol_best*d'
rand
