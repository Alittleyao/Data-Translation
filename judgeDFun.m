function [ n ] = judgeDFun( textStr,Astart,Anum,Bstart,Bnum,data )
%judgeRowFun #�Ÿ�����A������Ҫ��ͬ��*�Ÿ�����B������Ҫ��ͬ.
%   n������ָ�꣬1��ʾ�д�0��ʾ�޴�

n = 0 ;

%Ѱ������#
jing = strfind(textStr,'#');

%Ѱ������*
xing = strfind(textStr,'*');

if size(jing,2) ~= Anum || size(xing,2) ~= Bnum
    n = 1;
    %��A��ȡ�佻��
    Asame = intersect(Astart,jing);
    %Ѱ�Ҳ�ͬ
    Adif1 = setdiff(jing,Asame);
    Adif2 = setdiff(Astart,Asame);
    if isempty(Adif1) == 1 && isempty(Adif2) == 0
        for d1 = 1:size(Adif2)
            fprintf('����!#�Ÿ���Ϊ��%d��A������Ϊ��%d �����������£�%s  %s\n\n',size(jing,2),Anum,data,textStr(Adif2(d1):Adif2(d1)+15));
        end
    elseif isempty(Adif1) == 0 &&isempty(Adif2) == 1
        for d1 = 1:size(Adif1)
            fprintf('����!#�Ÿ���Ϊ��%d��A������Ϊ��%d �����������£�%s  %s\n\n',size(jing,2),Anum,data,textStr(Adif1(d1):Adif1(d1)+15));
        end
    end
    
    %��B��:ȡ�佻��
    Bsame = intersect(Bstart,xing);
    %Ѱ�Ҳ�ͬ
    Bdif1 = setdiff(xing,Bsame);
    Bdif2 = setdiff(Bstart,Bsame);
    if isempty(Bdif1) == 1 && isempty(Bdif2) == 0
        for d2 = 1:size(Bdif2)
            fprintf('����!*�Ÿ���Ϊ��%d��B������Ϊ��%d �����������£�%s  %s\n\n',size(xing,2),Bnum,data,textStr(Bdif2(d2):Bdif2(d2)+15));
        end
    elseif isempty(Bdif1) == 0 && isempty(Bdif2) == 1
        for d2 = 1:size(Bdif1)
            fprintf('����!*�Ÿ���Ϊ��%d��B������Ϊ��%d �����������£�%s  %s\n\n',size(xing,2),Bnum,data,textStr(Bdif1(d2):Bdif1(d2)+15));
        end
    end
end

end

