clear;

% x=[3 4 5 5 7 6 4 2];
% x=[3 4 5 5 7 6 4 2 8];
x=[zeros(1,9),10,zeros(1,9)];
% x=[3 4 5 5 7];
% x=[1];
% x=100:-1:1;
% x=[5*ones(1,100)+3*rand(1,100)];
level=2;

[w,L]=DaubechiesTrans(x,level);
xo=invDaubechiesTrans(w,L);
error=x-xo;
stem(error,'.');

% [CA,CD]=dwt(x,'db2');
% [CA,CD]=dwt(CA,'db2');
% error2=w{1}(1:length(CA))-CA;
% stem(error2);