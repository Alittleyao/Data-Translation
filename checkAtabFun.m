function [ a ] = checkAtabFun( Adata )
%checkAtab ���A�������ʽ
%   �˴���ʾ��ϸ˵��

% savePath = 'E:/sunspots/Data/���ݴ���';

[Arow,~] = size(Adata);

% WfileID = fopen([savePath,'/','wrong.txt'],'w');

for i = 1:Arow
    num = Adata(i,1);
    date =  int2str(Adata(i,2));
    btime = int2str(Adata(i,3));
    wtime = int2str(Adata(i,4));
%     gN = Adata(i,10);
%     gS = Adata(i,11);
%     fN = Adata(i,12);
%     fS = Adata(i,13);
%     RN = Adata(i,14);
%     RS = Adata(i,15);
%     R = Adata(i,17);
%     Vesibility = Adata(i,18);
    
    %�ж��Ƿ�Ϊ����
    [ k1 ] = checkInt( Adata(i,1) );
    [ k2 ] = checkInt( Adata(i,2) );
    [ k3 ] = checkInt( Adata(i,3) );
    [ k4 ] = checkInt( Adata(i,4) );
    [ k10 ] = checkInt( Adata(i,10) );
    [ k11 ] = checkInt( Adata(i,11) );
    [ k12 ] = checkInt( Adata(i,12) );
    [ k13 ] = checkInt( Adata(i,13) );
    [ k14 ] = checkInt( Adata(i,14) );
    [ k15 ] = checkInt( Adata(i,15) );
    [ k17 ] = checkInt( Adata(i,17) );
    [ k18 ] = checkInt( Adata(i,18) );
    
    %�жϺ��Ӻ�
    if  k1 == 0 || num<1 || num>7000
        a = 1;
        fprintf('���󣡴������;%d   ��һ�����ݣ����Ӻţ������������£�%d\n\n',Adata(i,2),Adata(i,1));
    end
    
    %�ж�����
    if k2 == 0 || length(date) ~= 8 || str2num(date(1:4))<1957 ||  str2num(date(1:4))>2015 ...
       || str2num(date(5:6))<1 || str2num(date(5:6))>12 || str2num(date(7:8))<1 || str2num(date(7:8))>31
         a = 1;
         fprintf('���󣡴������;%d   �ڶ������ݣ����ڣ������������£�%d\n\n',Adata(i,2),Adata(i,2));
    end
    
    %�жϱ���ʱ��
    %��ȫʱ������ǰ��ʡ�Ե�0
    if strcmp(btime,'NaN') == 1
        continue
    else if length(btime) < 4
            for j = length(btime):4-1
                btime = strcat(int2str(0),btime);
            end
        end
    end
    
    if k3 == 0 || length(btime)>4
        fprintf(WfileID,'���󣡴������;%d   ���������ݣ�����ʱ�䣩�����������£�%d\n\n',Adata(i,2),Adata(i,3));
    elseif str2num(btime(1:2))>19 || str2num(btime(1:2))>60
            a = 1;
            fprintf('���󣡴������;%d   ���������ݣ�����ʱ�䣩�����������£�%d\n\n',Adata(i,2),Adata(i,3));
    end
    
    %�ж�����ʱ��
    %��ȫʱ������ǰ��ʡ�Ե�0
    if strcmp(wtime,'NaN') == 1
        continue
    else if length(wtime) < 4
            for j = length(wtime):4-1
                wtime = strcat(int2str(0),wtime);
            end
        end
    end
    
    if k4 == 0 || length(wtime)>4
        fprintf(WfileID,'���󣡴������;%d   ���ĸ����ݣ�����ʱ�䣩�����������£�%d\n\n',Adata(i,2),Adata(i,4));
    elseif str2num(wtime(1:2))>11 || str2num(wtime(1:2))>60
        a = 1;
        fprintf('���󣡴������;%d   ���ĸ����ݣ�����ʱ�䣩�����������£�%d\n\n',Adata(i,2),Adata(i,4));
    end
    
    %�ж�gN��gS��fN��fS��RN��RS��R��Vesibility
    if k10 == 0 || k11 == 0 || k12 == 0 || k13 == 0 || k14 == 0 || k15 == 0 || k17 == 0 || k18 == 0
        a = 1;
        fprintf('���󣡴�����ݣ�%d   ��10-15/17-18�����ݴ���\n\n',Adata(i,2));
    end
    
    if i>1 && abs(Adata(i,6)-Adata(i-1,6))>1 && (abs(Adata(i,2)-Adata(i-1,2))<3 || abs(Adata(i,6)-Adata(i-1,6))>abs(Adata(i,2)-Adata(i-1,2))*0.5)
        fprintf('���󣡴�����ݣ�%d  Pֵ����6�����ݣ�����:%d\n\n',Adata(i,2),Adata(i,6))
    end
    
    if i>1 && abs(Adata(i,7)-Adata(i-1,7))>1 && (abs(Adata(i,2)-Adata(i-1,2))<3 || abs(Adata(i,7)-Adata(i-1,7))>abs(Adata(i,2)-Adata(i-1,2))*0.3)
        fprintf('���󣡴�����ݣ�%d  Boֵ����7�����ݣ�����:%d\n\n',Adata(i,2),Adata(i,7))
    end
    
    
end 

% fclose(WfileID);

end

