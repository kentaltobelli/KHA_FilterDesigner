function DispPoles(filter_domain, n, poles)

if (strcmpi(filter_domain, 'analog'))
    % Display analog poles
    for m=1:ceil(n)
        fprintf('w0 = %.2f, Q = %.4f\n', (abs(poles(m))), 1./(2*cos(angle(poles(m)))));
    end
else
    % Display digital poles
    for m=1:ceil(n)
        %fprintf('1 + (%.4f)z^(-1) + (%.4f)z^(-2)\n', -2*real(poles(m)), (abs(poles(m)))^2);
        fprintf('1  %.4f  %.4f\n', -2*real(poles(m)), (abs(poles(m)))^2);
    end
end