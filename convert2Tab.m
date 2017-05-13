%��ȡ����ļ�
filePath = 'E:/sunspots/Data/Doc Format/Txt/';
fileName = ls(filePath);

savePath = 'E:/sunspots/Data/����ʽ/ȫ������';
mkdir(savePath)
AfileID = fopen([savePath,'/','Adata.csv'],'w');
BfileID = fopen([savePath,'/','Bdata.csv'],'w');
NfileID = fopen([savePath,'/','Ndata.csv'],'w');

for y = 1:size(fileName,1)
    if fileName(y,1) == '.'
        continue
    end
    
    %�½���ʽת����Ĵ洢�ļ���
%     savePath = ['E:/sunspots/Data/excel��ʽ/',fileName(y,:)];
%     mkdir(savePath)
    
    %�����д��
%     AfileID = fopen([savePath,'/',fileName(y,:),'-Adata.csv'],'w');
%     BfileID = fopen([savePath,'/',fileName(y,:),'-Bdata.csv'],'w');
    
   %��ȡ�·��ļ�
    docName = ls([filePath,fileName(y,:)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        
        %ȥ���ַ�����Ŀո�
        docNamenew = deblank(docName(m,:));
        data = docNamenew(:,1:end-4);
        
        %���·�д��
%         AfileID = fopen([savePath,'/',data,'-Adata.csv'],'w');
%         BfileID = fopen([savePath,'/',data,'-Bdata.csv'],'w');
%         WfileID = fopen([savePath,'/',data,'wrong.txt'],'w');
        
        %��ȡ�ļ�����
        textStr = fileread([filePath,deblank(fileName(y,:)),'/',docName(m,:)]);
        
        %Ѱ������#
        jing = strfind(textStr,'#');
        %���#�Ÿ���
%         fprintf('���Ϊ��%s��#�Ÿ���Ϊ��%d\n\n',docName(m,1:6),size(jing,2));
        fprintf(NfileID,'%s,%d\n',docName(m,1:6),size(jing,2));
        
        %ɾ���ַ����еĿհ׷�
        [ textStr ] = deleteBlankFun( textStr );
        
        %��ȡ�ַ����ж�ӦA��B��������
        [ Astart,Aend,Anum,Bstart,Bend,Bnum ] = getContentFun( textStr );
       
        %�ж�#��A��������*��B�������Ƿ����
       [ n ] = judgeDFun( textStr,Astart,Anum,Bstart,Bnum,data );
         
        if n == 1
            continue
        end
       
       %ÿ���*�ŵĸ����룻�Ÿ����Ƿ���ͬ
       [ k ] = judgeXFun( textStr );
     
        if k == 1
            continue
        end
        
        %�½�cell�洢A������
        AdataStr = cell(Anum,1);
        %�½�cell�洢B������
        BdataStr = cell(Bnum,1);

        for i = 1:Anum
            %��ȡA��ÿ����������
            AdataStr{i} = textStr(Astart(i):Aend(i));
            %Ѱ�Ҷ��Ÿ���
            k = strfind(AdataStr{i},',');
            %A����19�����ݣ�������Ϊ18��
            if length(k) ~= 18
%                 fprintf(WfileID,'����! %s A����%d������! �����������£�\n%s\n\n',data,length(k)+1,AdataStr{i});
                fprintf('����! %s A����%d������! �����������£�\n%s\n\n',data,length(k)+1,AdataStr{i});
            else
                fprintf(AfileID,'%s\n',AdataStr{i}(2:end-1));
            end
        end
        
        for i = 1:Bnum
            BdataStr{i} = textStr(Bstart(i):Bend(i));
            k = strfind(BdataStr{i},',');
            %A����8�����ݣ�������Ϊ7��
            if length(k) ~= 7
%                 fprintf(WfileID,'����! %s B����%d������! ������������: \n%s\n\n',data,length(k)+1,BdataStr{i});
                fprintf('����! %s B����%d������! ������������: %s\n\n',data,length(k)+1,BdataStr{i});
            else
                patchID = find(Bstart(i)>Astart, 1, 'last' );
                temp = strsplit(AdataStr{patchID},',');
                fprintf(BfileID,'%s,%s\n',temp{2},BdataStr{i}(2:end-1));
            end
        end
        
%         fclose(AfileID);
%         fclose(BfileID);
%         fclose(WfileID);
    end
%     fclose(AfileID);
%     fclose(BfileID);
end
fclose(AfileID);
fclose(BfileID);
fclose(NfileID);
