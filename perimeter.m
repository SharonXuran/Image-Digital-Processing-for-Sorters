function    y=perimeter(B)


[B,L] = bwboundaries(B, 'noholes'); 

for k = 1:length(B)
 boundary = B{k};
 %plot(boundary(:,2),boundary(:,1),'r','LineWidth',2);
 %hold on;
end
% �ҵ�ÿ����ͨ�������
stats = regionprops(L,'Area','Centroid');
% ѭ������ÿ����ͨ��ı߽�
for k = 1:length(B)
  % ��ȡһ���߽��ϵ����е�
  boundary = B{k};
  % ����߽��ܳ�
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  % ��ȡ�߽���Χ���
  area = stats(k).Area;
end
%disp('�ܳ�');
y=perimeter;

end

