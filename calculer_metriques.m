function [F_R_R,F_A_R]= calculer_metriques(scores_gen,scores_imp)
global min_seuil max_seuil move_seuil

%  gen=scores_gen;%str2double(scores_gen(:,2));
%  imp=scores_imp;%str2double(scores_imp(:,2));
gen=scores_gen;
 imp=scores_imp;
%  [r_gen c_gen]=size(gen);
%  [ri_imp ci_imp]=size(imp);
 seuil=min_seuil;
 F_A_R=[];
 F_R_R=[];
 while seuil<=max_seuil
%     count_gen=sum(gen <= seille)/r_gen;
%     count_imp=sum(imp > seille)/ri_imp;
    F_A_R=[F_A_R    sum(imp <= seuil)];%[F_A_R count_gen];
    F_R_R=[F_R_R     sum(gen > seuil) ];%[F_R_R count_imp];
     seuil=seuil+move_seuil;
 end

F_A_R=F_A_R/length(scores_imp);
F_R_R=F_R_R/length(scores_gen);
end