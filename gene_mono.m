function [sig] = gene_mono(T,Fe)
% Génération d'un signal mono de durée T à la fréquence d'échantillonnage
% Fe

% Création du signal mono
Nb_sample = round(Fe*T) ; 
sig = randn(Nb_sample,1) ;

% filtrage passe-bas pour ne garder de l'énergie qu'en dessous de 4 kHz
F_pb = 4000 ;
f = [0 F_pb F_pb Fe]/Fe ;
m = [1 1 0 0];
b = fir2(100,f,m);
sig = filter(b,1,sig) ;

% Normalization du signal
sig = 0.9*(sig-mean(sig))/max(sig) ;