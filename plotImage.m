%�ļ�·��
filePath = 'E:/sunspots/Data/excel��ʽ/�ۺ�/';
%��ȡ�ļ�
fileName = ls([filePath,'*.csv']);

%�ֱ��ȡA��B�����Ϣ
Adata = importAtabFun([filePath,fileName(1,:)]);
Bdata = importBtabFun([filePath,fileName(2,:)]);

%��ȡA����������ͼ����Ϣ
tempA = Adata(:,[2,10:15]);
dateListA = zeros(size(tempA,1),1);
for j = 1:size(tempA,1)
    %������ת��Ϊ����Ϊ��λ������
    dateListA(j) = dateTranFun(tempA(j,1));
end
tempA(:,1) = dateListA;

%��ͼʱx�������λ��
ticks = zeros(1,round((2015-1981+1)/2));
%��ͼʱx����������
labels = cell(1,round((2015-1981+1)/2));
for y = 1:size(ticks,2)
    date = 19810615+20000*(y-1);
    [ ticks(y) ] = dateTranFun( date );
    labels{y} = int2str(1981+(y-1)*2);
end

figure;
plot(tempA(:,1),tempA(:,2) + tempA(:,3),'*');
title('̫������Ⱥ�����仯ͼ');
xlabel('���');
ylabel('����Ⱥ����');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(tempA(:,1),tempA(:,4) + tempA(:,5),'*');
title('̫�����Ӹ����仯ͼ');
xlabel('���');
ylabel('���Ӹ���');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(tempA(:,1),tempA(:,6) + tempA(:,7),'*');
title('�ַ��������̫�����Ӹ������仯ͼ');
xlabel('���');
ylabel('�ַ��������̫�����Ӹ�����');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;




%��ȡB����������ͼ����Ϣ
tempB = Bdata(:,[1,6:7]);
%��ͬһ��ı�Ӱ�Ͱ�Ӱ������
col1 = unique(tempB(:,1));
cola = zeros(size(col1));
colap = zeros(size(col1));
for i = 1:size(col1,1)
    index = find(tempB(:,1)==col1(i));
    cola(i) = sum(tempB(index,2));
    colap(i) = sum(tempB(index,3));
end

dateListB = zeros(size(col1,1),1);
for j = 1:size(col1,1)
    %������ת��Ϊ����Ϊ��λ������
    dateListB(j) = dateTranFun(col1(j));
end

figure;
plot(dateListB,cola,'*');
title('̫�����ӱ�Ӱ����仯ͼ');
xlabel('���');
ylabel('̫�����ӱ�Ӱ���');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(dateListB,colap,'*');
title('̫�����Ӱ�Ӱ����仯ͼ');
xlabel('���');
ylabel('̫�����Ӱ�Ӱ���');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(dateListB,cola./colap,'*');
title('̫�����ӱ�Ӱ����Ӱ�����ֵͼ');
xlabel('���');
ylabel('̫�����ӱ�Ӱ���/��Ӱ���');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;