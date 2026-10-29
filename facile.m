%//////////////////////////////////
% projet Traitement de signale dans les réseaux de capteur
% Réaliser 

clc;
clear;
close all;

load SignalRecu_facile.mat

SignalRecu = single(SignalRecu);

p1 = [1 1 0 0 0 0 1];
p3 = [1 0 0 0 1 0 0 1];

[a, A] = msequence(p1);
[c, C] = msequence(p3);

[cor, corabs] = CorSeq(a, SignalRecu);
seuil = 0.95 * length(a);
cor(1 : 16);
histogram(corabs(1 : 10^6));
grid;

symbole = Symbole(SignalRecu, cor, seuil);
symbole(1 : 16);

[syn, synabs, t] = Synchro(c, symbole);
figure;
stem(synabs(1 : 300));
grid;

[I, v] = Reconstruction(symbole, c, t);
v(1 : 16);
figure;
imshow(I);