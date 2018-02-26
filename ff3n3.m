% 找到市场风险溢价（rm-rf）的月度时间序列数据，给出rm-rf，SMB，HML的方差协方差矩阵，看看从单个因子看，
% 哪个因子的波动性更大，不同因子的相关性如何？（采用fivefactor_monthly.csv数据）

clear 
load('factors.mat');

tesla=[mkt_rf smb hml];
cov(tesla)
corr(tesla)

%由输出可知，市场风险溢价因子波动性最大，其次是hml，最小的是smb。
% 因子间相关性较低，市场风险溢价和smb相关性相对较高；
% hml和剩下两个因子之间成负相关关系。