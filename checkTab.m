%文件路径 （‘.csv'格式）
filePath = 'E:/sunspots/Data/表格格式/全部数据/*.csv';
%读取文件
fileName = ls(filePath);

for y = 1:size(fileName,1)
%     if fileName(y,1) == '.'
%         continue
%     end
%     %分别读取A、B表月份文件
%     AxlsName = ls([filePath,fileName(y,:),'/','*Adata.csv']);
%     BxlsName = ls([filePath,fileName(y,:),'/','*Bdata.csv']);
%         

%     for m = 1:size(AxlsName,1)
%         %读取A、B表格内容
%         Adata = importAtabFun([filePath,fileName(y,:),'/',deblank(AxlsName(m,:))]);
%         Bdata = importBtabFun([filePath,fileName(y,:),'/',deblank(BxlsName(m,:))]);        
%     end

      %%读取A表
      if fileName(y,1) == 'A'
          %读取A表内容
          Adata = importAtabFun(['E:/sunspots/Data/表格格式/全部数据/',deblank(fileName(y,:))]);
%           num = xlsread(['E:/sunspots/Data/表格格式/全部数据/',deblank(fileName(y,:))]);     
      end 
      
      %%读取B表
      if fileName(y,1) == 'B'
          %读取B表内容
          Bdata = importBtabFun(['E:/sunspots/Data/表格格式/全部数据/',deblank(fileName(y,:))]);
      end
          
      %%读取排序后的B表
      if strcmp(fileName(y,1:3),'New') == 1
          %读取排序后的B表内容
          NewBdata = importBtabFun(['E:/sunspots/Data/表格格式/全部数据/',deblank(fileName(y,:))]);
      end
end

% 检测日期（是否重复、日期和号数是否为时间序列）
[ d ] = checkDateFun( Adata );

% 检查A表基本格式及内容
[ a ] = checkAtabFun( Adata );

% 检查B表基本格式
[ b ] = checkBtabFun( Bdata );

% 检测A、B表的黑子群个数是否相等
[ g ] = checkGroupNumFun( Adata,Bdata );
          
% 检测A、B表的黑子数是否相等
[ s ] = checkSunspotNumFun( Adata,Bdata );
          
% 检测黑子的相关性（同一个黑子在不同日期的变化）
[ bs ] = checkBSFun( NewBdata );
