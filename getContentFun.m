function [ Astart,Aend,Anum,Bstart,Bend,Bnum ] = getContentFun( textStr )
%getTableFun �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%A���ʽ������ֹλ��
%��#��ͷ��������#��;����;��β
[Astart, Aend] = regexp(textStr,'#[^#;]*;');
%B���ʽ������ֹλ��
%��*��ͷ��������*��;����;��β
[Bstart, Bend] = regexp(textStr,'\*[^\*;]*;');
%A������
Anum = length(Astart);
%B������
Bnum = length(Bstart);

end

