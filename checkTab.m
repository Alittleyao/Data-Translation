%�ļ�·�� ����.csv'��ʽ��
filePath = 'E:/sunspots/Data/����ʽ/ȫ������/*.csv';
%��ȡ�ļ�
fileName = ls(filePath);

for y = 1:size(fileName,1)
%     if fileName(y,1) == '.'
%         continue
%     end
%     %�ֱ��ȡA��B���·��ļ�
%     AxlsName = ls([filePath,fileName(y,:),'/','*Adata.csv']);
%     BxlsName = ls([filePath,fileName(y,:),'/','*Bdata.csv']);
%         

%     for m = 1:size(AxlsName,1)
%         %��ȡA��B�������
%         Adata = importAtabFun([filePath,fileName(y,:),'/',deblank(AxlsName(m,:))]);
%         Bdata = importBtabFun([filePath,fileName(y,:),'/',deblank(BxlsName(m,:))]);        
%     end

      %%��ȡA��
      if fileName(y,1) == 'A'
          %��ȡA������
          Adata = importAtabFun(['E:/sunspots/Data/����ʽ/ȫ������/',deblank(fileName(y,:))]);
%           num = xlsread(['E:/sunspots/Data/����ʽ/ȫ������/',deblank(fileName(y,:))]);     
      end 
      
      %%��ȡB��
      if fileName(y,1) == 'B'
          %��ȡb������
          Bdata = importBtabFun(['E:/sunspots/Data/����ʽ/ȫ������/',deblank(fileName(y,:))]);
          
%           %%�����Ӻš��뾶����������Ϊ������
%           for i = 1:size(Bdata,1)
%               [ b1 ] = checkInt( Bdata(i,2) );
%               [ b2 ] = checkInt( Bdata(i,8) );
%               [ b3 ] = checkInt( Bdata(i,9) );
%               
%               if b1 == 0
%                   fprintf('���ӺŴ���%d���������Ϊ��%d\n\n',Bdata(i,2),Bdata(i,1))
%               end
%               
%               if b2 == 0
%                   fprintf('���Ӱ뾶����%d���������Ϊ��%d\n\n',Bdata(i,8),Bdata(i,1))
%               end
%               
%               if b3 == 0
%                   fprintf('���Ӹ�������%d���������Ϊ��%d\n\n',Bdata(i,9),Bdata(i,1))
%               end   
%           end
      end
          
end

% ������ڣ��Ƿ��ظ����Ƿ�Ϊʱ�����У�
[ d ] = checkDateFun( Adata );

% ���A�������ʽ
[ a ] = checkAtabFun( Adata );

 % ���A��B��ĺ���Ⱥ�����Ƿ����
 [ g ] = checkGroupNumFun( Adata,Bdata );         
          
 % ���A��B��ĺ������Ƿ����
 [ s ] = checkSunspotNumFun( Adata,Bdata );         
          
 %%�����ӵ�����ԣ�ͬһ�������ڲ�ͬ���ڵı仯��

