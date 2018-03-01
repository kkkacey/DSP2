function h=SpectralFactorization_1(p)

r=roots(p);

% Method 1
RN=0.0001;
r1 = r( abs(abs(r)-1) <= RN );    %roots on the unit cicle
r2 = r( 1 - abs(r) > RN );   % roots inside unit circle
[~,k]=sort(angle(r1));
rh=[r2;r1(k(1:2:end))];
h=poly(rh);

