function y=SVMTest(data1,data2,data3,test)
%n1,n2和n3是各个样本训练集的个数
%生成训练样本和测试样本
high=data1;
mid=data2;
low=data3;

num=nchoosek(1:3,2);
%元胞形式的训练集及SVM
Training={high,mid,low};
SVM=cell(size(num,1),1);
%配对组成训练集
A=zeros(size(num,1),1);
for k=1:size(num,1)
    t1=Training{num(k,1)};
    t2=Training{num(k,2)};
    %训练函数
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','polynomial');
          %多项式
    SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','linear');
          %线性
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','rbf');
         %径向基函数
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','mlp');
         %多层神经网络
end
for kk=1:size(test,1)
    for k=1:length(SVM)
        %分类函数
        result(k)=svmclassify(SVM{k},test(kk,:));
        %每个分类器的分类结果
        temp(k)=num(k,1).*result(k)+num(k,2).*~result(k);
    end
    %依据每个数据出现的次数，决定总的分类结果
    results(kk)=mode(temp,2);
end
y=results;
end
