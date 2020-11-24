function h1 = three_d_plot(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3)
figure
h1 = scatter3(subs(X1),subs(Y1),subs(Z1),'*','r');
hold on
h2 = scatter3(subs(X2),subs(Y2),subs(Z2),'+','b');
hold on
h3 = scatter3(subs(X3),subs(Y3),subs(Z3),'x','g');
legend('one','two','three','Location','northoutside')
xlabel('x_Öá')
ylabel('y_Öá')
zlabel('z_Öá')
xticks(0:0.2:1)
yticks(0:0.2:1)
zticks(0:0.2:1)
set(gca,'XDir','reverse')
baspect([1.5 2 1])
view(60,20)
saveas(h1,'save_path','jpg')