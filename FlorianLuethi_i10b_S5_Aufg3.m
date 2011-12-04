function [L, U, P] = FlorianLuethi_i10b_S5_Aufg3( A )
%FlorianLuethi_i10b_S4_Aufg2 Berechnet die L/U Zerlegung der Matrix A. Als
%wenn das nicht schon ganz viele vor mir gemacht hätten.
%   Aufruf: [L, U, P] = FlorianLuethi_i10b_S5_Aufg3(A)
%   Resultate: L => die linke Dreiecksmatrix. U => die rechte
%   Dreiecksmatrix. P => 

[~,n] = size(A);
L = zeros(n);

for i = 1 : 1 : n - 1,
    % eliminieren
    for j = i+1 : 1 : n,
        L(j,i) = A(j, i) / A(i,i);
        A(j,:) = A(j,:) - L(j,i) .* A(i,:);
    end
end

U = A;
P = 0;

end

