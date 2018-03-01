function x_recon=invDaubechiesTrans2(A,n)

level=size(A,1);
for  i = level:-1:1
    m = 1 ;
    x = [0;x];
    A{i,2} = [0;A{i,2}];
    for o = 1:(n-1)
        y(m,1) =h0 * x(o+1,1)+h2*x(o,1) + h3*A{i,2}(o+1,1) + h1*A{i,2}(o,1);
        y(m+1,1) = h1 * x(o+1,1)+h3*x(o,1) - h2*A{i,2}(o+1,1) - h0*A{i,2}(o,1);
        m = m+2;
    end
    x_recon = y;
    x = y;
    n = length(y);
    y = 0;
end