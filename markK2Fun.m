function [ mark,Astart,Aend ] = markK2Fun( textstr )
%寻找需要补全k2值的A表行数
% 输入：textStr;数据字符串
% 输出：mark:需要补全K2值的A表行数；Astart、Aend：A表起止位置

%A表数据起止位置
[Astart,Aend] = regexp(textstr,'#[^#;^]*;');
%A表数据行数
Anum = length(Astart);
%新建空的cell，存储A表数据
AdataStr = cell(Anum,1);
%新建矩阵存储需要补全k2值的A表行数
mark = [];

for i = 1:Anum
    AdataStr{i} = textstr(Astart(i):Aend(i));
    %寻找每行数据中的逗号位置
    dou = strfind(AdataStr{i},',');
    %当A表中某行的数据为17时，标记该行数
    if length(dou) == 17
        mark = [mark,i];
    end
end

end

