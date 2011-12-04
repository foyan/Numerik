Y = 2000:1:2100;

B = 225 - mod(Y, 10) .* 11;
D = mod(B-21, 30) + 21;
if D > 48,
    D = D - 1;
end



E = mod((Y + fix(Y/4) + D + 1), 7);
Q = D + 7 - E;


if Q < 32,
    M = 3; %% mist
    D = Q;
else
    M = 4;
    D = Q - 31;
end
