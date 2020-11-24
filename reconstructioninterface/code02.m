function code02()
load('y_text')
load('y_text_hat')
%ͼ���ؽ�

n = 15;%��Ȧ��
R = 15; %�뾶

% i=1����һȦ�ڵ����
F{1} = [1, 2, 3]; %F���±���{}����ʾ
F{6} = [1, 7, 2];
for j=2:1:5
    F(j) = {[0, 0, 0]};
    F{j} = F{(j-1)} + [0, 1, 1];
end

% i >= 2.����Ȧ�ڵ����,i��ʾȦ��
for i = 2:1:n
    k = 6*i*i;
    p = 6*(i-1)*(i-1);
    F{(p+1)} = [3*(i-1)*(i -2)+2, 3*i*(i-1)+2, 3*i*(i-1)+3];     %��iȦ��һ��Ԫ�Ľڵ���
    F{(p+2)} = [ 3*(i-1)*(i -2)+2, 3*i*(i-1)+3, 3*(i-1)*(i -2)+3];    %��iȦ�ڶ���Ԫ�Ľڵ���
    
    % ��iȦ������һ������Ԫ�ڵ���
    F{k} = [3*(i-1)*(i -2)+2, 3*i*(i+1)+1, 3*i*(i-1)+2];
    F{(k-1)} = [ 3*i*(i-1)+1, 3*i*(i+1)+1, 3*(i-1)*(i -2)+2];
    
    %��һ�����ڵ����
    for m = 3:1:(2*i - 1)
         F{(p+m)} = F{(p+m-2)} + [1, 1, 1];
    end
    
    delta01{(i-1)} = [1, 2, 2] + [i-2, i-2, i-2];      % ������ŵĵ�Ԫ�Ľڵ�������
    delta02{(i-1)} = [1, 2, 1] + [i-2, i-2, i-2];      % ż����ŵĵ�Ԫ�Ľڵ�������
    
    for s = 1:1:5 % s+1�ڵ����:��ʾ��s+1����
       for m = 1:1:(2*i - 1);
            ii = (p+m+s*(2*i-1)); %��ii��ʾ����ı��ʽ������۲������
           if (ii == k-1)       % Ϊ�˷�ֹ�Ҹĵ�����һ�ڶ���Ԫ����
               break
           end
            
           if (rem(m, 2) ~= 0)
                F{ii} = F{(p+m)} + s*delta01{(i-1)};
            end
            if (rem(m, 2) == 0)
                F{ii} = F{(p+m)} + s*delta02{(i-1)};
            end  
       end
    end
end


x = [];
y = [];
x=[x, 0]; % ��ԭ������Ž�ȥ
y= [y, 0];
%��һȦ
for m =1:1:6
    unit = F{m};
    for k = 1:1:3
        node = unit(k);
        i = 1;
        j = node-(3* i * (i-1) + 2);
        a = R*cos((2*pi*j)/(6*i))*i/n;
        b = R*sin((2*pi*j)/(6*i))*i/n;
        if k>1
            x(k)=a;
            y(k)=b;
        end
       
    end
    figure(1)
    color1 = y_test(m);  %�趨����
    c1 = [color1 color1 color1];
    subplot(1,2,1)
    fill([x(1) x(2) x(3)], [y(1)  y(2) y(3)],c1);
    title('�趨ͼ��')
    ylabel('��Ԫ���ػҶ�')
    axis equal
    hold on
    figure(1)
    color2 = y_test_hat(m);  %�ؽ�����
    c2 = [color2 color2 color2];
    subplot(1,2,2)
    fill([x(1) x(2) x(3)], [y(1)  y(2) y(3)],c2);
    title('�ؽ�ͼ��')
    ylabel('��Ԫ���ػҶ�')
    axis equal
    hold on
end

% ����Ȧ
xx=[];
yy=[];
for m = 7:1:size(F,2) 
    unit = F{m};    %ȡF�е�Ԫ�أ�eg:F{7}=[2,8,9]
    %�ж�unit�е�Ԫ�����ڵ�Ȧ��
    for k = 1:1:3 
        node = unit(k);
        for i = 2:1:n

            if (node>=3* i * (i-1) + 2)&&(node<=3 * i * (i+1) +1) %�ж����ڵ�Ȧ��
                temp_i = i;

            elseif (node>=3* (i-1) * (i-2) + 2)&&(node<=3 * (i-1)* i+1)

                temp_i = i-1;

            end
%             break

              
        end
        j = node-(3*temp_i * (temp_i-1) + 2);
        a = R*cos((2*pi*j)/(6*temp_i))*temp_i/n; %ÿ����Ԫ�Ľڵ��ŵĺ�������
        b = R*sin((2*pi*j)/(6*temp_i))*temp_i/n;

        xx(k)=a;
        yy(k)=b;
        
    end
    figure(1)
    color1 = y_test(m);  
    c1 = [color1 color1 color1];
    subplot(1,2,1)
    fill([xx(1) xx(2) xx(3)], [yy(1)  yy(2) yy(3)],c1);
    axis equal
    hold on
    figure(1)
    color2 = y_test_hat(m);  
    c2 = [color2 color2 color2];
    subplot(1,2,2)
    fill([xx(1) xx(2) xx(3)], [yy(1)  yy(2) yy(3)],c2);
    axis equal
    hold on
   
end
end

