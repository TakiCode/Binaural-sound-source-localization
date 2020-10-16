clear all 
close all
clc
Fe=44100;
n=100000;


% ITD: correspond a la differences dans le temps d'arriver du signal 
% entre l'oreille gauche et droite sa valeur max est 0.8ms,elle sert a localiser
% les basses frequences <1.5Khz

bruit_1 = randn(n,1);
plot(bruit_1);
ITD=;
bruit_stereo_itd = apply_itd(bruit_1,ITD,Fe);
sound(bruit_stereo_itd, Fe);

% ITD: correspond a la differences d'amplitude  entre l'oreille gauche
%  et droite sa valeur max est 0.8 ms.
%les valeurs qui peuvent etre utisees commencent a partir de 1.5Khz.
ILD=10;
bruit_2= randn(n,1);
bruit_stereo_ild = apply_ild(bruit_stereo_itd,ILD);
%sound(bruit_stereo_ild, Fe);
