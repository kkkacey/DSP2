function xo=invHaarTrans(w)
% inverse Haar Transform
% w: output arguments 
% x: input signal

lev=size(w,1);
xo=w{1};
% if L/2~=0
%     xo(L)=w(1,L);
% end
for i=2:lev
    for n=1:length(w{i})
        xo(2*n-1)=1/sqrt(2)*w{1}(n)+1/sqrt(2)*w{i}(n);
        xo(2*n)=1/sqrt(2)*w{1}(n)-1/sqrt(2)*w{i}(n);
    end 
    w{1}=xo;
end