function f = FlorianLuethi_i10b_S1_Aufg3(n)
%FlorianLuethi_i10b_S1_Aufg3 Berechnet die Fakult�t nicht-rekursiv.
%   Aufruf: f = FlorianLuethi_i10b_S1_Aufg3(3)
%   Fehler, falls n < 0 oder nicht ganzzahlig

% definitionsmenge
if n < 0 || fix(n) ~= n,
    error('ERROR: FAK ist nur f�r nicht-negative, ganze Zahlen definiert');
end

f = 1;
for i = 2 : 1 : n,
    f = f * i;
end

end

% fak(n):
% Elapsed time is 0.001627 seconds.
% FlorianLuethi_i10b_S1_Aufg3(n):
% Elapsed time is 0.000035 seconds.

% Rekursionen sind f�r Computer viel kostspieliger als for-Schleifen weil
% der ganze Kontext gem�ss dem Stack neu aufgebaut werden muss.