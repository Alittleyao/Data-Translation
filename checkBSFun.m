function [ bs ] = checkBSFun( NewBdata )
%checkBSFun 检查同一个黑子在不同日期的变化

savePath = 'E:/sunspots/Data/Doc Format/错误反馈';
mkdir(savePath)
AfileID = fopen([savePath,'/','Adata.txt'],'w');
BfileID = fopen([savePath,'/','Bdata.txt'],'w');
CfileID = fopen([savePath,'/','Cdata.txt'],'w');
DfileID = fopen([savePath,'/','Ddata.txt'],'w');
EfileID = fopen([savePath,'/','Edata.txt'],'w');

bs = 0;

[Brow,~] = size(NewBdata);

for i = 2:Brow
    
    if NewBdata(i,2) == NewBdata(i-1,2) && NewBdata(i,1) - NewBdata(i-1,1) == 1 ...
            &&(abs(NewBdata(i,3) - NewBdata(i-1,3))>5 || NewBdata(i,4) - NewBdata(i-1,4)<0)
        bs = 1;
        fprintf('错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         if NewBdata(i,1) >= 19580101 && NewBdata(i,1) <= 19701231
%             fprintf(AfileID,'错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         elseif NewBdata(i,1) >= 19710101 && NewBdata(i,1) <=19801231
%             fprintf(BfileID,'错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         elseif NewBdata(i,1) >= 19810101 && NewBdata(i,1) <= 19891231
%             fprintf(CfileID,'错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         elseif NewBdata(i,1) >= 19900101 && NewBdata(i,1) <= 19991231
%             fprintf(DfileID,'错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         elseif NewBdata(i,1) >= 20000101 && NewBdata(i,1) <= 20151231
%             fprintf(EfileID,'错误！本影、半影错误，错误年份：%d，错误黑子号：%d\n\n',NewBdata(i,1),NewBdata(i,2));
%         end
    end
end


fclose(AfileID);
fclose(BfileID);
fclose(CfileID);
fclose(DfileID);
fclose(EfileID);

end
