h=[(1+sqrt(3))/(4*sqrt(2)),(3+sqrt(3))/(4*sqrt(2)),(3-sqrt(3))/(4*sqrt(2)),(1-sqrt(3))/(4*sqrt(2))];
% x=[4 2 3 3 4 5 5 7 6 4 2 3 4];
% x=[2 4 3 3];
x=[3 4 5 5 7 0 0]

c=0;d=0;

for n1=1:8
%     for n2=1:8
%         for n3=1:8
%             for n4=1:8
    c=h(1)*x(n1)+h(2)*x(n1+1)+h(3)*x(n1+2)+h(4)*x(n1+3);
    d=h(4)*x(n1)-h(3)*x(n1+1)+h(2)*x(n1+2)-h(1)*x(n1+3);
%                 c=h(1)*x(n1)+h(2)*x(n2)+h(3)*x(n3)+h(4)*x(n4);
%                 d=h(4)*x(n1)-h(3)*x(n2)+h(2)*x(n3)-h(1)*x(n4);
                if c==8.1664 %&& d==-0.6124
                    n=[n1,n2,n3,n4]
                    break;
                end
%             end
%         end
%     end
end
        