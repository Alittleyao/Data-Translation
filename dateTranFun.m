function [ number ] = dateTranFun( date)
%dateTranFun 以天为单位，根据日期判断与起始日期1981年1月1日的距离
%   date：实际日期
dateStr = num2str(date);
year = str2num(dateStr(1:4));
month = str2num(dateStr(5:6));
day = str2num(dateStr(7:8));
monthDay = [31 28 31 30 31 30 31 31 30 31 30 31];
number = 0;

%起始年份为1981年
if year == 1981
    [ number ] = judgeYearFun ( year,month,day );
else
    for i = 1981:year
        %当年年份
        if i == year 
           [ number2 ] = judgeYearFun ( year,month,day );
           number = number + number2;
        else
            %中间年份
            %润年
            if (mod(i,4)==0 && mod(i,100)~=0 || mod(i,400)==0)
                number = number + 366;
            else 
                %平年
                number = number + 365;
            end
        end
    end
end

end

