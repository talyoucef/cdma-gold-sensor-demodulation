%//////////////////////////////////
% projet Traitement de signale dans les réseaux de capteur
% Réaliser 

clc;
clear;
close all;

load SignalRecu.mat

SignalRecu = single(SignalRecu);

p1 = [1 1 0 0 0 0 1];
p2 = [1 1 1 0 0 1 1];
p3 = [1 0 0 0 1 0 0 1];

[a, A] = msequence(p1);
[b, B] = msequence(p2);
[c, C] = msequence(p3);

a(1 : 18);
b(1 : 18);

[capteur1, capteur1Bin] = Gold(A, B, 1);
[capteur2, capteur2Bin] = Gold(A, B, 2);
capteur1(1 : 18);
capteur2(1 : 18);

[cor1, corabs1] = CorSeq(capteur1, SignalRecu);
[cor2, corabs2] = CorSeq(capteur2, SignalRecu);
histogram(corabs1(1 : 10^6));
grid;
figure;
histogram(corabs2(1 : 10^6));
grid;

symbole1 = Symbole(SignalRecu, cor1, 60);
symbole2 = Symbole(SignalRecu, cor2, 60);

[syn1, synabs1, t1] = Synchro(c, symbole1);
[syn2, synabs2, t2] = Synchro(c, symbole2);
figure;
stem(synabs1(1 : 300));
grid;
figure;
stem(synabs2(1 : 300));
grid;

[I1, v1] = Reconstruction(symbole1, c, t1);
[I2, v2] = Reconstruction(symbole2, c, t2);
figure;
imshow(I1);
figure;
imshow(I2);