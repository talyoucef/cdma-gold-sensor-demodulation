function [I, v] = Reconstruction(symbole, c, t)
seq = length(c);
symboleSyn = (1 - symbole(t(1) + 1 : t(2) - seq)) / 2;
v = bit2int(symboleSyn, 8);
nblig = v(1);
nbcol = fix(length(v) / (nblig * 3));
taille = nbcol * nblig;
v = v(2 : end);
R = reshape(v(1 : taille), [], nbcol);
G = reshape(v(taille + 1 : 2 * taille), [], nbcol);
B = reshape(v(2 * taille + 1 : 3 * taille), [], nbcol);

I(:, :, 1) = R / 255;
I(:, :, 2) = G / 255;
I(:, :, 3) = B / 255;
end