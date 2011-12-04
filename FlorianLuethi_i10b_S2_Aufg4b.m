x = logspace(-5, 5);

f = 5 ./ (nthroot(2 .* x.^2, 3));
g = 10^5 * 2.^(-x ./ 100) .* exp(-x ./ 100);
h = ( 10 .^ (2 .* x) ./ 2 .^ (5 .* x) ) .^ 2;
%h = 10 .^ (4 .* x) ./ 2 .^ (10 .* x);

subplot(2,2,1), loglog(x, f), legend('f(x)');
subplot(2,2,2), semilogy(x, g), legend('g(x)');
subplot(2,2,3), loglog(x, h), legend('h(x)');