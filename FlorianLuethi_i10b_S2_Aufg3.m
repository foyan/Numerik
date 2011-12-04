loops = 30;

p = 0 : 1 : loops - 1;

pii = zeros(loops);
piix = zeros(loops);
pii2 = zeros(loops);
piix2 = zeros(loops);

pii(1) = 1;
pii2(1) = 1;

n = 6 * 2 .^ p;

for i = 2 : 1 : loops,
    pii(i) = nthroot(2 - 2 * nthroot(1 - pii(i-1)^2/4, 2), 2);
    piix(i) = n(i) * pii(i) / 2;
    pii2(i) =  nthroot(pii(i-1)^2 / ( 2 * (1 + nthroot( 1 - pii(i-1)^2 / 4, 2 )) ), 2  );
    piix2(i) = n(i) * pii2(i) / 2;
end


plot (p, piix, 'r', p, piix2,'g');
ylim([3.12 3.16]);


% bei beiden varianten funktioniert's irgendwann nicht mehr,
% weil s2n unter die maschinengenauigkeit fällt. bei der zweiten
% variante ein bisschen später.
