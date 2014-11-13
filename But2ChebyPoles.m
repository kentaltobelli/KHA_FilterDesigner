function cheby_poles = But2ChebyPoles(Amax, n, pass_type, poles)

% Define the minor and major axis of the Chebychev pole ellipse
eps = sqrt(10^(Amax/10)-1);
temp = ((1/eps)+sqrt((1/eps^2)+1));
a = .5 * (temp^(1/n) - temp^(-1/n));
b = .5 * (temp^(1/n) + temp^(-1/n));

% Find the values of the vectors and split into magnitudes and angles
cheby_poles = a.*cos(angle(poles)) - 1i.*b.*sin(angle(poles));

% Find reciprocal of w0 with same angle for highpass filter
if (strcmpi(pass_type, 'highpass') || strcmpi(pass_type, 'notchpass'))
    cheby_poles = 1./cheby_poles;  % Side effect: reflects poles about the x axis
end