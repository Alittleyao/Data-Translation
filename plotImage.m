%�ļ�·��
filePath = 'E:/sunspots/Data/����ʽ/ȫ������/';
%��ȡ�ļ�
fileName = ls([filePath,'*.csv']);

%�ֱ��ȡA��B�����Ϣ
Adata = importAtabFun([filePath,fileName(1,:)]);
Bdata = importBtabFun([filePath,fileName(2,:)]);

%��ͼʱx�������λ��
ticks_x = zeros(1,ceil((2015-1955)/5)+1);
%��ͼʱx����������
labels_x = cell(1,ceil((2015-1955)/5)+1);
for y = 1:size(ticks_x,2)
    date = 19550101+50000*(y-1);
    [ ticks_x(y) ] = dateTranFun( date );
    labels_x{y} = int2str(1955+(y-1)*5);
end


%��ȡA����������ͼ����Ϣ
tempA1 = Adata(:,[2,10:18]);
dateListA = zeros(size(tempA1,1),1);
for j = 1:size(tempA1,1)
    %������ת��Ϊ����Ϊ��λ������
    dateListA(j) = dateTranFun(tempA1(j,1));
end
tempA1(:,1) = dateListA;

figure;
plot(tempA1(:,1),tempA1(:,4),'k');
% title('̫������Ⱥ�����仯ͼ');
xlabel('Year');
ylabel('Number of Sunspots Group');
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
xlim([1,21916])
ylim([0,25])
set(gca,'Fontsize',28)

figure;
plot(tempA1(:,1),tempA1(:,7),'k');
% title('̫�����Ӹ����仯ͼ');
xlabel('Year');
ylabel('Sunspot Number');
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
xlim([1,21916])
ylim([0,400])
set(gca,'Fontsize',28)

figure;
plot(tempA1(:,1),tempA1(:,10),'k');
% title('�ַ��������̫�����Ӹ������仯ͼ');
xlabel('Year');
ylabel('Wolf Number');
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
xlim([1,21916])
ylim([0,600])
set(gca,'Fontsize',28)

%�ϱ�����̫������Ⱥ�ĸ���������Ϊ��λ��
tempA2 = Adata(:,[2,10:11]);
date = int2str(tempA2(:,1));
dateNew = unique(date(:,1:6),'rows');
northS = zeros(size(dateNew,1),1);
sorthS = zeros(size(dateNew,1),1);
k = 1;
northS(k) = tempA2(1,2);
sorthS(k) = tempA2(1,3);
for i = 2:size(date,1)
   if date(i,1:6) == date(i-1,1:6) 
       northS(k) = northS(k)+tempA2(i,2);
       sorthS(k) = sorthS(k)+tempA2(i,3);
   else
       k = k+1;
       northS(k) = northS(k)+tempA2(i,2);
       sorthS(k) = sorthS(k)+tempA2(i,3);
   end
end
%���·�Ϊ��λ������ת��
number = zeros(size(dateNew,1),1);
for i = 1:size(dateNew,1)
    year = str2num(dateNew(i,1:4));
    month = str2num(dateNew(i,5:6));
    if year == 1955
        number(i) = number(i)+month;
    else
        number(i) = 12*(year-1955)+month;
    end
end
figure;
plot(number,northS-sorthS,'k')


%��ȡB����������ͼ����Ϣ
%�������
tempB = Bdata(:,[1,6:7]);
%��ͬһ��ĺ���Ⱥ���������������ֱ����
col1 = unique(tempB(:,1));
cola = zeros(size(col1));
colap = zeros(size(col1));
% snum = zeros(size(col1));
for i = 1:size(col1,1)
    index2 = find(tempB(:,1)==col1(i));
%     snum(i) = size(index,1);
    cola(i) = sum(tempB(index2,2));
    colap(i) = sum(tempB(index2,3));
end

dateListB1 = zeros(size(col1,1),1);
for j = 1:size(col1,1)
    %������ת��Ϊ����Ϊ��λ������
    dateListB1(j) = dateTranFun(col1(j));
end

%��λת��
cola = cola*1000000/(pi*87);
colap = colap*1000000/(pi*87);

%������ݺ������
figure;
plot(dateListB1,cola,'k');
% title('Sunspot Area');
xlabel('Year');
ylabel({'Sunspot Area';' (millionth of solar hemisphere)'});
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
xlim([1,21916])
ylim([0,900000])
set(gca,'Fontsize',28)

%1993��3�� ��������������ӵ����
figure;
plot(dateListB1(9760:9790),cola(9760:9790),'o','MarkerEdgeColor','r','MarkerSize',18)
hold on
plot(dateListB1(9760:9790),colap(9760:9790),'*','MarkerEdgeColor','c','MarkerSize',18)
hold off
xlabel('Time(Days)')
ylabel({'Sunspot Area';' (millionth of solar hemisphere)'})
legend('Total area of daily all groups of sunspots','Total area of daily the largest sunspots')
ax = gca;
ax.XTick = [13940,13944:5:13964,13970];
ax.XTickLabel = {'1993-03-01','03-05','03-10','03-15','03-20','03-25','03-31'};
xlim([13939,13971])
ylim([0,300000])
set(gca,'Fontsize',28)

%����ͼ(γ��)
coldate = Bdata(:,1);
colL = Bdata(:,3);
wrong = [];
%ɾ��1982��6�µ�1982��8�µ�����
for i = 1:size(coldate,1)
   if coldate(i)>19820531 && coldate(i)<19820901
       wrong = [wrong,i];
   end
end
coldate(wrong) = [];
colL(wrong) = [];

dateListB2 = zeros(size(coldate,1),1);
for j = 1:size(coldate,1)
    %������ת��Ϊ����Ϊ��λ������
    dateListB2(j) = dateTranFun(coldate(j));
end

%��ͼʱy�������λ��
ticks_y = -40:20:40;
%��ͼʱy����������
labels_y = -40:20:40;

figure;
plot(dateListB2,colL,'+','MarkerEdgeColor','k','MarkerFaceColor','k')
xlabel('Year');
ylabel('Latitude[deg]');
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
ax.YTick = ticks_y;
ax.YTickLabel = labels_y;
xlim([1,21916])
ylim([-50,50])
set(gca,'Fontsize',28)

