function [w,Lx]=DaubechiesTrans(x,level)
% Daubechies Transform
% x: input signal
% level: levels of transform
% w: datasets of wavelets

Lx=length(x);
x=[0,0,x,0,0];
L=length(x);
w=cell(level+1,1);
h=[(1+sqrt(3))/(4*sqrt(2)),(3+sqrt(3))/(4*sqrt(2)),(3-sqrt(3))/(4*sqrt(2)),(1-sqrt(3))/(4*sqrt(2))];
c=zeros(1,floor(L/2));
d=zeros(1,floor(L/2));
for i=1:level
    m=1;
    for n=1:2:L-2
        if n+3>L
            break;
        end
        c(m)=h(1)*x(n)+h(2)*x(n+1)+h(3)*x(n+2)+h(4)*x(n+3);
        d(m)=h(4)*x(n)-h(3)*x(n+1)+h(2)*x(n+2)-h(1)*x(n+3);
        x(m)=c(m);
        m=m+1;
    end
    w{level+2-i}=d(1:floor(L/2));
    L=floor(L/2);
end
w{1}=c(1:L);
