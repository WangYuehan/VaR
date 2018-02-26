function [results]=normaltest(price)
%程序目的:
%输入1：price 投资组合资产的价格矩阵  M*N矩阵，N个资产，M个观测值，
%输入2：w 投资组合中各个资产的权重向量 列向量 N*1向量
%输入3：confidence 置信水平
%输出： VaR 资产的VaR
%第一步，求解对数收益率矩阵
[M,N]=size(price);
r=zeros(M-1,N);
for i=1:N
r(:,i)=diff(log(price(:,i)));
end
hist(r,20);
results=zeros(N,1);
for i=1:N
    results(i,1)=jbtest(r(:,i)); %JB检验
end
end