function n = ButterOrder(Amax, Amin, ratio)

% Calculate filter order
n = log((10^(Amin/10)-1)/(10^(Amax/10)-1))/(2*log(ratio));
n = ceil(n);

fprintf('Butter Order = %d\n', n);
