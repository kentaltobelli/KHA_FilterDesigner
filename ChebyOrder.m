function n = ChebyOrder(Amax, Amin, ratio)

% Calculate filter order
x = sqrt(((10^(Amin/10))-1)/((10^(Amax/10))-1));
n = acosh(x) / (acosh(ratio));
n = ceil(n);

fprintf('Cheby Order = %d\n', n);