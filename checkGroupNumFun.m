function [ g ] = checkGroupNumFun( Adata,Bdata )
%checkGroupNumFun 检测A、B表的黑子群个数是否相等
%   Adata：A表数据；Bdata：B表数据；
%   0表示无错，1表示有错

g = 0;

%提取A表中记录的各黑子群的个数
% groupNumA = Adata(:,[2,12]);
groupNumA = [Adata(:,2),Adata(:,10)+Adata(:,11)];


%计算B表中各黑子群的个数
%提取日期信息
date = Bdata(:,1);
%取得所有不重复的日期
date2 = unique(date);
%统计各个日期出现的次数
groupNumB = [date2,histc(date,date2)];


%比较
%相同日期，A、B表黑子群个数是否相同
for i = 1:size(groupNumB,1)
    k = groupNumA(:,1) == groupNumB(i,1);
    
    if groupNumA(k,2) ~= groupNumB(i,2) && ~isnan(groupNumA(k,2)) && ~isnan(groupNumB(i,2))
        g = 1;
        fprintf('错误日期为：%d-%d，A表中黑子群的个数为：%d，B表中黑子群的个数为：%d\n\n',groupNumA(k,1),groupNumB(i,1),groupNumA(k,2),groupNumB(i,2))
    end
   
end

%只有A表存在的日期，黑子群个数是否为0
diff = setdiff(groupNumA(:,1),groupNumB(:,1));
for j = 1:size(diff,1)
    temp = groupNumA(groupNumA(:,1)==diff(j),2);
   if  temp~= 0 && ~isnan(temp)
       fprintf('错误日期为：%d，只有A表有黑子群个数信息，且为：%d\n\n',diff(j),temp);
   end
end

end