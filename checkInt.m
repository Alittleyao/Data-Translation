function [ y ] = checkInt( data )
%checkInt �ж�ĳ�����Ƿ�Ϊ����
%   ��Ϊ������yΪ1������yΪ0

%ԭ����ȡ�������Ĳ�ľ���ֵ
if abs(data - round(data)) > 1e-10
    y = 0;
elseif isempty(data) == 1
    y = 1;
else
    y = 1;
end

