function [ textStr ] = deleteBlankFun( textStr )
%deleteBlankFun ɾ���ַ����еĿհ׷����ո񡢻��з���
%   �˴���ʾ��ϸ˵��

%��ǿհ�λ��,����ֵΪ��
textStr(isspace(textStr)) = [];

end