function [ n ] = judgeDFun( textStr,Astart,Anum,Bstart,Bnum,data )
%judgeRowFun #号个数和A表行数要相同，*号个数和B表行数要相同.
%   n：错误指标，1表示有错，0表示无错

n = 0 ;

%寻找所有#
jing = strfind(textStr,'#');

%寻找所有*
xing = strfind(textStr,'*');

if size(jing,2) ~= Anum || size(xing,2) ~= Bnum
    n = 1;
    %对A表：取其交集
    Asame = intersect(Astart,jing);
    %寻找不同
    Adif1 = setdiff(jing,Asame);
    Adif2 = setdiff(Astart,Asame);
    if isempty(Adif1) == 1 && isempty(Adif2) == 0
        for d1 = 1:size(Adif2)
            fprintf('错误!#号个数为：%d和A表行数为：%d 错误数据如下：%s  %s\n\n',size(jing,2),Anum,data,textStr(Adif2(d1):Adif2(d1)+15));
        end
    elseif isempty(Adif1) == 0 &&isempty(Adif2) == 1
        for d1 = 1:size(Adif1)
            fprintf('错误!#号个数为：%d和A表行数为：%d 错误数据如下：%s  %s\n\n',size(jing,2),Anum,data,textStr(Adif1(d1):Adif1(d1)+15));
        end
    end
    
    %对B表:取其交集
    Bsame = intersect(Bstart,xing);
    %寻找不同
    Bdif1 = setdiff(xing,Bsame);
    Bdif2 = setdiff(Bstart,Bsame);
    if isempty(Bdif1) == 1 && isempty(Bdif2) == 0
        for d2 = 1:size(Bdif2)
            fprintf('错误!*号个数为：%d和B表行数为：%d 错误数据如下：%s  %s\n\n',size(xing,2),Bnum,data,textStr(Bdif2(d2):Bdif2(d2)+15));
        end
    elseif isempty(Bdif1) == 0 && isempty(Bdif2) == 1
        for d2 = 1:size(Bdif1)
            fprintf('错误!*号个数为：%d和B表行数为：%d 错误数据如下：%s  %s\n\n',size(xing,2),Bnum,data,textStr(Bdif1(d2):Bdif1(d2)+15));
        end
    end
end

end

