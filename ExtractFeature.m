function Y=ExtractFeature(B)
%B为预处理之后的图像，读入预处理之后的图像

  %图像分割的参数设定
[x,n]=bwlabel(B);
QN=n;
DD=x;
J=B;
 
B1=zeros(size(J));
R0=zeros(1,n);
X0=zeros(1,n);
Y0= zeros(1,n);
figure;imshow(B);
hold on;

%图像分割
for  K=1:QN
    [b,q]=find(DD==K);
    B2=bwselect(J,q,b);
    B3=(B1)|(B2);         
    %对分割出每个图形B3 进行area perimeter wjy nqy 等特征提取
    
    
    %论文用的特征
    %F(K,1)=nqy(B3);
    %F(K,2)=round(area(B3)*area(B3)/perimeter(B3));
    %F(K,3)=area(B3);
    %F(K,4)=wjy(B3);
    %F(K,5)=perimeter(B3);
    %F(K,6)=MER(B3);
    %F(K,7)=F(K,1)/F(K,4);
    %%F(K,8)=F(K,3)/F(K,6);         %矩形度R=A/Smer
    %%F(K,9)=F(K,6)/F(K,5);         %偏心率E=Smer/L
    
    F(K,1)=nqy(B3);                 %R_i
    F(K,2)=area(B3);                %A
    F(K,3)=wjy(B3);                 %R_c
    F(K,4)=perimeter(B3);           %L
    F(K,5)=MER(B3);                 %MER
    F(K,6)=F(K,1)/F(K,3);          %S=R_i/R_c    
    F(K,7)=F(K,5)/F(K,4);          %E=MER/L
    %F(K,8)=F(K,4)*F(K,4)/F(K,2);   %C=L^2/A
    %F(K,9)=F(K,2)/F(K,4);          %R=A/MER
    
    %F(K,1)=area(B3);
    %F(K,2)=perimeter(B3);
    %F(K,3)=wjy(B3);
    %F(K,4)=nqy(B3);
    %F(K,5)=MER(B3);  
    %F(K,6)=F(K,2)*F(K,2)/F(K,1);         %c
    %F(K,7)=F(K,4)/F(K,3);
    %F(K,8)=F(K,1)/F(K,5);         %矩形度R=A/Smer
    %F(K,9)=F(K,5)/F(K,2);         %偏心率E=Smer/L

end
    
    Y=F;
end


