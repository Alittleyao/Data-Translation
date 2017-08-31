function [ b ] = checkBtabFun( Bdata )
%checkBtabFun ���B�������ʽ
%   �˴���ʾ��ϸ˵��

[Brow,~] = size(Bdata);

for i = 1:Brow
   date = int2str(Bdata(i,1));
%    sorder = Bdata(i,2)
%    latitude = Bdata(i,3);
%    longitude = Bdata(i,4);
%    type = Bdata(i,5);
%    a = Bdata(i,6);
%    apie = Bdata(i,7);
%    r = Bdata(i,8);
%    snum = Bdata(i,9);
   
   %�ж��Ƿ�Ϊ����
   [ k1 ] = checkInt( Bdata(i,1) );
   [ k2 ] = checkInt( Bdata(i,2) );
   [ k8 ] = checkInt( Bdata(i,8) );
   [ k9 ] = checkInt( Bdata(i,9) );
   
    %�ж�����
    if k1 == 0 || length(date) ~= 8 || str2num(date(1:4))<1957 ||  str2num(date(1:4))>2015 ...
       || str2num(date(5:6))<1 || str2num(date(5:6))>12 || str2num(date(7:8))<1 || str2num(date(7:8))>31
         a = 1;
         fprintf('���󣡴������;%d   ��һ�����ݣ����ڣ������������£�%d\n\n',Bdata(i,1),Bdata(i,1));
    end
    
    %�жϺ��Ӻš��뾶��������
    if k2 == 0 || k8 == 0 || k9 == 0
        b =1;
        fprintf('���󣡴�����ݣ�%d  ������Ӻţ�%d  ��2/8/9�����ݴ���\n\n',Bdata(i,1),Bdata(i,2));
    end

end
end

