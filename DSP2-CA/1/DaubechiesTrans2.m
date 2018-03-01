function [A,n]=DaubechiesTrans2(x,level)
n = length (x);
A = cell(level,2);

h0 = (1+sqrt(3))/4/sqrt(2);
h1 = (3+sqrt(3))/4/sqrt(2);
h2 = (3-sqrt(3))/4/sqrt(2);
h3 = (1-sqrt(3))/4/sqrt(2);

for i = 1:level
    x = [x;zeros(2,1)];
    for o = 0:(n/2-1)
        A{i,1}(o+1,1) = h0 * x(2*o+1,1) + h1 * x(2*o+2,1)+ h2 * x(2*o+3,1)+ h3 * x(2*o+4,1);
        A{i,2}(o+1,1) = h3 * x(2*o+1,1) - h2 * x(2*o+2,1)+ h1 * x(2*o+3,1)- h0 * x(2*o+4,1);
        
    end
    x = A{i,1};
    n = length(x);
    
end