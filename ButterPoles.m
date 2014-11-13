function poles = ButterPoles(Amax, n, pass_type)

% Calculate w0 using calculated order and normalized wp
w0 = 1 / ((10^(Amax/10)-1)^(1/(2*n)));

% Find all poles
k = 0:((2*n));
poles = w0 .* exp((1i.*(2.*k+abs(mod(n,2)-1)).*pi)./(2*n));

% odd: exp((j*pi*(2*k+0))/(2*n)))
% even: exp((j*pi*(2*k+1))/(2*n)))

%poles = poles(imag(poles) >= 0);
poles = -1.*poles(real(poles) < 0);

% Find reciprocal of w0 with same angle for highpass filter
if (strcmpi(pass_type, 'highpass') || strcmpi(pass_type, 'notchpass'))
    poles = 1./poles;  % Side effect: reflects poles about the x axis
end