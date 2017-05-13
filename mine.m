year = 1991;
month = 1; 
filetext = fileread(['E:/sunspots/Data/',int2str(year),'/',int2str(month),'.txt']);

% Ѱ������#
jingAll = strfind(filetext,'#');
%Ѱ������*
xingAll = strfind(filetext,'*');
%Ѱ�����У�
fenAll = strfind(filetext,';');

% T1 = table('����','����','����ʱ��','����ʱ��','����',P,B0,L0,L,gN,gS,fN,fS,RN,RS,k,R,Visible,K2);
% T2 = table('����','���Ӻ�','����','γ��','����','��Ӱ���','��Ӱ���','�뾶','������');

%����洢A����Ϣ�ı���
%����,����,����ʱ��,����ʱ��,����,P,B0,L0,L,gN,gS,fN,fS,RN,RS,k,R,Visible,K2
num = zeros(size(jingAll,2),1);
date1 = cell(size(jingAll,2),1);
bTime = cell(size(jingAll,2),1);
wTime = cell(size(jingAll,2),1);
days = zeros(size(jingAll,2),1);
P = zeros(size(jingAll,2),1);
B0 = zeros(size(jingAll,2),1);
L0 = zeros(size(jingAll,2),1);
L = zeros(size(jingAll,2),1);
gN = zeros(size(jingAll,2),1);
gS = zeros(size(jingAll,2),1);
fN = zeros(size(jingAll,2),1);
fS = zeros(size(jingAll,2),1);
RN = zeros(size(jingAll,2),1);
RS = zeros(size(jingAll,2),1);
k = zeros(size(jingAll,2),1);
R = zeros(size(jingAll,2),1);
Visibility = zeros(size(jingAll,2),1);
K2 = zeros(size(jingAll,2),1);

%����洢B����Ϣ�ı���
%����,���Ӻ�,����,γ��,����,��Ӱ���,��Ӱ���,�뾶,������
date2 = cell(size(xingAll,2),1);
sOrder = zeros(size(xingAll,2),1);
longitude = zeros(size(xingAll,2),1);
latitude = zeros(size(xingAll,2),1);
type = cell(size(xingAll,2),1);
uArea = zeros(size(xingAll,2),1);
pArea = zeros(size(xingAll,2),1);
sNum = zeros(size(xingAll,2),1);

%�����ڵ�����#Ϊһ��
for i = 1:size(jingAll,2)
    if i == 1
        % Ѱ�Ҹö�������������#��֮������С�����
        fen = strfind(filetext(jingAll(i):jingAll(i+1)),';');
        
        %%�ж�¼���ʽ�Ƿ���ȷ
        %Ѱ�Ҹö������С�����
        dou = strfind(filetext(jingAll(i):jingAll(i+1)),',');
        if size(dou,2)~= 7*size(fen,2)+18-7
            fprintf('��ʽ���� %s\n',filetext(jingAll(i)+1:jingAll(i)+15));
