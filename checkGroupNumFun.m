function [ g ] = checkGroupNumFun( Adata,Bdata )
%checkGroupNumFun ���A��B��ĺ���Ⱥ�����Ƿ����
%   Adata��A�����ݣ�Bdata��B�����ݣ�
%   0��ʾ�޴�1��ʾ�д�

g = 0;

%��ȡA���м�¼�ĸ�����Ⱥ�ĸ���
% groupNumA = Adata(:,[2,12]);
groupNumA = [Adata(:,2),Adata(:,10)+Adata(:,11)];


%����B���и�����Ⱥ�ĸ���
%��ȡ������Ϣ
date = Bdata(:,1);
%ȡ�����в��ظ�������
date2 = unique(date);
%ͳ�Ƹ������ڳ��ֵĴ���
groupNumB = [date2,histc(date,date2)];


%�Ƚ�
%��ͬ���ڣ�A��B�����Ⱥ�����Ƿ���ͬ
for i = 1:size(groupNumB,1)
    k = groupNumA(:,1) == groupNumB(i,1);
    
    if groupNumA(k,2) ~= groupNumB(i,2) && ~isnan(groupNumA(k,2)) && ~isnan(groupNumB(i,2))
        g = 1;
        fprintf('��������Ϊ��%d-%d��A���к���Ⱥ�ĸ���Ϊ��%d��B���к���Ⱥ�ĸ���Ϊ��%d\n\n',groupNumA(k,1),groupNumB(i,1),groupNumA(k,2),groupNumB(i,2))
    end
   
end

%ֻ��A����ڵ����ڣ�����Ⱥ�����Ƿ�Ϊ0
diff = setdiff(groupNumA(:,1),groupNumB(:,1));
for j = 1:size(diff,1)
    temp = groupNumA(groupNumA(:,1)==diff(j),2);
   if  temp~= 0 && ~isnan(temp)
       fprintf('��������Ϊ��%d��ֻ��A���к���Ⱥ������Ϣ����Ϊ��%d\n\n',diff(j),temp);
   end
end

end