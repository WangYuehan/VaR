
% 统计SMB和HML因子的平均值、标准差、偏度、峰度，构造t检验，看SMB和HML是否平均意义上为正。
% 统计这两个因子在每个月份的平均值，是否存在规律？（采用fivefactor_monthly.csv数据）

clear 
load('factors.mat');

results=ones(3,5);

results(1,1)=mean(smb);     %smb平均值
results(1,2)=std(smb);      %smb标准差
results(1,3)=skewness(smb); %smb偏度
results(1,4)=kurtosis(smb); %smb峰度
results(1,5)=ttest(smb);    %t检验

results(2,1)=mean(hml);     %hml平均值
results(2,2)=std(hml);      %hml标准差
results(2,3)=skewness(hml); %hml偏度
results(2,4)=kurtosis(hml); %hml峰度
results(2,5)=ttest(hml);    %t检验

mthmean=(smb+hml)/2;
plot(mthmean)

results(3,1)=mean(mthmean);     %hml平均值
results(3,2)=std(mthmean);      %hml标准差
results(3,3)=skewness(mthmean); %hml偏度
results(3,4)=kurtosis(mthmean); %hml峰度
results(3,5)=ttest(mthmean);    %t检验

results
subplot(1,3,1);
hist(mthmean,20)
subplot(1,3,2);
hist(hml,20)
subplot(1,3,3);
hist(smb,20)

% 结果储存在results中。各行分别为SMB、HML和两者均值。
% 各列为因子和两者均值平均值、标准差、偏度、峰度，t检验结果（1表示显著大于0，0反之）


