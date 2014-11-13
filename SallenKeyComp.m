function SallenKeyComp(circuit_case, filter_pass, w0, Q, R, C)

if (circuit_case == 1)
    R = 1 / (w0*C);
    Gain = 3 - (1/Q);
    fprintf('For w0 = %.2f & Q = %.4f:\n', w0, Q);
    fprintf(' R = %.1fOhms\n', R);
    fprintf(' C = %.4fuF\n', C * 10^6);
    fprintf(' Gain = %.2f\n', Gain);
elseif (circuit_case == 2)
    if (strcmpi(filter_pass, 'lowpass'))
        Ceq = 1 / (w0*R);
        C2 = 2*Q*Ceq;
        C1 = Ceq/(2*Q);
        fprintf('For w0 = %.2f & Q = %.4f:\n', w0, Q);
        fprintf(' R = %.1fOhms\n', R);
        fprintf(' C1 = %.4fuF\n', C1 * 10^6);
        fprintf(' C2 = %.4fuF\n', C2 * 10^6);
    elseif (strcmpi(filter_pass, 'highpass'))
        Req = 1 / (w0*C);
        R1 = 2*Q*Req;
        R2 = Req/(2*Q);
        fprintf('For w0 = %.2f & Q = %.4f:\n', w0, Q);
        fprintf(' R1 = %.1fOhms\n', R1);
        fprintf(' R2 = %.1fOhms\n', R2);
        fprintf(' C = %.4fuF\n', C * 10^6);
    end
end
