% Sallen Key Realization designer
fprintf('Welcome to the Sallen-Key Filter designer!\n\n');

% Get the case type to design
circuit_case = input('Which case would you like to design? ');
while ~(circuit_case == 1 || circuit_case == 2)
    fprintf('ERROR: invalid input\n');
    fprintf('  - 1 for Design Case 1\n');
    fprintf('  - 2 for Design Case 2\n');
    circuit_case = input('Which case would you like to design? ');
end

% Get filter type
filter_pass = input('What type of filter? ','s');
while ~(strcmpi(filter_pass, 'lowpass') || strcmpi(filter_pass, 'highpass'))
    fprintf('ERROR: %s not recognized\n', filter_pass);
    fprintf('  - lowpass\n');
    fprintf('  - highpass\n');
    filter_pass = input('What type of filter? ','s');
end

% Get filter values
w0 = input('w0(r/s)? ');
Q = input('Q? ');
if (circuit_case == 1 || (circuit_case == 2 && strcmpi(filter_pass, 'highpass')))
    R = 0;
    C = 10^(-6) * input('C(uF)? ');
elseif (circuit_case == 2 && strcmpi(filter_pass, 'lowpass'))
    R = input('R(Ohms)? ');
    C = 0;
end

% Calculate component values
SallenKeyComp(circuit_case, filter_pass, w0, Q, R, C);