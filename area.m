function y=area(B)


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
 
  % 获取边界所围面积
  y=stats(k).Area;
end
 y=y;
end
























