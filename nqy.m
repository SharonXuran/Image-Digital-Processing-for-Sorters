function R= nqy(B3)

%��������2016-8-8�޸�
%ʵ�ֽ�����ͼ�ε��������Բ�����������������������Բ�İ뾶ֵ 
%���Զ�����ͼ����ȡ��Ч
 
%������Բ
Jlunkuo=edge(B3,'sobel');

Jgujia=bwmorph(B3,'skel',inf);


[x0,y0,v0]=find(Jlunkuo);
[a0,b0,c0]=find(Jgujia);

m=length(a0);
n=length(x0);
juli=zeros(m,n);
cunfang=zeros(m,2);
for i=1:m
    for j=1:n
      p1=a0(i);q1=b0(i);
      p2=x0(j);q2=y0(j);
      juli(i,j)=sqrt((p1-p2)^2+(q1-q2)^2);%�Ǽ��ϸ��굽�����ľ���
    end
    [zx,zxxh]=min(juli(i,:));
    cunfang(i,1)=zx;
    cunfang(i,2)=zxxh;
end
[zd,zdxh]=max(cunfang(:,1));

Y0=a0(round(zdxh));
X=b0(round(zdxh));
R=round(zd);  

 t=0:0.01:2*pi;      
 z=ceil(cos(t)*R+X);     
 K=ceil(sin(t)*R+Y0); 
 
 plot(z,K,'-r','LineWidth',1);
 plot(X,Y0,'*r');


end

