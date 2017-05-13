%用问号填补1963到1966年图片中没有记录的K2的值

for year = 1963:1966
    %新建补全数据后的文件夹
    savePath = ['E:/sunspots/Data/补全数据','/',int2str(year)];
    mkdir(savePath)
    
    %读取月份文件
    docName = ls(['E:/sunspots/Data/sunspotData','/',int2str(year)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        docNamenew = deblank(docName(m,:));
        data = docNamenew(:,1:end-4);
        %读取文件内容
        textstr = fileread(['E:/sunspots/Data/sunspotData','/',int2str(year),'/',docName(m,:)]);
        
        %寻找需要补全K2值的A表行号
        [ mark,Astart,Aend ] = markK2Fun( textstr );
        
        %输出补全后的文件
        fileID = fopen([savePath,'/',data,'.txt'],'w');
        %用‘,?’补全K2的值
        [ str ] = completeK2Fun( textstr,Astart,Aend,mark );
        for i = 1:size(str,1)
            fprintf(fileID,'%s',str{i});
        end
        fclose(fileID);
        
    end
    
end
