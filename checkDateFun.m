function [ d ] = checkDateFun( Adata )
%UNTITLED 重复日期检测
%   Adata：A表数据；Date：日期
%   1表示有错，0表示无错；

d = 0;

%提取日期信息
Date = Adata(:,2);

%取得所有不重复的日期
Date2 = unique(Date);

%统计各个日期出现的次数
n = histc(Date,Date2);

temp = [Date2,n];

%输出重复的日期及重复的次数
for i = 1:size(temp,1)
    if temp(i,2) >= 2
        d = 1;
        fprintf('重复日期为：%d，重复次数为%d\n\n',temp(i,1),temp(i,2));
    end
end

%判断日期是否为时间序列
for j = 2:size(Adata,1)
    if Adata(j,2) - Adata(j-1,2) < 0
        fprintf('日期错误为：%d\n\n',Adata(j,2))
    end
end

end

