function [VaR]=VaR(price,w,confidence)
%����Ŀ�ģ�����Ͷ����ϵ�VaR
%����1��price Ͷ������ʲ��ļ۸����  M*N����N���ʲ���M���۲�ֵ��
%����2��w Ͷ������и����ʲ���Ȩ������ ������ N*1����
%����3��confidence ����ˮƽ
%����� VaR �ʲ���VaR
%��һ���������������ʾ���
[M,N]=size(price);
r=zeros(M-1,N);
for i=1:N
r(:,i)=diff(log(price(:,i)));
end
%�ڶ����������������ʵľ�ֵ�뷽��
mu=w'*mean(r,1)';%mu   Ͷ������ʲ������ʵľ�ֵ
cov_matrix=cov(r);%cov_matrix   Ͷ������ʲ������ʵķ���Э�������
sigma=sqrt(w'*cov_matrix*w);%sigma Ͷ����������ʵı�׼��
%������������̬�ֲ��ļ��������VaR
alpha=1-confidence;
VaR=-(mu+norminv(alpha,0,1)*sigma);
VaR=max(VaR,0);
end


