function [ textStr ] = deleteBlankFun( textStr )
%deleteBlankFun 删除字符串中的空白符：空格、换行符等
%   此处显示详细说明

%标记空白位置,并赋值为空
textStr(isspace(textStr)) = [];

end