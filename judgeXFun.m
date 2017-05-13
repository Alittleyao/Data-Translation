function [ k ] = judgeXFun( textStr )
%judgeXFun 每天*号的个数要和；号个数相同
%   k：错误指标，1表示有错，0表示无错

k = 0;

%寻找所有#
jing = strfind(textStr,'#');

for i = 1:size(jing,2)-1
   text = textStr(jing(i):jing(i+1)-1);
    
   %寻找*
   xing = strfind(text,'*');
   %寻找;
   fen = strfind(text,';');
   %寻找,
   dou = strfind(text,',');
   %获取对应的文档日期信息
   date = text(dou(1)+1:dou(2)-1);
   
   if size(xing,2) ~= size(fen,2)-1
       k = 1;
       fprintf('错误！*号个数为：%d，而；号个数为：%d  错误日期如下：%s\n\n',size(xing,2),size(fen,2)-1,date);
   end
end



