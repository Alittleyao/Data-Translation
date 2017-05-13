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
          %读取b表内容
          Bdata = importBtabFun(['E:/sunspots/Data/表格格式/全部数据/',deblank(fileName(y,:))]);
          
%           %%检测黑子号、半径、黑子数均为正整数
%           for i = 1:size(Bdata,1)
%               [ b1 ] = checkInt( Bdata(i,2) );
%               [ b2 ] = checkInt( Bdata(i,8) );
%               [ b3 ] = checkInt( Bdata(i,9) );
%               
%               if b1 == 0
%                   fprintf('黑子号错误：%d，错误年份为：%d\n\n',Bdata(i,2),Bdata(i,1))
%               end
%               
%               if b2 == 0
%                   fprintf('黑子半径错误：%d，错误年份为：%d\n\n',Bdata(i,8),Bdata(i,1))
%               end
%               
%               if b3 == 0
%                   fprintf('黑子个数错误：%d，错误年份为：%d\n\n',Bdata(i,9),Bdata(i,1))
%               end   
%           end
      end
          
end

% 检测日期（是否重复、是否为时间序列）
[ d ] = checkDateFun( Adata );

% 检查A表基本格式
[ a ] = checkAtabFun( Adata );

 % 检测A、B表的黑子群个数是否相等
 [ g ] = checkGroupNumFun( Adata,Bdata );         
          
 % 检测A、B表的黑子数是否相等
 [ s ] = checkSunspotNumFun( Adata,Bdata );         
          
 %%检测黑子的相关性（同一个黑子在不同日期的变化）

