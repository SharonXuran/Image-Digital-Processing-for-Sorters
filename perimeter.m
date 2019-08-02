function    y=perimeter(B)


[B,L] = bwboundaries(B, 'noholes'); 

for k = 1:length(B)
 boundary = B{k};
 %plot(boundary(:,2),boundary(:,1),'r','LineWidth',2);
 %hold on;
end
% 找到每个连通域的质心
stats = regionprops(L,'Area','Centroid');
% 循环历遍每个连通域的边界
for k = 1:length(B)
  % 获取一条边界上的所有点
  boundary = B{k};
  % 计算边界周长
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  % 获取边界所围面积
  area = stats(k).Area;
end
%disp('周长');
y=perimeter;

end

