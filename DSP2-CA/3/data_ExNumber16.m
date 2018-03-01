
x = [
    0.1933
    0.3866
    0.5799
    0.7732
    0.9665
    1.1598
    1.3531
    1.5464
    1.7397
    1.9330
    2.1263
    2.3196
    2.3956
    2.3715
    2.2645
    2.0917
    1.8704
    1.6178
    1.3510
    1.0872
    0.8437
    0.6375
    0.4860
    0.4063
    0.4155
    0.5310
    0.7698
    1.1491
    1.6863
    2.3983
];
    
N = length(x);

figure(1)
clf
subplot(4, 1, 1)
plot(0:N-1, x, '.-', 'markersize', 12)
% xlabel('n')
% ylabel('x(n)')
title('input signal')

orient landscape
print -dpdf data_ExNumber16


h1=[1,1]/2;
h2=[1,2,1]/4;
h3=[1,3,3,1]/8;

up=upsample(x,2);
y1=filter(h1,1,up);
M=length(y1);
subplot(4,1,2)
plot(0:M-1,y1, '.-', 'markersize', 12)
title('h1 filtered');
y2=filter(h2,1,up);
subplot(4,1,3)
plot(0:M-1,y2, '.-', 'markersize', 12)
title('h2 filtered');
y3=filter(h3,1,up);
subplot(4,1,4)
plot(0:M-1,y3, '.-', 'markersize', 12)
title('h3 filtered');
