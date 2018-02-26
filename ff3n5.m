% 选取多个行业指数，采用FF三因子模型回归，给出回归系数？
% 计算每个行业在三个因子上的风险，及三个因子占总风险的比例，风险指标为VaR(Value at Risk)。
% （行业指数数据自行下载）

clear 
load('factors.mat');
load('industry.mat');

trdmn=trdmn*100+1;
[~,time]=ismember(date0,trdmn);

usmb=smb(time(1:191));
uhml=hml(time(1:191));
umktrf=mkt_rf(time(1:191));
urf=rf(time(1:191));
ufin=finance(1:191)-urf;
umin=minning(1:191)-urf;
ureale=realestate(1:191)-urf;
umanu=manufacture(1:191)-urf;
ucult=culture(1:191)-urf;
Yvarb=[ufin umin ureale umanu ucult];
Xvarb=[umktrf usmb uhml];
results=zeros(5,3);

% regression on factors
for i=1:5
    results(i,:)=regress(Yvarb(:,i),Xvarb);
end
results

