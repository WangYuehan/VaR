% ����һ��size��ģ���Ӿ��������к���ȱʧֵ��
% ������Ӧ��Zֵ�����һ����ͬ��С��Zֵ����ԭ�����е�ȱʧֵ������

clear
load('Size.mat');

[m,n]=size(Size);
tmean=nanmean(Size');
tstd=nanstd(Size');
mmean=tmean'*ones(1,n);
mstd=tstd'*ones(1,n);
Zmatrix=(Size-mmean)./mstd;