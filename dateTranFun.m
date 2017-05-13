function [ number ] = dateTranFun( date)
%dateTranFun ����Ϊ��λ�����������ж�����ʼ����1981��1��1�յľ���
%   date��ʵ������
dateStr = num2str(date);
year = str2num(dateStr(1:4));
month = str2num(dateStr(5:6));
day = str2num(dateStr(7:8));
monthDay = [31 28 31 30 31 30 31 31 30 31 30 31];
number = 0;

%��ʼ���Ϊ1981��
if year == 1981
    [ number ] = judgeYearFun ( year,month,day );
else
    for i = 1981:year
        %�������
        if i == year 
           [ number2 ] = judgeYearFun ( year,month,day );
           number = number + number2;
        else
            %�м����
            %����
            if (mod(i,4)==0 && mod(i,100)~=0 || mod(i,400)==0)
                number = number + 366;
            else 
                %ƽ��
                number = number + 365;
            end
        end
    end
end

end

