function symbole = Symbole(SignalRecu, cor, seuil)
symbole = zeros(length(SignalRecu), 1);
corplus = find(cor > seuil);
symbole(corplus) = 1;
cormoin = find(cor < -seuil);
symbole(cormoin) = -1;
symbole = nonzeros(symbole);
end