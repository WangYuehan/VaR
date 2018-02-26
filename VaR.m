function [VaR]=VaR(price,w,confidence)
%程序目的：计算投资组合的VaR
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
%第二步，求解对数收益率的均值与方差
mu=w'*mean(r,1)';%mu   投资组合资产收益率的均值
cov_matrix=cov(r);%cov_matrix   投资组合资产收益率的方差协方差矩阵
sigma=sqrt(w'*cov_matrix*w);%sigma 投资组合收益率的标准差
%第三步，在正态分布的假设下求解VaR
alpha=1-confidence;
VaR=-(mu+norminv(alpha,0,1)*sigma);
VaR=max(VaR,0);
end


