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
          %��ȡB������
          Bdata = importBtabFun(['E:/sunspots/Data/����ʽ/ȫ������/',deblank(fileName(y,:))]);
      end
          
      %%��ȡ������B��
      if strcmp(fileName(y,1:3),'New') == 1
          %��ȡ������B������
          NewBdata = importBtabFun(['E:/sunspots/Data/����ʽ/ȫ������/',deblank(fileName(y,:))]);
      end
end

% ������ڣ��Ƿ��ظ������ںͺ����Ƿ�Ϊʱ�����У�
[ d ] = checkDateFun( Adata );

% ���A�������ʽ������
[ a ] = checkAtabFun( Adata );

% ���B�������ʽ
[ b ] = checkBtabFun( Bdata );

% ���A��B��ĺ���Ⱥ�����Ƿ����
[ g ] = checkGroupNumFun( Adata,Bdata );
          
% ���A��B��ĺ������Ƿ����
[ s ] = checkSunspotNumFun( Adata,Bdata );
          
% �����ӵ�����ԣ�ͬһ�������ڲ�ͬ���ڵı仯��
[ bs ] = checkBSFun( NewBdata );
