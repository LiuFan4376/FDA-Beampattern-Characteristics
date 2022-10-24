%% FDA距离维波束方向图研究


%%
clc;clear ;close;

%% ------均匀线性FDA雷达参数设置(时间t=0)
j=sqrt(-1);
M=12; %发射阵元数目
f0=2e9; %载波中心频率
delta_f=3000; %相邻阵元频率偏移
c=3e8;        %光速
lamda=c/f0;  %波长
d=lamda/2;    %阵元间距
Ru=c/delta_f;  %最大无模糊距离
theta=(-90:1:90)*pi/180; %测量角度向量
R=linspace(0,3e5,1000); %测量距离向量
f=f0+(0:M-1)*delta_f; %阵元载频向量（均匀线性增加）
R0 = 1e5;
theta0 = 30/180*pi;  %%天线指向目标的角度和距离

%% 不同大小频偏下FDA距离维波束方向图对比

%% -----FDA距离维波束方向图 delta_f1=2000HZ
delta_f1=2000;
% Ru=c/delta_f1;
P1 = zeros(length(R)); %波束方向图
    for m = 1 : length(R)
         a1=exp(-j*2*pi/c*(delta_f1*R(m)-f0*d*sin(theta0))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f1*R0-f0*d*sin(theta0))*(0:M-1)');
        P1(m) =w'*a1;
    end
    
%% -----FDA距离维波束方向图 \deltaf_2=3000HZ
delta_f2=3000;
% Ru=c/delta_f2;
P2 = zeros(length(R)); %波束方向图
    for m = 1 : length(R)
         a2=exp(-j*2*pi/c*(delta_f2*R(m)-f0*d*sin(theta0))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f2*R0-f0*d*sin(theta0))*(0:M-1)');
        P2(m) =w'*a2;
    end
 %% -----FDA距离维波束方向图 delta_f3=5000HZ
delta_f3=5000;
% Ru=c/delta_f2;
P3 = zeros(length(R)); %波束方向图
    for m = 1 : length(R)
         a3=exp(-j*2*pi/c*(delta_f3*R(m)-f0*d*sin(theta0))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f3*R0-f0*d*sin(theta0))*(0:M-1)');
        P3(m) =w'*a3;
    end   
    
 %% 画图   
 figure(1);
 plot(R,abs(P1)/max(abs(P1)),'x-',R,abs(P2)/max(abs(P2)),'s-',R,abs(P3)/max(abs(P3)),'d-','LineWidth',1);
xlabel('距离/m'); ylabel('归一化幅度'); 
title('');
axis([0.5e5,1.5e5,0,1]);
 legend('\Deltaf_1=2000Hz','\Deltaf_2=3000Hz','\Deltaf_3=5000Hz');
 
 figure(2)
 plot(R,abs(P1)/max(abs(P1)),'x-',R,abs(P2)/max(abs(P2)),'s-',R,abs(P3)/max(abs(P3)),'d-','LineWidth',1);
xlabel('距离/m'); ylabel('归一化幅度'); 
title('');
axis([1e5,3e5,0,1]);
 legend('\Deltaf_1=2000Hz','\Deltaf_2=3000Hz','\Deltaf_3=5000Hz');
 
 
 
 
 
 
 
 
 
 
 
 
 
 