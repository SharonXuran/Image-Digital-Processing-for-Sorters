function R= wjy(B)

%��������2016-8-8�޸�
%ʵ�ֽ�����ͼ�ε���С���Բ������������������С���Բ�뾶ֵ
%���Զ�����ͼ����ȡ��Ч

[N,M]=size(B);
Iedg=edge(B,'canny');                  %��ԵIedg
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
%plot(d1y,d1x,'+b');                %��һ��d1y,d1x
d2y=boundary(y,2);
d2x=boundary(y,1);
%plot(d2y,d2x,'+b');                %�ڶ���d2y,d2x
R=max2/2;                      %�ٶ��뾶R
m=(d1y+d2y)/2;
n=(d1x+d2x)/2;
%plot(m,n,'+r');                   %�ٶ�Բ��
rr=[];
for a=1:length(boundary)
rr(a)=sqrt((boundary(a,2)-m).^2+(boundary(a,1)-n).^2);
amax=[];
[rrmax,amax]=max(rr);
end
if rrmax<=R                       %�����Ե�ĵ㵽Բ�ĵľ��붼�ȼٶ��뾶С
    theta=0:pi/50:2*pi;
    xx=m+R*cos(theta);
    yy=n+R*sin(theta);
   plot(xx,yy,'-',m,n,'.');            %�ٶ�Բ�ġ��뾶Ϊ��С���Բ������
    %disp('���Բ�뾶R��Բ��λ��(m,n)');
   R=R;
   MX=m;
   MY=n;
   
else                              %������ٶ�Բ�ľ������ĵ�ΪԲ�ϵ�����
    
    [a1,b1]=size(boundary);
    
   d3y=boundary(amax,2);
   d3x=boundary(amax,1);
  % plot(d3y, d3x,'+y');              %������d3y,d3x

 %���㻭Բ����A��B�������ߵĴ�ֱƽ���ߺ�B��C�������ߵĴ�ֱƽ���ߵĽ���ΪԲ��
   dy01=(d1y+d2y)/2;
   dx01=(d1x+d2x)/2;
   k01=(d1y-d2y)/(d1x-d2x);
   k01=-1/k01;
   
   dy02=(d1y+d3y)/2;
   dx02=(d1x+d3x)/2;
   k02=(d1y-d3y)/(d1x-d3x);
   k02=-1/k02;
  
   x=-(dy01 - dy02 - dx01*k01 + dx02*k02)/(k01 - k02);
   y=-(dy01*k02 - dy02*k01 - dx01*k01*k02 + dx02*k01*k02)/(k01 - k02);
   %����Ϊ��y,x��
   %plot(y,x,'+r');
   r0=sqrt((d1y-y)^2+(d1x-x)^2);
   theta=0:pi/50:2*pi;
   xxx=y+r0*cos(theta);
   yyy=x+r0*sin(theta);
   plot(xxx,yyy,'-',y,x,'.'); 
   %disp('��С���Բ�뾶R');
   R=r0;
   tt=R;
   u1=y;
   u2=x;                                 
end
  
end

