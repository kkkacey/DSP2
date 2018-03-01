function h=SpectralFactorization_2(p)

r=roots(p);

% Method 2
[~,k]=sort(angle(r));
rh=r(k(1:2:end));
h=poly(rh);