filePath = 'E:/sunspots/Data/Doc Format/Txt/';
fileName = ls(filePath);

for y = 1:size(fileName,1)
   if fileName(y,1) == '.'
       continue
   end
   oldName = [filePath,fileName(y,:)];
   newName = [filePath,fileName(y,1:4)];
   movefile(oldName,newName)
end
