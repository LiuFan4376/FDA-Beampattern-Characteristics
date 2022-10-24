%% FDA雷达角度维波束方向图研究

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
theta=(-90:0.1:90)*pi/180; %测量角度向量
R=linspace(0,2*Ru,1000); %测量距离向量
f=f0+(0:M-1)*delta_f; %阵元载频向量（均匀线性增加）
R0 = 1e5;
theta0 = 30/180*pi;  %%天线指向目标的角度和距离

%% -----FDA角度维波束方向图 (d1=0.2*lamda)
d1=0.2*lamda; %相邻阵元间距
P1 = zeros(length(theta)); %波束方向图
    for m = 1 : length(theta)
         a1=exp(-j*2*pi/c*(delta_f*R0-f0*d1*sin(theta(m)))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d1*sin(0))*(0:M-1)'); %加权矢量
        P1(m) =w'*a1;
    end
    
%% -----FDA角度维波束方向图 (d2=0.5*lamda)
d2=0.5*lamda;%
P2 = zeros(length(theta)); %波束方向图
    for m = 1 : length(theta)
         a2=exp(-j*2*pi/c*(delta_f*R0-f0*d2*sin(theta(m)))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d2*sin(0))*(0:M-1)'); %加权矢量
        P2(m) =w'*a2;
    end
    
%% -----FDA角度维波束方向图 (d3=0.8*lamda)
d3=0.9*lamda;%
P3 = zeros(length(theta)); %波束方向图
    for m = 1 : length(theta)
         a3=exp(-j*2*pi/c*(delta_f*R0-f0*d3*sin(theta(m)))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d3*sin(0))*(0:M-1)'); %加权矢量
        P3(m) =w'*a3;
    end   
%% -----FDA角度维波束方向图 (d4=0.8*lamda)
d4=lamda;%
P4= zeros(length(theta)); %波束方向图
    for m = 1 : length(theta)
         a4=exp(-j*2*pi/c*(delta_f*R0-f0*d4*sin(theta(m)))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d4*sin(0))*(0:M-1)'); %加权矢量
        P4(m) =w'*a4;
    end   
%% 画图   
 figure(1);
plot((-90:0.1:90),abs(P1)/max(abs(P1)),'.-',...
(-90:0.1:90),abs(P2)/max(abs(P2)),'x-',...
(-90:0.1:90),abs(P3)/max(abs(P3)),'s-',...
(-90:0.1:90),abs(P4)/max(abs(P4)),'d-','LineWidth', 1);
xlabel('角度/^o'); ylabel('归一化幅度'); 
axis([-90,90,0,1]);
legend('d_1=0.2\lambda','d_2=0.5\lambda','d_3=0.8\lambda','d_4=\lambda');

