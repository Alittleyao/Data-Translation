function [ s ] = checkSunspotNumFun( Adata,Bdata )
%checkSunspotNumFun 检测A、B表的黑子数是否相等
%   Adata：A表数据；Bdata：B表数据；
%   0表示无错，1表示有错

s = 0;

%提取A表中记录的黑子数
% sunspotNumA = Adata(:,[2,15]);
sunspotNumA = [Adata(:,2),Adata(:,12)+Adata(:,13)];

%%计算B中的黑子数
%提取日期信息
date = Bdata(:,1);
%取得所有不重复的日期
date2 = unique(date);
%统计各个日期出现的次数
num = [date2,histc(date,date2)];
%提取B表中每个黑子群中黑子个数的信息
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


%比较
%相同日期，A、B表黑子数是否相同
for j = 1:size(sunspotNumB,1)
    k = sunspotNumA(:,1) == sunspotNumB(j,1);
    if sunspotNumA(k,2) ~= sunspotNumB(j,2) && ~isnan(sunspotNumA(k,2)) && ~isnan(sunspotNumB(j,2))
        s = 1;
        fprintf('错误日期为：%d-%d，A表中黑子数为：%d，B表中黑子数为：%d\n\n', sunspotNumA(k,1), sunspotNumB(j,1),sunspotNumA(k,2),sunspotNumB(j,2))
    end
end

%只有A表存在的日期，黑子数个数是否为0
diff = setdiff(sunspotNumA(:,1),sunspotNumB(:,1));
for k = 1:size(diff,1)
   temp = sunspotNumA(sunspotNumA(:,1)==diff(k),2);
   if temp ~= 0 && ~isnan(temp)
      fprintf('错误日期为：%d，只有A表有黑子数信息，且为：%d\n\n',diff(k),temp); 
   end
end

end

