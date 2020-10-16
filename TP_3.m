close all 
clear all
clc

bathroom=load('bathroom.mat');
figure
plot(mag2db(bathroom.h_air));
title('tracer de la reponse impultionnelle bathroom ')
office=load('office.mat');
sound(bathroom.h_air,bathroom.fs);
rt = t60(bathroom.h_air,1);
figure
plot(mag2db(office.h_air));
title('tracer de la reponse impultionnelle  office ')
stairway=load('stairway.mat');
%sound(bathroom.h_air,bathroom.fs);
figure
plot(mag2db(stairway.h_air));
title('tracer de la reponse impultionnelle stairway ')
%sound(bathroom.h_air,bathroom.fs);


%dans le tracer du module des signaux dans les differente chambre 
%on remarque un pique au debut qui correpond au signal direct et 
%a partir des signaux inferieurs a -40 db c est des reverbrations 