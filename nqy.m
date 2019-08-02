function R= nqy(B3)

%本程序于2016-8-8修改
%实现将单个图形的最大内切圆画出来，并返回其最大内切圆的半径值 
%测试对杂质图像提取有效
 
%求内切圆
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
      juli(i,j)=sqrt((p1-p2)^2+(q1-q2)^2);%骨架上各店到轮廓的距离
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

