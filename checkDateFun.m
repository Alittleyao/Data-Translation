function [ d ] = checkDateFun( Adata )
%UNTITLED �ظ����ڼ��
%   Adata��A�����ݣ�Date������
%   1��ʾ�д�0��ʾ�޴�

d = 0;

%��ȡ������Ϣ
Date = Adata(:,2);

%ȡ�����в��ظ�������
Date2 = unique(Date);

%ͳ�Ƹ������ڳ��ֵĴ���
n = histc(Date,Date2);

temp = [Date2,n];

%����ظ������ڼ��ظ��Ĵ���
for i = 1:size(temp,1)
    if temp(i,2) >= 2
        d = 1;
        fprintf('�ظ�����Ϊ��%d���ظ�����Ϊ%d\n\n',temp(i,1),temp(i,2));
    end
end

%�ж������Ƿ�Ϊʱ������
for j = 2:size(Adata,1)
    if Adata(j,2) - Adata(j-1,2) < 0
        fprintf('���ڴ���Ϊ��%d\n\n',Adata(j,2))
    end
end

end

