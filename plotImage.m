%文件路径
filePath = 'E:/sunspots/Data/表格格式/全部数据/';
%读取文件
fileName = ls([filePath,'*.csv']);

%分别读取A、B表格信息
Adata = importAtabFun([filePath,fileName(1,:)]);
Bdata = importBtabFun([filePath,fileName(2,:)]);

%画图时x轴坐标的位置
ticks_x = zeros(1,ceil((2015-1955)/5)+1);
%画图时x轴坐标内容
labels_x = cell(1,ceil((2015-1955)/5)+1);
for y = 1:size(ticks_x,2)
    date = 19550101+50000*(y-1);
    [ ticks_x(y) ] = dateTranFun( date );
    labels_x{y} = int2str(1955+(y-1)*5);
end


%提取A表中用来画图的信息
tempA1 = Adata(:,[2,10:18]);
dateListA = zeros(size(tempA1,1),1);
for j = 1:size(tempA1,1)
    %将日期转换为以天为单位的序列
    dateListA(j) = dateTranFun(tempA1(j,1));
end
tempA1(:,1) = dateListA;

figure;
plot(tempA1(:,1),tempA1(:,4),'k');
% title('太阳黑子群个数变化图');
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
% title('太阳黑子个数变化图');
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
% title('沃夫数（相对太阳黑子个数）变化图');
xlabel('Year');
ylabel('Wolf Number');
ax = gca;
ax.XTick = ticks_x;
ax.XTickLabel = labels_x;
xlim([1,21916])
ylim([0,600])
set(gca,'Fontsize',28)

%南北半球太阳黑子群的个数（以月为单位）
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
%以月份为单位的坐标转换
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


%提取B表中用来画图的信息
%黑子面积
tempB = Bdata(:,[1,6:7]);
%将同一天的黑子群面积和最大黑子面积分别相加
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
    %将日期转换为以天为单位的序列
    dateListB1(j) = dateTranFun(col1(j));
end

%单位转换
cola = cola*1000000/(pi*87);
colap = colap*1000000/(pi*87);

%所有年份黑子面积
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

%1993年3月 黑子面积、最大黑子的面积
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

%蝴蝶图(纬度)
coldate = Bdata(:,1);
colL = Bdata(:,3);
wrong = [];
%删除1982年6月到1982年8月的数据
for i = 1:size(coldate,1)
   if coldate(i)>19820531 && coldate(i)<19820901
       wrong = [wrong,i];
   end
end
coldate(wrong) = [];
colL(wrong) = [];

dateListB2 = zeros(size(coldate,1),1);
for j = 1:size(coldate,1)
    %将日期转换为以天为单位的序列
    dateListB2(j) = dateTranFun(coldate(j));
end

%画图时y轴坐标的位置
ticks_y = -40:20:40;
%画图时y轴坐标内容
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

