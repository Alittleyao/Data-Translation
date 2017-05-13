%���ʺ��1963��1966��ͼƬ��û�м�¼��K2��ֵ

for year = 1963:1966
    %�½���ȫ���ݺ���ļ���
    savePath = ['E:/sunspots/Data/��ȫ����','/',int2str(year)];
    mkdir(savePath)
    
    %��ȡ�·��ļ�
    docName = ls(['E:/sunspots/Data/sunspotData','/',int2str(year)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        docNamenew = deblank(docName(m,:));
        data = docNamenew(:,1:end-4);
        %��ȡ�ļ�����
        textstr = fileread(['E:/sunspots/Data/sunspotData','/',int2str(year),'/',docName(m,:)]);
        
        %Ѱ����Ҫ��ȫK2ֵ��A���к�
        [ mark,Astart,Aend ] = markK2Fun( textstr );
        
        %�����ȫ����ļ�
        fileID = fopen([savePath,'/',data,'.txt'],'w');
        %�á�,?����ȫK2��ֵ
        [ str ] = completeK2Fun( textstr,Astart,Aend,mark );
        for i = 1:size(str,1)
            fprintf(fileID,'%s',str{i});
        end
        fclose(fileID);
        
    end
    
end
