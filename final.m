%% Design FIR Filter
N = 61;
w1 = 2*pi/5;
w2 = pi/2;
n = (-N+1)/2:(N-1)/2;
h_BP = (sin(w1*n)- sin(w2*n))./(pi*n);
h_BP((N-1)/2+1) = 1 +(w1-w2)/pi;

plot(n,h_BP);
title('Pulse Respones');
freqz(h_BP);

h_Pbp = h_BP.*hamming(N)';
plot(n,h_Pbp);
title('Pulse Respones');
freqz(h_Pbp);

% sin signal
w1 = pi/5;
w2 = 9*pi/20;
w3 = pi/10;
k = 0:999;
x1= sin(w1*k);
x2 = sin(w2*k);
x3 = sin(w3*k);
figure;
plot(x1(1:200),'b');
y1 = conv(x1,h_Pbp);
hold on;
plot(y1(1:200),'red');

plot(x2(1:200),'b');
y2 = conv(x2,h_Pbp);
hold on;
plot(y2(1:200),'red');

plot(x3(1:200),'b');
y3 = conv(x3,h_Pbp);
hold on;
plot(y3(1:200),'red');

Tg = grpdelay(h_Pbp);

%% IIR Filter
%% Analog Filter Theoretically
s=tf('s');
H=(0.189119)/((s+0.574)*(s^2+0.574*s+0.32947741));

%% Digital Filter Theoretically
T=1;
[num,den]=zp2tf([-1,-1,-1]',[0.559874362,(0.670169801+0.3629765954*i),(0.670169801-0.3629765954*i)],0.01325);
freqz(num,den)
%% Designing Digital Filter Practically 

wp=(1/6);
ws=(1/4);
% defining the order and the cutoff frequency 
[n,wn]=buttord(wp,ws,3,10);
% designing the normalized filter
[z1,p1,k1]=buttap(3);
[num1,den1]=zp2tf(z1,p1,k1);
% designing the desired filter by setting the cutoff frequency
[numt,dent]=lp2lp(num1,den1,wn*pi);
% moving from analog filter to digital filter
[numd,dend]=bilinear(numt,dent,1);
%% Comparing Practial design with the Theoritcal design 
% Comparing analg filters
H1=tf(numt,dent);
bode(H1);
title('Practically');
figure;
bode(H);
title('Theoretically');
% Comparing digital filters 
freqz(numd,dend)
title('Practically');
figure;
freqz(num,den);
title('Theoretically');