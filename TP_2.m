clear all 
close all
clc
%dans cette partie on donne la position de la source et on estime 
%la itd et la ild

az_pos=90;
el_pos=0;
to_load=1002;
%on applique la position donnee pour le signal
[hrir,Fs] = hrir_loader(az_pos,el_pos,to_load);

%tracer des deux signaux dans le domain temporel
%{
figure 
subplot(211)
plot(hrir(:,1));
title('tracer du signal recu sur la gauche')
subplot(211)
plot(hrir(:,1));
title('tracer du signal recu sur la gauche')
%}
f_hrir =[0:length(hrir)-1]/length(hrir)*Fs;
HRTF=fft(hrir);
%{
%tracer des deux signaux dans le domain frequentiel
figure
subplot(211)
plot(f_hrir,abs(HRTF(:,1)));
title('tracer du signal recu sur la gauche')
subplot(212)
plot(f_hrir,abs(HRTF(:,2)));
title('tracer du signal recu sur la droite')
%}
argement=arg(HRTF)
%ITF=HRTF(:,1)/HRTF(:,2);
%{
figure
plot(f_hrir,abs(ITF));
%}
ILD=abs(ITF);
figure
plot(f_hrir,ILD);
title('tracer de la ILD')
for i=1:length(f_hrir)
    ITD(i)=arg(ITF(i))/(2*pi*f_hrir(i)
end
plot(ITD)
title('tracer de la ITD')



%Binaural cues: sound sources that are very close to the head
%a distance modifecation induces a modifecation
%in both ITD and ILD and thus binaura cues may be used
%distance estimation of close objects.