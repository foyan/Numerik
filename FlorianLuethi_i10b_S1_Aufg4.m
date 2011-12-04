function [r, relativ, absolut] = FlorianLuethi_i10b_S1_Aufg4(n, basis, mantisse)
%FlorianLuethi_i10b_S1_Aufg4 Wandelt eine Zahl gemäss der Aufgabe um.
%   Aufruf: r = FlorianLuethi_i10b_S1_Aufg4(34.23, 2, 17)

% statische dingerlinger
ziffern = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'];

gzArr = [];
nzArr = [];

% ganzzahliger und nachkomma-anteil
gz = floor(abs(n));
nz = abs(n) - gz;

% division für ganzzahligen anteil
r = gz;
while r ~=0,    
    rest = mod(r, basis);
    r = floor(r / basis);
    gzArr = [ziffern(rest +1 ) gzArr];
end

% multiplikation für nachkomma-anteil
if nz ~= 0,
    x_ = 0;  % x~ für die Fehlerberechnung
    i = 1;
    result = nz;
        
    exponent = length(gz);
    maxKomma = mantisse - exponent;
    
    firstDigitIsZero = (exponent == 0);
        
    while maxKomma > 0,
        result = result * basis;
        dig = floor(result);
        if dig ~= 0,
            firstDigitIsZero = false; 
        end
        
        if firstDigitIsZero,
            exponent = exponent - 1;
        else
            nzArr = [nzArr ziffern(dig + 1)];
            maxKomma = maxKomma-1;
        end            
        result = result - dig;
            
        x_ = x_+ dig * basis^(-i);
        i = i + 1;
    end
    
    relativ = abs((x_ - nz) / nz);
    absolut = abs(x_ - nz);
        
    r = ['(0.' gzArr nzArr ' E' num2str(exponent) ')' num2str(basis)]
else  
    r = [nzArr]; 
end    



end

