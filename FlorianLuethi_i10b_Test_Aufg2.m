x = -5:0.1:5;
f = exp(x);
subplot(2,2,1), plot(x,f);

x = -10:0.1:10;
g = x.^5 + 3*x.^4 + 3*x.^2 + x + 1;
subplot(2,2,2), plot(x, g);

x = -2*pi:0.1:2*pi;
g = sin(x);
h = cos(x);
subplot(2,2,3), plot(x, g, x, h);

y = round(100*randn(100000,1)+0.5);
x = min(y):10:max(y);
subplot(2,2,4), hist(y,x);