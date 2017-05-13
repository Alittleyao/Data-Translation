function [ s ] = checkSunspotNumFun( Adata,Bdata )
%checkSunspotNumFun ���A��B��ĺ������Ƿ����
%   Adata��A�����ݣ�Bdata��B�����ݣ�
%   0��ʾ�޴�1��ʾ�д�

s = 0;

%��ȡA���м�¼�ĺ�����
% sunspotNumA = Adata(:,[2,15]);
sunspotNumA = [Adata(:,2),Adata(:,12)+Adata(:,13)];

%%����B�еĺ�����
%��ȡ������Ϣ
date = Bdata(:,1);
%ȡ�����в��ظ�������
date2 = unique(date);
%ͳ�Ƹ������ڳ��ֵĴ���
num = [date2,histc(date,date2)];
%��ȡB����ÿ������Ⱥ�к��Ӹ�������Ϣ
sunspot = Bdata(:,9);

sunspotNumB = zeros(size(num,1),2);
for i= 1:size(num,1)
    sunspotNumB(i,1) = num(i,1);
    if i == 1
        sunspotNumB(i,2) = sum(sunspot(1:num(i,2)));
    else
        sunspotNumB(i,2) = sum(sunspot((sum(num(1:i-1,2)))+1:sum(num(1:i,2))));
    end
end


%�Ƚ�
%��ͬ���ڣ�A��B��������Ƿ���ͬ
for j = 1:size(sunspotNumB,1)
    k = sunspotNumA(:,1) == sunspotNumB(j,1);
    if sunspotNumA(k,2) ~= sunspotNumB(j,2) && ~isnan(sunspotNumA(k,2)) && ~isnan(sunspotNumB(j,2))
        s = 1;
        fprintf('��������Ϊ��%d-%d��A���к�����Ϊ��%d��B���к�����Ϊ��%d\n\n', sunspotNumA(k,1), sunspotNumB(j,1),sunspotNumA(k,2),sunspotNumB(j,2))
    end
end

%ֻ��A����ڵ����ڣ������������Ƿ�Ϊ0
diff = setdiff(sunspotNumA(:,1),sunspotNumB(:,1));
for k = 1:size(diff,1)
   temp = sunspotNumA(sunspotNumA(:,1)==diff(k),2);
   if temp ~= 0 && ~isnan(temp)
      fprintf('��������Ϊ��%d��ֻ��A���к�������Ϣ����Ϊ��%d\n\n',diff(k),temp); 
   end
end

end

