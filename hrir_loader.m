function [hrir,Fs] = hrir_loader(az_pos,el_pos,to_load)

% Chargement des donn�es
load(['IRC_' num2str(to_load) '_R_HRIR.mat'])

% Recherche de l'azimuth et de l'�l�vation
az_vec = l_hrir_S.azim_v ;
el_vec = l_hrir_S.elev_v ;

az_ind = find(az_vec==az_pos) ;
el_ind = find(el_vec==el_pos) ;
pos_ind = intersect(az_ind,el_ind) ;

if isempty(pos_ind)
    
    % Position non-trouv�e
    display('ERREUR: La direction indiqu�e n''existe pas dans la base de donn�e...')
    hrir= NaN ;
    Fs  = NaN ; 
    
else
    
    % Extraction des hrirs
    hrir = zeros(size(l_hrir_S.content_m,2),2) ;

    Fs = l_hrir_S.sampling_hz ;
    hrir(:,1) = l_hrir_S.content_m(pos_ind,:) ;
    hrir(:,2) = r_hrir_S.content_m(pos_ind,:) ;
    
end

