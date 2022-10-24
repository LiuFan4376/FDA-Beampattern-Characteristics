%% FDA波束时变特性研究
clc;clear ;close;


%% ------均匀线性FDA雷达参数设置
j=sqrt(-1);
M=12; %发射阵元数目
f0=2e9; %载波中心频率
delta_f=2000; %相邻阵元频率偏移
c=3e8;        %光速
lamda=c/f0;  %波长
d=lamda/2;    %阵元间距
Ru=c/delta_f;  %最大无模糊距离
theta=(0:1:90)*pi/180; %测量角度向量
R=linspace(0,2*Ru,1000); %测量距离向量
f=f0+(0:M-1)*delta_f; %阵元载频向量（均匀线性增加）
R0 = 1e5;
theta0 = 0;  %天线指向目标的角度和距离
T=Ru/c; %距离维时间的周期
t=linspace(0,2*T,10/(2*T));

%% -----FDA不同时间下峰值点处的增益大小变化图
 P1 = zeros(length(t));
 for n = 1 : length(t)
     a2=exp(-j*2*pi/c*(delta_f*(R0-t(n)*c)-f0*d*sin(theta0))*(0:M-1)'); %导向矢量
     w=exp(-j*2*pi/c*(delta_f*R0-f0*d*sin(theta0))*(0:M-1)');
     P1(n) =w'*a2;
 end

figure(1);
plot(t*1000,abs(P1)/max(abs(P1)),'LineWidth',1);
xlabel('时间/ms'); ylabel('增益大小'); 
title('');




