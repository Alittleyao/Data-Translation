%��ȡ����ļ�
filePath = 'H:/�Ͻ�ɽ����̨/';
fileName = ls(filePath);

savePath1 = 'H:/�Ͻ�ɽ����̨JPG��ʽ';
mkdir(savePath1)

for y = 1:size(fileName,1)
    if fileName(y,1) == '.'
        continue
    end
    
    savePath2 = [savePath1,'/',deblank(fileName(y,:))];
    mkdir(savePath2)
    
    movefile([filePath,deblank(fileName(y,:)),'/','*.jpg'],savePath2);
    
end