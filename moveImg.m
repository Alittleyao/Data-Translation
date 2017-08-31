%读取年份文件
filePath = 'H:/紫金山天文台/';
fileName = ls(filePath);

savePath1 = 'H:/紫金山天文台JPG格式';
mkdir(savePath1)

for y = 1:size(fileName,1)
    if fileName(y,1) == '.'
        continue
    end
    
    savePath2 = [savePath1,'/',deblank(fileName(y,:))];
    mkdir(savePath2)
    
    movefile([filePath,deblank(fileName(y,:)),'/','*.jpg'],savePath2);
    
end