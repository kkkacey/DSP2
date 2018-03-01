clear;
close all;

p = [-3.00,1.60,0.17,1.07,3.56,5.74,15.36,5.74,3.56,1.07,0.17,1.60,-3.00];

% Method 1: real-valued h(n)
% h=SpectralFactorization_1(p);
% h=real(h); 
% h=h*sqrt(max(p)/sum(abs(h).^2));
% hr=(h(end:-1:1)); 
% v=conv(h,hr);

% Method 2: complex h(n)
h_complex=SpectralFactorization_2(p);
h=h_complex*sqrt(max(p)/sum(abs(h_complex).^2));
hr=conj(h(end:-1:1)); 
v=conv(h,hr);

subplot(1,3,1)
zplane(p);title('P(z)');
subplot(1,3,2)
zplane(h);title('H(z)');
subplot(1,3,3)
zplane(hr);title('H(1/z)');

figure;
stem(abs(h));title('impulse response of h')

n=1:length(p);
figure;
stem(n,real(v));hold on
stem(n+0.3,p,'o');
legend('convolution of h','p(shifted to show)');
hold off
