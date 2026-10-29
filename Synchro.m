function [syn, synabs, t] = Synchro(c, symbole)
seq = length(c);
syn = filter(c(seq : -1 : 1), 1, symbole);
synabs = abs(syn);
t = find(synabs == max(synabs));
end