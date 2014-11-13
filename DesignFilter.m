function DesignFilter(filter_domain, filter_style, pass_type, Amax, Amin, wp1, wp2, ws1, ws2)
% For the analog domain
if (strcmpi(filter_domain, 'analog'))
    % Make filter symmetric
    if (strcmpi(pass_type, 'bandpass'))
        if (ws1 < (wp1*wp2)/ws2)
            ws1 = (wp1*wp2)/ws2;  % Fixes stopband skewed to the left
        else
            ws2 = (wp1*wp2)/ws1;  % Fixes stopband skewed to the right
        end
    elseif (strcmpi(pass_type, 'notchpass'))
        if (wp2 < (ws1*ws2)/wp1)
            wp2 = (ws1*ws2)/wp1;  % Fixes passband skewed to the left
        else
            wp1 = (ws1*ws2)/wp2;  % Fixes passband skewed to the right
        end
    end
    
    % Find wp and ws
    wp = wp2 - wp1;
    ws = ws2 - ws1;
    
    % Normalize wp and ws
    if (strcmpi(pass_type, 'lowpass') || strcmpi(pass_type, 'bandpass'))
        ratio = ws/wp;
    else
        ratio = wp/ws;
    end
    
    % Find filter poles
    if (strcmpi(filter_style, 'butterworth'))
        n = ButterOrder(Amax, Amin, ratio);
        poles = ButterPoles(Amax, n, pass_type);
        coef = wp;
    elseif (strcmpi(filter_style, 'chebyshev'))
        n = ChebyOrder(Amax, Amin, ratio);
        poles = ButterPoles(Amax, n, pass_type);
        poles = But2ChebyPoles(Amax, n, pass_type, poles);
        coef = wp;
    end
    
    % Change to band or notch pass poles from low or highpass prototypes
    if (strcmpi(pass_type, 'bandpass') || strcmpi(pass_type, 'notchpass'))
        n = 2*n;
        CF = sqrt(wp1*wp2);
        poles = ProtoConvert(CF, wp, poles);
        coef = CF;
    end
    
    % Display poles
    DispPoles(n, coef, poles);
    
end