%             continue
        end
       
        %�ԡ������ŷָ�����ȡ�ö�����#�ſ�ͷ�����е�����
        data1 = strsplit(filetext(jingAll(i)+1:fen(1)-1),',');
        %��A�������ֵ
        num(i) = str2double(data1{1});
        date1{i} = data1{2};
        bTime{i} = data1{3};
        wTime{i} = data1{4};
        days(i) = str2double(data1{5});
        P(i) = str2double(data1{6});
        B0(i) = str2double(data1{7});
        L0(i) = str2double(data1{8});
        L(i) = str2double(data1{9});
        gN(i) = str2double(data1{10});
        gS(i) = str2double(data1{11});
        fN(i) = str2double(data1{12});
        fS(i) = str2double(data1{13});
        RN(i) = str2double(data1{14});
        RS(i) = str2double(data1{15});
        k(i) = str2double(data1{16});
        R(i) = str2double(data1{17});
        Visibility(i) = str2double(data1{18});
        K2(i) = str2double(data1{19});
        
        % Ѱ�Ҹö�������������#��֮������С�*��
        xing = strfind(filetext(jingAll(i):jingAll(i+1)),'*');
        for j = 1:size(xing,2)
            data2 = strsplit(filetext(xing(j)+1:fen(j+1)-1),',');
            %��B�������ֵ
            date2{j} = data1{2};
            sOrder(j) = str2double(data2(1));
            longitude(j) = str2double(data2(2));
            latitude(j) = str2double(data2(3));
            type{j} = str2double(data2(4));
            uArea(j) = str2double(data2(5));
            pArea(j) = str2double(data2(6));
            sNum(j) = str2double(data2(7));
        end
        
    elseif i == size(jingAll,2) 
        % Ѱ�Ҹö�������������#��֮������С�����
        fen = strfind(filetext(jingAll(i):end),';');
        
        %%�ж�¼���ʽ�Ƿ���ȷ
        %Ѱ�Ҹö������С�����
        dou = strfind(filetext(jingAll(i):end),',');
        if size(dou,2)~= 7*size(fen,2)+18-7
            fprintf('��ʽ���� %s\n',filetext(jingAll(i)+1:jingAll(i)+15));
            continue
        end
        
        %�ԡ������ŷָ�����ȡ�����е�����
        data1 = strsplit(filetext(jingAll(i)+1:fen(1)+jingAll(i)-2),',');
        %��A�������ֵ
        num(i) = str2double(data1{1});
        date1{i} = data1{2};
        bTime{i} = data1{3};
        wTime{i} = data1{4};
        days(i) = str2double(data1{5});
        P(i) = str2double(data1{6});
        B0(i) = str2double(data1{7});
        L0(i) = str2double(data1{8});
        L(i) = str2double(data1{9});
        gN(i) = str2double(data1{10});
        gS(i) = str2double(data1{11});
        fN(i) = str2double(data1{12});
        fS(i) = str2double(data1{13});
        RN(i) = str2double(data1{14});
        RS(i) = str2double(data1{15});
        k(i) = str2double(data1{16});
        R(i) = str2double(data1{17});
        Visibility(i) = str2double(data1{18});
        K2(i) = str2double(data1{19});
        
        % Ѱ�Ҹö�������������#��֮������С�*��
        xing = strfind(filetext(jingAll(i):end),'*');
        for j = 1:size(xing,2)
            %�ö��������ַ�����ʵ������λ�õĻ���
            m = strfind(filetext(jingAll(1):jingAll(i)),';');
            n = strfind(filetext(jingAll(1):jingAll(i)),'*');
            data2 = strsplit(filetext(xingAll(size(n,2)+j)+1:fenAll(size(m,2)+j+1)-1),',');
            %��B�������ֵ
            date2{j+size(n,2)} = data1{2};
            sOrder(j+size(n,2)) = str2double(data2(1));
            longitude(j+size(n,2)) = str2double(data2(2));
            latitude(j+size(n,2)) = str2double(data2(3));
            type{j+size(n,2)} = str2double(data2(4));
            uArea(j+size(n,2)) = str2double(data2(5));
            pArea(j+size(n,2)) = str2double(data2(6));
            sNum(j+size(n,2)) = str2double(data2(7));
        end
        
    else
         % Ѱ�Ҹö�������������#��֮������С�����
        fen = strfind(filetext(jingAll(i):jingAll(i+1)),';');
        
        %%�ж�¼���ʽ�Ƿ���ȷ
        %Ѱ�Ҹö������С�����
        dou = strfind(filetext(jingAll(i):jingAll(i+1)),',');
        if size(dou,2)~= 7*size(fen,2)+18-7
            fprintf('��ʽ���� %s\n',filetext(jingAll(i)+1:jingAll(i)+15));
            continue
        end
        
         %�ԡ������ŷָ�����ȡ�����е�����
        data1 = strsplit(filetext(jingAll(i)+1:fen(1)+jingAll(i)-2),',');
        %��A�������ֵ
        num(i) = str2double(data1{1});
        date1{i} = data1{2};
        bTime{i} = data1{3};
        wTime{i} = data1{4};
        days(i) = str2double(data1{5});
        P(i) = str2double(data1{6});
        B0(i) = str2double(data1{7});
        L0(i) = str2double(data1{8});
        L(i) = str2double(data1{9});
        gN(i) = str2double(data1{10});
        gS(i) = str2double(data1{11});
        fN(i) = str2double(data1{12});
        fS(i) = str2double(data1{13});
        RN(i) = str2double(data1{14});
        RS(i) = str2double(data1{15});
        k(i) = str2double(data1{16});
        R(i) = str2double(data1{17});
        Visibility(i) = str2double(data1{18});
        K2(i) = str2double(data1{19});
        
        % Ѱ�Ҹö�������������#��֮������С�*��
        xing = strfind(filetext(jingAll(i):jingAll(i+1)),'*');
        for j = 1:size(xing,2)
            %�ö��������ַ�����ʵ������λ�õĻ���
            m = strfind(filetext(jingAll(1):jingAll(i)),';');
            n = strfind(filetext(jingAll(1):jingAll(i)),'*');
            data2 = strsplit(filetext(xingAll(size(n,2)+j)+1:fenAll(size(m,2)+j+1)-1),',');
            %��B�������ֵ
            date2{j+size(n,2)} = data1{2};
            sOrder(j+size(n,2)) = str2double(data2(1));
            longitude(j+size(n,2)) = str2double(data2(2));
            latitude(j+size(n,2)) = str2double(data2(3));
            type{j+size(n,2)} = str2double(data2(4));
            uArea(j+size(n,2)) = str2double(data2(5));
            pArea(j+size(n,2)) = str2double(data2(6));
            sNum(j+size(n,2)) = str2double(data2(7));
        end
        
    end
    
end
