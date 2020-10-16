function [sig_stereo] = apply_ild(sig,ILD)
% Fonction qui applique un ILD donn� � un signal mono UNIQUEMENT.
%
% sig : signal � traiter (MONO)
% ILD : ILD � appliquer au signal (en dB)

sig_stereo = zeros(length(sig),2) ;
sig_stereo(:,1) = sig ;
sig_stereo(:,2) = 10^(ILD/20)*sig ;
sig_stereo = sig_stereo/max(sig_stereo(:)) ;