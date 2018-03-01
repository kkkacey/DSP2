clear;
close all;

load('ecg.txt');
cs=ecg;
load('ecg_noisy.txt');
ns=ecg_noisy;

order=3;
w0=0.3;

h=butter(order,w0);
y=filter(h,1,ns);

subplot(3,1,1)
plot(ns);title('noisy signal');
subplot(3,1,2)
plot(y);title(['filtered signal, cut-off=',num2str(w0)]);
subplot(3,1,3)
plot(cs);title('clean signal');

figure;
plot(ns);
hold on
plot(y,'r');
hold off
legend('noisy signal',['filtered signal, cut-off=',num2str(w0)]);

figure;
subplot(2,1,1)
[H,w]=freqz(ns);
plot(w/pi,abs(H));title('frequency response of noisy signal');
subplot(2,1,2)
[H,w]=freqz(y);
plot(w/pi,abs(H));title('frequency response of filtered signal');

figure;
zplane(h);title('pole/zero diagram of the filter')