%读取年份文件
filePath = 'E:/sunspots/Data/Doc Format/Txt/';
fileName = ls(filePath);

savePath = 'E:/sunspots/Data/表格格式/全部数据';
mkdir(savePath)
AfileID = fopen([savePath,'/','Adata.csv'],'w');
BfileID = fopen([savePath,'/','Bdata.csv'],'w');
NfileID = fopen([savePath,'/','Ndata.csv'],'w');

for y = 1:size(fileName,1)
    if fileName(y,1) == '.'
        continue
    end
    
    %新建格式转换后的存储文件夹
%     savePath = ['E:/sunspots/Data/excel格式/',fileName(y,:)];
%     mkdir(savePath)
    
    %按年份写入
%     AfileID = fopen([savePath,'/',fileName(y,:),'-Adata.csv'],'w');
%     BfileID = fopen([savePath,'/',fileName(y,:),'-Bdata.csv'],'w');
    
   %读取月份文件
    docName = ls([filePath,fileName(y,:)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        
        %去掉字符串后的空格
        docNamenew = deblank(docName(m,:));
        data = docNamenew(:,1:end-4);
        
        %按月份写入
%         AfileID = fopen([savePath,'/',data,'-Adata.csv'],'w');
%         BfileID = fopen([savePath,'/',data,'-Bdata.csv'],'w');
%         WfileID = fopen([savePath,'/',data,'wrong.txt'],'w');
        
        %读取文件内容
        textStr = fileread([filePath,deblank(fileName(y,:)),'/',docName(m,:)]);
        
        %寻找所有#
        jing = strfind(textStr,'#');
        %输出#号个数
%         fprintf('年份为：%s，#号个数为：%d\n\n',docName(m,1:6),size(jing,2));
        fprintf(NfileID,'%s,%d\n',docName(m,1:6),size(jing,2));
        
        %删除字符串中的空白符
        [ textStr ] = deleteBlankFun( textStr );
        
        %获取字符串中对应A、B表格的内容
        [ Astart,Aend,Anum,Bstart,Bend,Bnum ] = getContentFun( textStr );
       
        %判断#和A表行数，*和B表行数是否相等
       [ n ] = judgeDFun( textStr,Astart,Anum,Bstart,Bnum,data );
         
        if n == 1
            continue
        end
       
       %每天的*号的个数与；号个数是否相同
       [ k ] = judgeXFun( textStr );
     
        if k == 1
            continue
        end
        
        %新建cell存储A表数据
        AdataStr = cell(Anum,1);
        %新建cell存储B表数据
        BdataStr = cell(Bnum,1);

        for i = 1:Anum
            %获取A表每行数据内容
            AdataStr{i} = textStr(Astart(i):Aend(i));
            %寻找逗号个数
            k = strfind(AdataStr{i},',');
            %A表共有19个数据，逗号数为18个
            if length(k) ~= 18
%                 fprintf(WfileID,'错误! %s A表有%d个数据! 错误数据如下：\n%s\n\n',data,length(k)+1,AdataStr{i});
                fprintf('错误! %s A表有%d个数据! 错误数据如下：\n%s\n\n',data,length(k)+1,AdataStr{i});
            else
                fprintf(AfileID,'%s\n',AdataStr{i}(2:end-1));
            end
        end
        
        for i = 1:Bnum
            BdataStr{i} = textStr(Bstart(i):Bend(i));
            k = strfind(BdataStr{i},',');
            %A表共有8个数据，逗号数为7个
            if length(k) ~= 7
%                 fprintf(WfileID,'错误! %s B表有%d个数据! 错误数据如下: \n%s\n\n',data,length(k)+1,BdataStr{i});
                fprintf('错误! %s B表有%d个数据! 错误数据如下: %s\n\n',data,length(k)+1,BdataStr{i});
            else
                patchID = find(Bstart(i)>Astart, 1, 'last' );
                temp = strsplit(AdataStr{patchID},',');
                fprintf(BfileID,'%s,%s\n',temp{2},BdataStr{i}(2:end-1));
            end
        end
        
%         fclose(AfileID);
%         fclose(BfileID);
%         fclose(WfileID);
    end
%     fclose(AfileID);
%     fclose(BfileID);
end
fclose(AfileID);
fclose(BfileID);
fclose(NfileID);
