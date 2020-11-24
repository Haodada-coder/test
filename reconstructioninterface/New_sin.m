function newsin = New_sin(x)
%使用sinx的泰勒展开式求解
double sum;
double a;
double b; %//sum代表和，a为分子，b为分母
double p;
char s ;
s=1; 
sum=0;
a=x;     %//分母赋初值
b=1;     %//分子赋初值
p=1;
 while abs(a/b) >= 1e-6
 %while a/b >= 1e-6
  sum = sum+s*(a/b);    %//累加一项
  a = a*x*x;     %//求下一项分子
  b = b*2*p*(2*p+1);   %//求下一项分母
  s = s*(-1);
  p = p+1;
 end
 newsin = sum;