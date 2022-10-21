%% 均匀线性（ula）频控阵（FDA）波束方向图
clc;clear ;close;


%% ------均匀线性FDA雷达参数设置
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
t=Ru/c; %距离维时间的周期
T=linspace(0,2*t,500);
Delta_f=(0:M-1)*delta_f;
D=d*(0:M-1);

% -----FDA波束方向图
P1 = zeros(length(theta),length(R)); %波束方向图

 for n = 1 : length(theta)
    for m = 1 : length(R)
         a1=exp(-j*2*pi/c*(delta_f*R(m)-f0*d*sin(theta(n)))*(0:M-1)'); %导向矢量
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d*sin(theta0))*(0:M-1)');
        P1(n,m) =w'*a1;
    end
 end
 
P1=P1';
figure(1); 
imagesc(theta*180/pi,R,abs(P1)/max(max(abs(P1)))); 
xlabel('\theta^o'); ylabel('R/m'); 
axis tight; axis xy;
title('');
colorbar;


%% -----FDA时间角度维波束方向图

% T=linspace(0,2e-3,1000);
P2 = zeros(length(theta),length(T)); %波束方向图
 for n = 1 : length(theta)
    for m = 1 : length(T)
         a2=exp(-j*2*pi/c*(-Delta_f'*T(m)*c-D'*f0*sin(theta(n)))); %导向矢量
         w2=exp(-j*2*pi/c*(-Delta_f'*T(1)*c-D'*f0*sin(theta0))); 
        P2(n,m) =w2'*a2;
    end
 end
%% 画图：时间角度维
P2=P2';
figure(2); 
imagesc(T,theta*180/pi,abs(P2)/max(max(abs(P2)))); 
ylabel('\theta^o'); xlabel('时间/s'); 
axis tight; axis xy;
title('');
colorbar;


% --------------FDA时间距离维波束方向图     
P3 = zeros(length(R),length(T)); %波束方向图
 for n = 1 : length(R)
    for m = 1 : length(T)
         a3=exp(-j*2*pi/c*(-Delta_f'*T(m)*c+Delta_f'*R(n))); %导向矢量
         w3=exp(-j*2*pi/c*(-Delta_f'*T(100)*c+Delta_f'*R0)); 
        P3(n,m) =w3'*a3;
    end
 end
%% 画图：时间距离维波束方向图
 P3=P3';
figure(3); 
imagesc(T,R,abs(P3)/max(max(abs(P3)))); 
ylabel('R/m'); xlabel('时间/s'); 
axis tight; axis xy;
title('');
colorbar;


% %% ---相控阵波束方向图
% % w=exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta0));
% P0 = zeros(1,length(theta));
% for n = 1 : length(theta)
%     a = exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta(n)));
%     w=exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta0));
%     P0(n) =w'*a;
% end
% figure(2); 
% imagesc(theta*180/pi,R,abs(P0)/max(max(abs(P0)))); 
% xlabel('\theta^o'); ylabel('R/m'); 
% axis tight; axis xy;
% axis([-90 90 0 2*Ru]);
% title('');
% colorbar;




















