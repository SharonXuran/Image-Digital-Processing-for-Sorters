function y=SVMTest(data1,data2,data3,test)
%n1,n2��n3�Ǹ�������ѵ�����ĸ���
%����ѵ�������Ͳ�������
high=data1;
mid=data2;
low=data3;

num=nchoosek(1:3,2);
%Ԫ����ʽ��ѵ������SVM
Training={high,mid,low};
SVM=cell(size(num,1),1);
%������ѵ����
A=zeros(size(num,1),1);
for k=1:size(num,1)
    t1=Training{num(k,1)};
    t2=Training{num(k,2)};
    %ѵ������
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','polynomial');
          %����ʽ
    SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','linear');
          %����
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','rbf');
         %���������
    %SVM{k}=svmtrain([t1;t2],[ones(size(t1,1),1);zeros(size(t2,1),1)],'Kernel_function','mlp');
         %���������
end
for kk=1:size(test,1)
    for k=1:length(SVM)
        %���ຯ��
        result(k)=svmclassify(SVM{k},test(kk,:));
        %ÿ���������ķ�����
        temp(k)=num(k,1).*result(k)+num(k,2).*~result(k);
    end
    %����ÿ�����ݳ��ֵĴ����������ܵķ�����
    results(kk)=mode(temp,2);
end
y=results;
end
