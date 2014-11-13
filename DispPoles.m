function DispPoles(n, coef, poles)

% Display poles
for m=1:ceil(n)
    fprintf('w0 = %.2f, Q = %.4f\n', coef*(abs(poles(m))), 1./(2*cos(angle(poles(m)))));
end