function [ k ] = judgeXFun( textStr )
%judgeXFun ÿ��*�ŵĸ���Ҫ�ͣ��Ÿ�����ͬ
%   k������ָ�꣬1��ʾ�д�0��ʾ�޴�

k = 0;

%Ѱ������#
jing = strfind(textStr,'#');

for i = 1:size(jing,2)-1
   text = textStr(jing(i):jing(i+1)-1);
    
   %Ѱ��*
   xing = strfind(text,'*');
   %Ѱ��;
   fen = strfind(text,';');
   %Ѱ��,
   dou = strfind(text,',');
   %��ȡ��Ӧ���ĵ�������Ϣ
   date = text(dou(1)+1:dou(2)-1);
   
   if size(xing,2) ~= size(fen,2)-1
       k = 1;
       fprintf('����*�Ÿ���Ϊ��%d�������Ÿ���Ϊ��%d  �����������£�%s\n\n',size(xing,2),size(fen,2)-1,date);
   end
end



