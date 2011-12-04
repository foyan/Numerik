% a)
figure(1);

% intervall
x = 1.99 : (2.01-1.99)/500 : 2.01;

f1 = polyval([1 -14 84 -280 560 -672 448 -128], x);
f2 = (x - 2).^7;
plot(x,f1,'r', x,f2, 'g');

% f1(2) = f2(2) = 0
% die Werte sind alle sehr sehr klein. Die Addition der Einzelwerte
% bei f1(x) führt zu Fehlerfortpflanzung.

% b)
figure(2);

x2 = -10e-14 : 10e-17 : 10e-14;
g1 = x2 ./ (sin(1+x2) - sin(1));
plot(x2, g1, 'r');

% c)
figure(3);

g2 = x2 ./ (2 .* cos( (1+x2+1) / 2 )  .* sin( (1+x2-1) / 2 ) );
plot(x2, g2, 'r');

% g1: nicht stabil.
% g2: wahrscheinlich stabil.
% lim: 2.5

