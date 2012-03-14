function T = FlorianLuethi_i10b_S10_Aufg2( f, a, b, n )
%UNTITLED Implementiert die Romberg-Extrapolation der summierten
%Trapezregel zur numerischen Anhäherung eines bestimmten Integrals.
%   Aufruf: T = FlorianLuethi_i10b_S10_Aufg2(@(x) cos(x^2), 0, pi, 4)

fa = f(a);
fb = f(b);

% Stützstellen bestimmen und Funktion dort auswerten
fs = zeros(n+1, 2^n-1);

for i = 0 : 1 : n,
   h = (b-a) / 2^i;
   for j = 1 : 1 : 2^i-1,
       fs(i+1, j) = f(a + j * h);
   end
end

% Ts bauen
Ts = zeros(n+1, n+1);

%Ti0 einfüllen
for i = 0 : 1 : n,
    h = (b-a) / 2^i;
    Ts(i+1, 1) = h *((fa+fb)/2 + sum(fs(i+1,:)));
end

% Extrapolate, Mr Romberg!
for j = 1 : 1 : n,
    for i = 0 : 1 : n-j,
        Ts(i+1,j+1) = (4^j * Ts(i+2,j) - Ts(i+1,j) )/(4^j-1);
    end
end

T = Ts(1, n+1);

end

% Das von Hand gerechnete scheint zu stimmen (warum bloss habe ich zuerst
% von Hand gerechnet!?)
