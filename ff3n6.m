% 给定一个size规模因子矩阵，数据中含有缺失值，
% 请计算对应的Z值并输出一个相同大小的Z值矩阵，原数据中的缺失值保留。

clear
load('Size.mat');

[m,n]=size(Size);
tmean=nanmean(Size');
tstd=nanstd(Size');
mmean=tmean'*ones(1,n);
mstd=tstd'*ones(1,n);
Zmatrix=(Size-mmean)./mstd;