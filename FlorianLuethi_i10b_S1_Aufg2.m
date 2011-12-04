function y = FlorianLuethi_i10b_S1_Aufg2(a, min, max)
%FlorianLuethi_i10b_S1_Aufg2 Zeichnet ein Polynom der Ordnung |ip| - 1 und gibt die
%Funktionswerte zurück.
%   Aufruf: y = FlorianLuethi_i10b_S1_Aufg2([1,2,3], -100, 100)

x = (min : 0.1 : max);

% grad
n = length(a);
% y initialisieren mit konstantem koeffizienten
y = a(n);

p = 1;

for i = n-1 : -1 : 1,
    y = y + a(i) * x.^p;
    p = p + 1;
end

plot(x,y); grid;

end

