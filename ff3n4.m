% 给定一个股票投资组合，随意选定三只股票。
% （1）请编写一个函数，函数输入：股票价格矩阵，权重向量，置信水平。函数输出：持有1块钱时投资组合的VaR。
% （2）设定置信水平95%，利用提供的日频数据，分别用delta normal和历史模拟法，检验三个资产收益率序列是否为正态分布，并画出经验分布图。
% （正态分布检验方法为J-B统计量，请自行查找资料）
% （3）用公式推导计算三个资产的边际VaR以及成分VaR，计算方法参照课件。

% 答：（1）见lzhVaR及以下；（2）见下；（3）见提交作业。
clear
load('ClosePrice.mat');

% 设置股票权重与置信度
w=[0.2 0.3 0.5];
conf=0.95;

%计算
tesla=ClosePrice(:,1:3);
Var=lzhVaR(tesla,w',conf);          %计算VaR

JBtest=lzhnrmtest(tesla)
% 结果显示这三支股票均不满足正态分布（均为1，结果拒绝正态分布假设）

% 两种方法的计算
nrmresult=zeros(3,1);   %delta normal
histresult=zeros(3,1);  %histroy
for i=1:3
    nrmresult(i,1)=lzhVaR(tesla(:,i),1,conf);
    histresult(i,1)=lzhhisVaR(tesla(:,i),conf);
end;
nrmresult
histresult

% 分别得到在正态分布和历史假设下的平安银行、万科A、国农科技的个股VaR

