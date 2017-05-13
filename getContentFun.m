function [ Astart,Aend,Anum,Bstart,Bend,Bnum ] = getContentFun( textStr )
%getTableFun 此处显示有关此函数的摘要
%   此处显示详细说明

%A表格式数据起止位置
%以#开头，不含有#和;，以;结尾
[Astart, Aend] = regexp(textStr,'#[^#;]*;');
%B表格式数据起止位置
%以*开头，不含有*和;，以;结尾
[Bstart, Bend] = regexp(textStr,'\*[^\*;]*;');
%A表行数
Anum = length(Astart);
%B表行数
Bnum = length(Bstart);

end

