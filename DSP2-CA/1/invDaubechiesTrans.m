function xo=invDaubechiesTrans(w,L)

lev=size(w,1);
xo=w{1};
h=[(1+sqrt(3))/(4*sqrt(2)),(3+sqrt(3))/(4*sqrt(2)),(3-sqrt(3))/(4*sqrt(2)),(1-sqrt(3))/(4*sqrt(2))];
for i=2:lev
%     if(length(w{i})==1)
%         w{i}=[0,w{i}];
%         w{1}=[0,w{1}];
%     end
    m=1;
    for n=1:length(w{i})-1
        if m>=L
            break;
        end
        w{1}=[w{1},0];
        w{i}=[w{i},0];
%         xo(m)=h(1)*w{1}(n)+h(3)*w{1}(n-1)+h(4)*w{i}(n)+h(2)*w{i}(n-1);
%         xo(m+1)=h(2)*w{1}(n)+h(4)*w{1}(n-1)-h(3)*w{i}(n)-h(1)*w{i}(n-1);
        xo(m)=h(1)*w{1}(n+1)+h(3)*w{1}(n)+h(4)*w{i}(n+1)+h(2)*w{i}(n);
        xo(m+1)=h(2)*w{1}(n+1)+h(4)*w{1}(n)-h(3)*w{i}(n+1)-h(1)*w{i}(n);
        m=m+2; 
    end
    w{1}=xo;
end
xo=xo(1:L);