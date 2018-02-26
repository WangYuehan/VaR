
% ͳ��SMB��HML���ӵ�ƽ��ֵ����׼�ƫ�ȡ���ȣ�����t���飬��SMB��HML�Ƿ�ƽ��������Ϊ����
% ͳ��������������ÿ���·ݵ�ƽ��ֵ���Ƿ���ڹ��ɣ�������fivefactor_monthly.csv���ݣ�

clear 
load('factors.mat');

results=ones(3,5);

results(1,1)=mean(smb);     %smbƽ��ֵ
results(1,2)=std(smb);      %smb��׼��
results(1,3)=skewness(smb); %smbƫ��
results(1,4)=kurtosis(smb); %smb���
results(1,5)=ttest(smb);    %t����

results(2,1)=mean(hml);     %hmlƽ��ֵ
results(2,2)=std(hml);      %hml��׼��
results(2,3)=skewness(hml); %hmlƫ��
results(2,4)=kurtosis(hml); %hml���
results(2,5)=ttest(hml);    %t����

mthmean=(smb+hml)/2;
plot(mthmean)

results(3,1)=mean(mthmean);     %hmlƽ��ֵ
results(3,2)=std(mthmean);      %hml��׼��
results(3,3)=skewness(mthmean); %hmlƫ��
results(3,4)=kurtosis(mthmean); %hml���
results(3,5)=ttest(mthmean);    %t����

results
subplot(1,3,1);
hist(mthmean,20)
subplot(1,3,2);
hist(hml,20)
subplot(1,3,3);
hist(smb,20)

% ���������results�С����зֱ�ΪSMB��HML�����߾�ֵ��
% ����Ϊ���Ӻ����߾�ֵƽ��ֵ����׼�ƫ�ȡ���ȣ�t��������1��ʾ��������0��0��֮��


