function [  ] = randomFun( Adata )
%randomFun �����ȡ100��ͼ��
%   �˴���ʾ��ϸ˵��

[Arow,~] = size(Adata);

n = randperm(Arow)';
m = sort(n(1:160,:));

for i = 1:160
    fprintf('�����ȡ��ͼ������Ϊ��%d\n\n',Adata(m(i),2));
end

end

