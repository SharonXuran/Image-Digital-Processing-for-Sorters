function y=area(B)


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
 
  % ��ȡ�߽���Χ���
  y=stats(k).Area;
end
 y=y;
end
























