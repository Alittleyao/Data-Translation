%����ļ�
fileName = ls('E:/sunspots/Data/�ĵ���ʽ/ԭʼ�ĵ�/������/');

for y = 1:size(fileName,1)
    %����ļ����ԡ�.����ͷ��������
    if fileName(y,1) == '.'
        continue
    end
    
    %�½������ļ���
    savePath = ['E:/sunspots/Data/�ĵ���ʽ/���ĺ��ĵ�/������/',fileName(y,:)];
    mkdir(savePath)
    
    %�·��ļ�
    docName = ls(['E:/sunspots/Data/�ĵ���ʽ/ԭʼ�ĵ�/������/',fileName(y,:)]);
    
    for m = 1:size(docName,1)
        if docName(m,1) == '.'
            continue
        end
        %ȥ���ַ�����Ŀո�
        name = deblank(docName(m,:));
        
        %ԭʼ�ĵ���·��
        oldName = ['E:/sunspots/Data/�ĵ���ʽ/ԭʼ�ĵ�/������/',fileName(y,:),'/',name];

        %��ȡ�ĵ�����
        textStr = fileread(['E:/sunspots/Data/�ĵ���ʽ/ԭʼ�ĵ�/������/',fileName(y,:),'/',docName(m,:)]);
        [ textStr ] = deleteBlankFun( textStr );
        
        %����ַ��������ж��ŵ�λ��
        dou = strfind(textStr,',');
        %��ȡ�������������ĵ���Ϣ
        date = textStr(dou(1)+1:dou(2)-1);
       
        %ȥ���ַ�������Ŀո�
        date = deblank(date);
        %ȥ���ַ���ǰ��Ŀո�
        date = strtrim(date);
        
        if size(date,2) == 8
            year = str2num(date(1:4));
            month = str2num(date(5:6));
            days = str2num(date(7:8));
            if year >= 1957 && year <= 2015 && month >= 1 && month <= 12 && days >= 1 && days <= 31
                %���ĵ���·��
                newName = [savePath,'/',textStr(dou(1)+1:dou(1)+6),'.txt'];
%                 if ~strcmp(oldName,newName)
                    copyfile(oldName,newName)
%                 end
            else
                fprintf('����%s ��������Ϊ%s\n',oldName,date)
            end
        else
            fprintf('����%s ��������Ϊ%s\n',oldName,date)
        end
        
    end
end