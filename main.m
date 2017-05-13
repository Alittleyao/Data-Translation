% textstr = fileread('199101.txt');
year = 1958;
month = 195801;

textstr = fileread(['E:/sunspots/Data/文档格式/更改后文档/',int2str(year),'/',int2str(month),'.txt']);
[Astart, Aend] = regexp(textstr,'#[^#;]*;');
[Bstart, Bend] = regexp(textstr,'\*[^\*;]*;');
Anum = length(Astart);
Bnum = length(Bstart);
AdataStr = cell(Anum,1);
BdataStr = cell(Bnum,1);

savePath = ['E:/sunspots/Data/excel格式/',int2str(year)];
mkdir(savePath)

AfileID = fopen([savePath,'/',int2str(year),'-',int2str(month),'-Adata.csv'],'w');
BfileID = fopen([savePath,'/',int2str(year),'-',int2str(month),'-Bdata.csv'],'w');

for i = 1:Anum
    AdataStr{i} = textstr(Astart(i):Aend(i));
    k = strfind(AdataStr{i},',');
    if length(k) ~= 18
        fprintf('错误! %d月 A表第%d个数据数目不对!错误数据如下：\n%s\n',month,i,AdataStr{i});
    else
        fprintf(AfileID,'%s\n',AdataStr{i}(2:end-1));
    end
end


for i = 1:Bnum
    BdataStr{i} = textstr(Bstart(i):Bend(i));
    k = strfind(BdataStr{i},',');
    if length(k) ~= 7
        fprintf('错误! %d月 B表第%d个数据数目不对! 错误数据如下: %s\n',month,i,BdataStr{i});
    else
        patchID = find(Bstart(i)>Astart, 1, 'last' );
        temp = strsplit(AdataStr{patchID},',');
        fprintf(BfileID,'%s,%s\n',temp{2},BdataStr{i}(2:end-1));
    end
end


fclose(AfileID);
fclose(BfileID);