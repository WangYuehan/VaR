% ѡȡ�����ҵָ��������FF������ģ�ͻع飬�����ع�ϵ����
% ����ÿ����ҵ�����������ϵķ��գ�����������ռ�ܷ��յı���������ָ��ΪVaR(Value at Risk)��
% ����ҵָ�������������أ�

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

