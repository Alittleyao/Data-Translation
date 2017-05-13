function [ y ] = checkInt( data )
%checkInt 判断某个数是否为整数
%   若为整数，y为1；否则，y为0

%原数与取整后数的差的绝对值
if abs(data - round(data)) > 1e-10
    y = 0;
elseif isempty(data) == 1
    y = 1;
else
    y = 1;
end

