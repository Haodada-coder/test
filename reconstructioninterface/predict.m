function predict()
%% ��ջ���
clc;
clear;

%% ����ѵ���õ�����ģ��
load ('RbfNet') % netΪ���汣������磬����������ص�workspace������������ 

%% �������ݽ��в���
x_test = xlsread('�߽���Ʋ�������.xlsx', '��������', 'A1:A224');
num_test_row = size(x_test,1); % �������ݵ�����
num_test_column = size(x_test,2); % �������ݵ�����
x_test  = reshape(x_test , 1, num_test_row*num_test_column);
x_01 = mapminmax('apply', x_test , xs);  %x_01Ϊ��һ������������
x_01 = reshape(x_01 , num_test_row, num_test_column);

y_test_hat = sim(net,x_01) ;% x_test ���������룬y_test_hat �� ����net��������
y_test_hat(y_test_hat >0.75) = 1;
y_test_hat(y_test_hat <0.25) = 0;
y_test = xlsread('�߽���Ʋ�������.xlsx', '���Ա�ǩ', 'A1:A1350'); %y_test Ϊ�������
save('y_text')
save('y_text_hat')
%% ����ͼ��ı����
err = gsubtract(y_test_hat,y_test );
err_sum = sum(sum(abs(err)));
SIE_test= err_sum / sum(sum(y_test)); % SIE:ͼ�����
SIE_testno= 1 - SIE_test;    % SIE_predict_no:�����

%% ������ǩ ��ѵ�����ͼ
figure(1)
plot(y_test);
title('ѵ�����ݵ�����ֵ');
xlabel('����','fontsize',12)
ylabel('����ֵ','fontsize',12)

figure(2)
plot(y_test_hat);
title('ѵ�����ݵ�Ԥ��ֵ');
xlabel('����','fontsize',12);
ylabel('Ԥ��ֵ','fontsize',12);

end