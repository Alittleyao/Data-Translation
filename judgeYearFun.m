function [ number ] = judgeYearFun ( year,month,day )
%judgeYear ���������ж��Ǵ��ڵ���ĵڼ���
%   �˴���ʾ��ϸ˵��

%����
if(mod(year,4)==0 && mod(year,100)~=0 || mod(year,400)==0)
    monthDay = [31 29 31 30 31 30 31 31 30 31 30 31];
    a = [0,cumsum(monthDay)];
    %a = [0,31,60,91,121,152,182,213,244,274,305,335];
    number = a(month)+day;
else
    %ƽ��
    monthDay = [31 28 31 30 31 30 31 31 30 31 30 31];
    a = [0,cumsum(monthDay)];
    number = a(month)+day;
end

end

