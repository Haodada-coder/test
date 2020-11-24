function code02()
load('y_text')
load('y_text_hat')
%图像重建

n = 15;%总圈数
R = 15; %半径

% i=1，第一圈节点编码
F{1} = [1, 2, 3]; %F的下标用{}来表示
F{6} = [1, 7, 2];
for j=2:1:5
    F(j) = {[0, 0, 0]};
    F{j} = F{(j-1)} + [0, 1, 1];
end

% i >= 2.其他圈节点编码,i表示圈数
for i = 2:1:n
    k = 6*i*i;
    p = 6*(i-1)*(i-1);
    F{(p+1)} = [3*(i-1)*(i -2)+2, 3*i*(i-1)+2, 3*i*(i-1)+3];     %第i圈第一单元的节点编号
    F{(p+2)} = [ 3*(i-1)*(i -2)+2, 3*i*(i-1)+3, 3*(i-1)*(i -2)+3];    %第i圈第二单元的节点编号
    
    % 第i圈倒数第一二个单元节点编号
    F{k} = [3*(i-1)*(i -2)+2, 3*i*(i+1)+1, 3*i*(i-1)+2];
    F{(k-1)} = [ 3*i*(i-1)+1, 3*i*(i+1)+1, 3*(i-1)*(i -2)+2];
    
    %第一分区节点编码
    for m = 3:1:(2*i - 1)
         F{(p+m)} = F{(p+m-2)} + [1, 1, 1];
    end
    
    delta01{(i-1)} = [1, 2, 2] + [i-2, i-2, i-2];      % 奇数序号的单元的节点编号增量
    delta02{(i-1)} = [1, 2, 1] + [i-2, i-2, i-2];      % 偶数序号的单元的节点编号增量
    
    for s = 1:1:5 % s+1节点编码:表示第s+1分区
       for m = 1:1:(2*i - 1);
            ii = (p+m+s*(2*i-1)); %用ii表示后面的表达式，方便观察与调试
           if (ii == k-1)       % 为了防止乱改倒数第一第二单元数据
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
x=[x, 0]; % 将原点坐标放进去
y= [y, 0];
%第一圈
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
    color1 = y_test(m);  %设定流型
    c1 = [color1 color1 color1];
    subplot(1,2,1)
    fill([x(1) x(2) x(3)], [y(1)  y(2) y(3)],c1);
    title('设定图像')
    ylabel('单元像素灰度')
    axis equal
    hold on
    figure(1)
    color2 = y_test_hat(m);  %重建灵型
    c2 = [color2 color2 color2];
    subplot(1,2,2)
    fill([x(1) x(2) x(3)], [y(1)  y(2) y(3)],c2);
    title('重建图像')
    ylabel('单元像素灰度')
    axis equal
    hold on
end

% 其它圈
xx=[];
yy=[];
for m = 7:1:size(F,2) 
    unit = F{m};    %取F中的元素，eg:F{7}=[2,8,9]
    %判断unit中的元素所在的圈数
    for k = 1:1:3 
        node = unit(k);
        for i = 2:1:n

            if (node>=3* i * (i-1) + 2)&&(node<=3 * i * (i+1) +1) %判断所在的圈数
                temp_i = i;

            elseif (node>=3* (i-1) * (i-2) + 2)&&(node<=3 * (i-1)* i+1)

                temp_i = i-1;

            end
%             break

              
        end
        j = node-(3*temp_i * (temp_i-1) + 2);
        a = R*cos((2*pi*j)/(6*temp_i))*temp_i/n; %每个单元的节点编号的横纵坐标
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

