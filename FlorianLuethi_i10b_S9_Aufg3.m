function [ Rf, Tf, Sf ] = FlorianLuethi_i10b_S9_Aufg3( f, a, b, n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = (b-a)/n;

Rf = 0;
Tf = 0;

for i = 0 : 1 : n - 1,
    xi = a + i * h;
    Rf = Rf + f(xi + h / 2);
    Tf = Tf + f(xi);
end

Rf = h * Rf;
Tf = h * ((f(a) + f(b)) / 2 + Tf);

Sf1 = 0;
Sf2 = 0;

for k = 1 : 1 : n - 1,
    xk = a + k * h;
    Sf1 = Sf1 + f(xk);
end
for k = 1 : 1 : n,
    xk = a + k * h;
    xkm = a + (k-1) * h;
    Sf2 = Sf2 + 2 * f((xkm + xk)/2);
end

Sf = h / 3 * (0.5 * f(a) + Sf1 + Sf2 + 0.5 * f(b));

end

