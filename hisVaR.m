function [results]=hisVaR(price,confidence)
%����Ŀ��:
%����1��price Ͷ������ʲ��ļ۸����  M*N����N���ʲ���M���۲�ֵ��
%����2��w Ͷ������и����ʲ���Ȩ������ ������ N*1����
%����3��confidence ����ˮƽ
%����� VaR �ʲ���VaR
%��һ���������������ʾ���
[M,N]=size(price);
r=zeros(M-1,N);
for i=1:N
r(:,i)=diff(log(price(:,i)));%��
end
results=zeros(N,1);
for i=1:N
    results(i,1)=-prctile(r(:,i),1-confidence); %�ٷ�λ��
end
end