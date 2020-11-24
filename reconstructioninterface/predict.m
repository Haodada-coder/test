function predict()
%% 清空环境
clc;
clear;

%% 加载训练好的网络模型
load ('RbfNet') % net为上面保存的网络，这里把他下载到workspace（工作区）。 

%% 导入数据进行测试
x_test = xlsread('边界电势测试数据.xlsx', '测试数据', 'A1:A224');
num_test_row = size(x_test,1); % 测试数据的行数
num_test_column = size(x_test,2); % 测试数据的列数
x_test  = reshape(x_test , 1, num_test_row*num_test_column);
x_01 = mapminmax('apply', x_test , xs);  %x_01为归一化的网络输入
x_01 = reshape(x_01 , num_test_row, num_test_column);

y_test_hat = sim(net,x_01) ;% x_test 是网络输入，y_test_hat 是 经过net网络的输出
y_test_hat(y_test_hat >0.75) = 1;
y_test_hat(y_test_hat <0.25) = 0;
y_test = xlsread('边界电势测试数据.xlsx', '测试标签', 'A1:A1350'); %y_test 为期望输出
save('y_text')
save('y_text_hat')
%% 计算图像的保真度
err = gsubtract(y_test_hat,y_test );
err_sum = sum(sum(abs(err)));
SIE_test= err_sum / sum(sum(y_test)); % SIE:图像误差
SIE_testno= 1 - SIE_test;    % SIE_predict_no:保真度

%% 画出标签 和训练后的图
figure(1)
plot(y_test);
title('训练数据的期望值');
xlabel('数据','fontsize',12)
ylabel('期望值','fontsize',12)

figure(2)
plot(y_test_hat);
title('训练数据的预测值');
xlabel('数据','fontsize',12);
ylabel('预测值','fontsize',12);

end