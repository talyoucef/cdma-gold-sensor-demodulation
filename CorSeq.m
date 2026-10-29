function [cor, corabs] = CorSeq(a, SignalRecu)
L = length(a);
cor = filter(a(L : -1 : 1), 1, SignalRecu);
corabs = abs(cor);
end