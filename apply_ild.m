function [sig_stereo] = apply_ild(sig,ILD)
% Fonction qui applique un ILD donné à un signal mono UNIQUEMENT.
%
% sig : signal à traiter (MONO)
% ILD : ILD à appliquer au signal (en dB)

sig_stereo = zeros(length(sig),2) ;
sig_stereo(:,1) = sig ;
sig_stereo(:,2) = 10^(ILD/20)*sig ;
sig_stereo = sig_stereo/max(sig_stereo(:)) ;