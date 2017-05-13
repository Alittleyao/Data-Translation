%年份文件
fileName = ls('E:/sunspots/Data/文档格式/原始文档/第三批/');

for y = 1:size(fileName,1)
    %如果文件名以‘.’开头，则跳过
    if fileName(y,1) == '.'
        continue
    end
    
    %新建保存文件夹
    savePath = ['E:/sunspots/Data/文档格式/更改后文档/第三批/',fileName(y,:)];
    mkdir(savePath)
    
    %月份文件
    docName = ls(['E:/sunspots/Data/文档格式/原始文档/第三批/',fileName(y,:)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        %去掉字符串后的空格
        name = deblank(docName(m,:));
        
        %原始文档的路径
        oldName = ['E:/sunspots/Data/文档格式/原始文档/第三批/',fileName(y,:),'/',name];

        %读取文档内容
        textStr = fileread(['E:/sunspots/Data/文档格式/原始文档/第三批/',fileName(y,:),'/',docName(m,:)]);
        [ textStr ] = deleteBlankFun( textStr );
        
        %标记字符串中所有逗号的位置
        dou = strfind(textStr,',');
        %获取用来重命名的文档信息
        date = textStr(dou(1)+1:dou(2)-1);
       
        %去掉字符串后面的空格
        date = deblank(date);
        %去掉字符串前面的空格
        date = strtrim(date);
        
        if size(date,2) == 8
            year = str2num(date(1:4));
            month = str2num(date(5:6));
            days = str2num(date(7:8));
            if year >= 1957 && year <= 2015 && month >= 1 && month <= 12 && days >= 1 && days <= 31
                %新文档的路径
                newName = [savePath,'/',textStr(dou(1)+1:dou(1)+6),'.txt'];
%                 if ~strcmp(oldName,newName)
                    copyfile(oldName,newName)
%                 end
            else
                fprintf('错误！%s 日期数据为%s\n',oldName,date)
            end
        else
            fprintf('错误！%s 日期数据为%s\n',oldName,date)
        end
        
    end
end