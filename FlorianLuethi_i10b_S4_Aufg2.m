function [x, B, det] = FlorianLuethi_i10b_S4_Aufg2( A, b )
%FlorianLuethi_i10b_S4_Aufg2 Berechnet die Lösung des linearen
%Gleichungssystems A*x = b mit Hilfe des Gauss-Algorithmus.
%   Aufruf: [x, B, det] = FlorianLuethi_i10b_S4_Aufg2(A, b)
%   Resultate: x => Lösung des Systems als Spaltenvektor; B => Obere
%   Dreiecksform von A; det = Determinante von A

[~,n] = size(A);
lambda = ones(n);

l = 0;

for i = 1 : 1 : n - 1,
    % suchmenge definieren
    m = zeros(n,1);
    for j = i : 1 : n,
        m(j) = A(j, i);
    end
    [~,j] = max(m);
    if (i ~= i),
        % tauschen
        v = A(j,:);
        A(j,:) = A(i,:);
        A(i,:) = v;
        bs = b(j);
        b(j) = b(i);
        b(i) = bs;
        l = l + 1;
    end
    % eliminieren
    for j = i+1 : 1 : n,
        lambda(i,j) = A(j, i) / A(i,i);
        A(j,:) = A(j,:) - lambda(i,j) .* A(i,:);
        b(j) = b(j) - lambda(i,j) .* b(i);
    end
end

% ruckwartseinsetzen
x = zeros(n, 1);
for i = n : -1 : 1,
    s = 0;
    for j = i+1 : 1 : n,
        s = s + A(i, j) * x(j);
    end
    x(i) = (b(i) - s) / A(i, i);
end

B = A;

% determinante
det = (-1)^l;
for i = 1 : 1 : n,
    det = det * B(i, i);
end

end

%
% Lösungen:

% x1 = [2;-2;3] bzw. [6;-2;4]
% x2 = [1;2;3] bzw. [-2;3;-4]
% x3 = [-1;3;-4] bzw. [-5;-2;4]
% x4 = [1;-1;0;2;3;3;-8;15]
