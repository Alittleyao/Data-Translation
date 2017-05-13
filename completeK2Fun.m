function [ str ] = completeK2Fun( textstr,Astart,Aend,mark )
% completeK2Fun �á�,?����ȫK2��ֵ
% ���룺textstr��ԭ�����ַ�����Astart��Aend��A����ֹλ�ã�mark����Ҫ��ȫ��A�����
% �������ȫ���cell

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



