function xo=Thresholding(x,thold)
% a tresholding function for noise deduction of wavelet transforms
% x: wavelet transformed signal
% hold: value of threshold
% xo: output signal

xo=x;
for n=1:length(x)
    if abs(x(n))<thold
        xo(n)=0;
    elseif x(n)>thold
        xo(n)=x(n)^2-sqrt(thold);
    else
        xo(n)=-x(n)^2+sqrt(thold);
    end
end
