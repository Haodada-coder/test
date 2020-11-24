function

t=0.01:0.01:2*pi;
figure;
plot(t,sin(t),'--r');
pan on;	
a = 2;

x=0.1:0.8:2*pi;
y=sin(x);
figure;
line(x,y);

% clear all;
% x=0:0.02:2*pi;
% y=sin(2*x).*cos(2*x);
% figure;
% polar(x,y,'--r');  
% 
% 
% clear all;
% x=0.1:0.1:2*pi;
% y=sin(x);
% z=10.^x;
% figure;
% plotyy(x,y,x,z);


