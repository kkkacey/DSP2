
w=-pi:0.01:pi;
% wc=0.5;
wc=0.99;
k=1;
a=1/(tan(wc/2)^(2*k));
p=1./(1+a*(tan(w/2).^(2*k)));

plot(w/pi,p,wc/pi,0.5,'o');
title(['wc=',num2str(wc)]);
xlabel('x/\pi');ylabel('P(\omega)');
