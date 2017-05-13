function [ str ] = completeK2Fun( textstr,Astart,Aend,mark )
% completeK2Fun 用‘,?’补全K2的值
% 输入：textstr：原数据字符串；Astart、Aend：A表起止位置；mark：需要补全的A表序号
% 输出：补全后的cell

if isempty(mark) == 1
    str = cell(1,1);
    str{1} = textstr;
elseif mark(1) == 1
    str = cell(size(mark,2),1);
    for i = 1:size(mark,2)
        if i == size(mark,2)
            str{i} = [textstr(Astart(mark(i)):Aend(mark(i))-1),',?',textstr(Aend(mark(i)):end)];
        else
            str{i} = [textstr(Astart(mark(i)):Aend(mark(i))-1),',?',textstr(Aend(mark(i)):Astart(mark(i+1))-1)];
        end
    end
else
    str = cell(size(mark,2),1);
    for i = 1:size(mark,2)
        if i == 1
            str{i} = [textstr(1:Aend(mark(i))-1),',?',textstr(Aend(mark(i)):Astart(mark(i+1))-1)];
        elseif i == size(mark,2)
            str{i} = [textstr(Astart(mark(i)):Aend(mark(i))-1),',?',textstr(Aend(mark(i)):end)];
        else
            str{i} = [textstr(Astart(mark(i)):Aend(mark(i))-1),',?',textstr(Aend(mark(i)):Astart(mark(i+1))-1)];
        end
    end
end



