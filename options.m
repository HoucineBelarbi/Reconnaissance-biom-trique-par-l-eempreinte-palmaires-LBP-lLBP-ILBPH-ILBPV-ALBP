% Vous devez sd'abord exécuter le fichier de train
% clearvars -except s_personne e_personne name_data num part;

global bdd format name_data_save format_data_saved taill_bloc_row taill_bloc_column;
global  bgBlock_H endBlock_H  bgdblock_w  endblock_w lenghtnamefile nmbrpicutre
global start_personne   nmbrpersonne pic_template name_data_user name_data_user_bestscore
global start_imposter  name_data_imposter name_data_imposter_bestscore
global min_seuil max_seuil move_seuil extraction
global move direction direct windows
global heighsize widthsize rotaion 
% ***********information data**************
bdd='BDD';
format='bmp';
name_data_save='ilbph9';
format_data_saved='mat'; % exemple csv 
nmbrpicutre=2;  % nombre de photo d'un seul utilisateur

heighsize=128;
widthsize=128;

%**********information block *******************
taill_bloc_row=16;
taill_bloc_column=16;

% c_bgBlock_H=49;   c_endBlock_H=64;
% c_bgdblock_w=81;  c_endblock_w=96;

dim_bloc={[49 64 81 96];[65 80 65 80];[97 112 65 80];[97 112 17 32]}; % dim_bloc={[49 64 81 96];[65 80 65 80];[97 112 65 80];[97 112 17 32]}

lenghtnamefile=3; % taile de nom de photo exp  001, 002 tialle =3

%extraction ='ILBP';%ILBP ou ALLBP majisucle ou miniscule
ALLextraction =["ALLBP"];%%ILBP ou ALLBP majisucle ou miniscule ALLextraction =["ILBP";"ALLBP"] attontion utiliser "" n'est pas ''

move=7; % nomre de pasage de block (haut bas gauche droit)
direction=['h' 'v' 'd' 'm'];  % direction 'V' or 'H' or 'D' majiscul ou miniscule or 'M' max ['h' 'v' 'd' 'm'];
rotaion=[-6,6];
nmbrpersonne=100;% from personne numéro to persone numéro de train and the same from calc_genuine

%windows=9;  %fenetre
allwindows=[7 9 13 15]; %winds

%information users
start_personne=1;
% nmbrpersonne=end_personne-start_personne+1;
pic_template=[1 5]; % choix de photo tem"plate exp si 003_1 template alor  pic_template=[1]
                    %si templta 003_1 et 003_5 alor  pic_template=[1 5] ;

name_data_user='score_user';  % name data have score 
name_data_user_bestscore='best_score_user';


%information imposter from exp 101 to 103
start_imposter=101;
name_data_imposter='score_imposter';
name_data_imposter_bestscore='best_score_imposter';

%information seille
min_seuil=0;
max_seuil=1000;
move_seuil=2;

name_tempExcution='tempExcution';
windows_fusion=[7 9]; %ne depasse pa plus que deux(2) elements;
extraction_fusion=['ILBP'];
name_best_err='best_err';
name_EER='EER';
varnames={'Sum','Prod','Min','Max','Wsr','Wsr1','Wsr2','Wsr3'};

 

