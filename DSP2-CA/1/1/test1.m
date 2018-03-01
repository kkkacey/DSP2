clear;

x=[3 4 5 5 7 6 4 2];
% x=[3 4 5 5 7 6 4 2 8];
level=3;

w=HaarTrans(x,level);
xo=invHaarTrans(w);
% error=x-xo;
% stem(error);ylim([0 1]);