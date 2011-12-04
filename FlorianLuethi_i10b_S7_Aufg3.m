function [ xn, n, n2 ] = FlorianLuethi_i10b_S7_Aufg3( A, b, x0, tol )
%FlorianLuethi_i10b_S7_Aufg3 Nähert die Lösung von A*x = b mit dem
%Gauss-Seidel-Verfahren an. x0 ist der Startvektor, tol die Toleranz.
%Resultate: xn ist die Näherung, n die Anzahl Iterationen und n2 die
%Anzahl Iterationen a-priori gemäss Herrn Banach.
%   Aufruf: [xn, n, n2] = FlorianLuethi_i10b_S7_Aufg3(A, b, [0;0;0],
%   10^(-4))

L = A - triu(A);
D = diag(diag(A));
R = A - tril(A);

B = -(D + L)^(-1) * R;
B_inf = norm(B, inf);
DLinvb = (D + L)^(-1) * b;

if (B_inf > 1),
    error ('x ist kein anziehender Fixpunkt.');
end

xn = B * x0 + DLinvb;
n = 1;

n2 = ceil(log (tol / norm(xn - x0, inf) / (1 - B_inf)) / log (B_inf));

while (B_inf / (1-B_inf) * norm(xn - x0, inf) >= tol),
    x0 = xn;
    xn = B * x0 + DLinvb;
    n = n + 1;
end

end

% t1 = tic(); [xn, n, n2] = FlorianLuethi_i10b_S7_Aufg3(A,b,x0,tol); toc(t1);
% Elapsed time is 30.315487 seconds.

% t1 = tic(); [x, B, det] = FlorianLuethi_i10b_S4_Aufg2(A,b); toc(t1);
% Elapsed time is 1045.599281 seconds.
