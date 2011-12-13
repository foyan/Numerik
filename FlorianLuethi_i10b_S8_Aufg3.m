function D = FlorianLuethi_i10b_S8_Aufg3(f, h0, n, x0)
%FlorianLuethi_i10b_S8_Aufg3 Nähert numerisch die Ableitung von f(x0) an
%unter Verwendung der h^2-Extrapolation. Yeah.
%   Aufruf: FlorianLuethi_i10b_S8_Aufg3(@(x) sin(x),0.1,7,1)

Dm = zeros(n, n);

% Differenzenformel D2 anwenden für alle Wurzelelemente
for i = 1 : 1 : n,
    h = h0/2^(i-1);
    Dm(i, 1) = (f(x0+h) - f(x0-h)) / (2. * h);
end

% Loopediloop
for k = 1 : 1 : n-1,
    for i = 0 : 1 : n - k-1,
        km = k+1; % matlab ist one-based...
        im = i+1; % matlab ist one-based...
        Dm(im, km) = ( 4^(k) * Dm(im+1,km-1) - Dm(im,km-1)) / (4^k - 1);
    end
end

% Resultat
D = Dm(1, n);

end

