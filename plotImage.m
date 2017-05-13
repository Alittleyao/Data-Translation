%文件路径
filePath = 'E:/sunspots/Data/excel格式/综合/';
%读取文件
fileName = ls([filePath,'*.csv']);

%分别读取A、B表格信息
Adata = importAtabFun([filePath,fileName(1,:)]);
Bdata = importBtabFun([filePath,fileName(2,:)]);

%提取A表中用来画图的信息
tempA = Adata(:,[2,10:15]);
dateListA = zeros(size(tempA,1),1);
for j = 1:size(tempA,1)
    %将日期转换为以天为单位的序列
    dateListA(j) = dateTranFun(tempA(j,1));
end
tempA(:,1) = dateListA;

%画图时x轴坐标的位置
ticks = zeros(1,round((2015-1981+1)/2));
%画图时x轴坐标内容
labels = cell(1,round((2015-1981+1)/2));
for y = 1:size(ticks,2)
    date = 19810615+20000*(y-1);
    [ ticks(y) ] = dateTranFun( date );
    labels{y} = int2str(1981+(y-1)*2);
end

figure;
plot(tempA(:,1),tempA(:,2) + tempA(:,3),'*');
title('太阳黑子群个数变化图');
xlabel('年份');
ylabel('黑子群个数');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(tempA(:,1),tempA(:,4) + tempA(:,5),'*');
title('太阳黑子个数变化图');
xlabel('年份');
ylabel('黑子个数');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(tempA(:,1),tempA(:,6) + tempA(:,7),'*');
title('沃夫数（相对太阳黑子个数）变化图');
xlabel('年份');
ylabel('沃夫数（相对太阳黑子个数）');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;




%提取B表中用来画图的信息
tempB = Bdata(:,[1,6:7]);
%将同一天的本影和半影面积相加
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
    %将日期转换为以天为单位的序列
    dateListB(j) = dateTranFun(col1(j));
end

figure;
plot(dateListB,cola,'*');
title('太阳黑子本影面积变化图');
xlabel('年份');
ylabel('太阳黑子本影面积');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(dateListB,colap,'*');
title('太阳黑子半影面积变化图');
xlabel('年份');
ylabel('太阳黑子半影面积');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;

figure;
plot(dateListB,cola./colap,'*');
title('太阳黑子本影、半影面积比值图');
xlabel('年份');
ylabel('太阳黑子本影面积/半影面积');
ax = gca;
ax.XTick = ticks;
ax.XTickLabel = labels;