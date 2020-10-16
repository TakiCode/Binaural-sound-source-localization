function [sig_stereo] = apply_itd(sig,ITD,Fe)
% Fonction qui applique un ITD donn� � un signal mono ou st�r�o.
%
% sig : signal � traiter (mono ou st�r�o)
% ITD : ITD � appliquer au signal (en millisecondes)

% Cr�ation de la matrice signal finale
Nb_dec = abs(round(0.001*ITD*Fe)) ;
Nb_sample = length(sig) ;
sig_stereo = zeros(Nb_sample+Nb_dec,2) ;

% Gestion du cas ou le signal d'entr�e est mono
if size(sig,2)==1
    sig_fill = zeros(Nb_sample,2) ;
    sig_fill(:,1) = sig ;
    sig_fill(:,2) = sig ;
else
    sig_fill = sig ;
end

% Cr�ation de l'ITD
if (ITD>0)
    sig_stereo(1:Nb_sample,1) = sig_fill(:,1) ;
    sig_stereo(Nb_dec+1:Nb_dec+Nb_sample,2) = sig_fill(:,2) ;
else
    sig_stereo(1:Nb_sample,2) = sig_fill(:,1) ;
    sig_stereo(Nb_dec+1:Nb_dec+Nb_sample,1) = sig_fill(:,2) ;
end