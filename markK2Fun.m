function [ mark,Astart,Aend ] = markK2Fun( textstr )
%Ѱ����Ҫ��ȫk2ֵ��A������
% ���룺textStr;�����ַ���
% �����mark:��Ҫ��ȫK2ֵ��A��������Astart��Aend��A����ֹλ��

%A��������ֹλ��
[Astart,Aend] = regexp(textstr,'#[^#;^]*;');
%A����������
Anum = length(Astart);
%�½��յ�cell���洢A������
AdataStr = cell(Anum,1);
%�½�����洢��Ҫ��ȫk2ֵ��A������
mark = [];

for i = 1:Anum
    AdataStr{i} = textstr(Astart(i):Aend(i));
    %Ѱ��ÿ�������еĶ���λ��
    dou = strfind(AdataStr{i},',');
    %��A����ĳ�е�����Ϊ17ʱ����Ǹ�����
    if length(dou) == 17
        mark = [mark,i];
    end
end

end

