%��ȡ����ļ�
filePath = 'F:/��������JPG��ʽ/';
fileName = ls(filePath);

savePath = 'E:/sunspots/Data/����ʽ/ȫ������';
N2fileID = fopen([savePath,'/','N2data.csv'],'w');

for y = 4:size(fileName,1)
%     if fileName(y,1) == '.'
%         continue
%     end
   
    docName = ls([filePath,fileName(y,:)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        
        picName = ls([filePath,fileName(y,:),'/',docName(m,:)]);
        
        num = size(picName,1)-2;
        
        Month = str2num(docName(m,:));
        
        if Month<10
           Month = int2str(Month);
           Month = ['0',Month];
        else
            Month = int2str(Month);
        end
        fprintf(N2fileID,'%s,%d\n',[fileName(y,:),Month],num);
    end
end

fclose(N2fileID);