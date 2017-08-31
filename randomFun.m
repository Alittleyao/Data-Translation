function [  ] = randomFun( Adata )
%randomFun 随机抽取100张图像
%   此处显示详细说明

[Arow,~] = size(Adata);

n = randperm(Arow)';
m = sort(n(1:160,:));

for i = 1:160
    fprintf('随机抽取的图像日期为：%d\n\n',Adata(m(i),2));
end

end

