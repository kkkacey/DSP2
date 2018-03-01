function w=HaarTrans(x,level)
% Haar Transform
% x: input signal
% level: levels of transform
% w: datasets of wavelets

L=length(x);
% w0=zeros(level+1,L);
w=cell(level+1,1);
% if L/2~=0
%     w{1}(L)=x(L);   
% end
c=zeros(1,floor(L/2));
d=zeros(1,floor(L/2));
for i=1:level
    for n=1:floor(L/2)
        c(n)=1/sqrt(2)*x(2*n)+1/sqrt(2)*x(2*n-1);
        d(n)=1/sqrt(2)*x(2*n-1)-1/sqrt(2)*x(2*n);
%         w0(level+2-i,n)=d(n);
        x(n)=c(n);
    end
    w{level+2-i}=d(1:floor(L/2));
    L=floor(L/2);
end
% w0(1,1:L)=c(1:L);
w{1}(1:L)=c(1:L);

