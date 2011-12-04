figure(1);

x = -100:0.1:100;

% f(x)
f = x.^5 - 5*x.^4 - 30*x.^3 + 110 * x.^2 + 29 .* x - 105;

%  I f(x) dx
fi = (1/6) .* x.^6 - x.^5 - (30/4) .* x.^4 + (110/3) .^ x.^3 + (29/2) .* x.^2 - 105 .* x;

% d/dx f(x)
fd = 5 * x.^4 - 20 * x.^3 - 90*x.^2 + 220 .* x + 29;
plot(x, f, x, fd, x, fi);

ylim([-1300 1300]);
xlim([-6 10]);

grid();

legend('f(x)','f''(x)','F(x)');
xlabel('x'); ylabel('f(x),f''(x), F(x)');

% =>  NS: -5.0, -1.0, 1.0, 3.0, 7.0


% b)

figure(2);

[x, y] = meshgrid(-2:0.01:2); 
g = x .* exp(-x.^2 - y.^2);
mesh(x,y,g);
xlabel('x');ylabel('y');zlabel('z');

