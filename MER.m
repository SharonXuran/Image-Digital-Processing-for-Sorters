function SMER= MER(B)
%MER Summary of this function goes here
%   Detailed explanation goes here

[N,M]=size(B);
Iedg=edge(B,'canny');                  %边缘Iedg
C=[];
C=bwboundaries(B, 'noholes'); 
boundary=[];
for k = 1:length(C)
 boundary = C{k};
end
r=[];

for a=1:length(boundary)
r(:,a)=sqrt((boundary(a,1)-boundary(:,1)).^2+(boundary(a,2)-boundary(:,2)).^2);

end

max1=[];
max2=[];
index1=[];
index2=[];

[max1,index1]=max(r);
[max2,index2]=max(max1);
x=index1(:,index2);
y=index2;
d1y=boundary(x,2);
d1x= boundary(x,1);
plot(d1y,d1x,'+r');                %第一点d1y,d1x
d2y=boundary(y,2);
d2x=boundary(y,1);
plot(d2y,d2x,'+b');                %第二点d2y,d2x



for a=1:length(boundary)
    x0=boundary(a,1);
    y0=boundary(a,2);
    d(a)=((d1x-d2x).*y0+(d2y-d1y).*x0+d1y*d2x-d1x*d2y)./sqrt((d1x-d2x)^2+(d2y-d1y)^2);
end
dmin=min(d);
dmax=max(d);
SMER=round(dmax-dmin)*round(max2);

end

