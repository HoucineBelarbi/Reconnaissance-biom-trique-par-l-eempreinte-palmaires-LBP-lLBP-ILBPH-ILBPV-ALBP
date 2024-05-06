clear; clc
run("options.m");
fprintf('\n--------------------- Show plote finished ---------------------\n\n');
  for ex=1:length(ALLextraction)
     extraction=upper(ALLextraction(ex));
     fprintf('--------------------- Star Extraction %s ---------------------\n',extraction);
         for w=1: length(allwindows)
             windows=upper(allwindows(w));
             fprintf('--------------------- Star Windows %d        ---------------------\n\n',windows);
             for dim=1:length(dim_bloc)
                fprintf('---------------- [Bloc %d] -----------\n',dim);
                for dr=1:length(direction)
                    run('choice.m');
                   %diclartion prefix
                    %rename database user an imposter
                    name_data_user_bestscore=strcat(prefix,name_data_user_bestscore);
                    name_data_imposter_bestscore=strcat(prefix,name_data_imposter_bestscore);
                    %load database user an imposter
                    users=load(name_data_user_bestscore);
                    imposters=load(name_data_imposter_bestscore);
                    users=str2double(users.best(:,2));
                    imposters=str2double(imposters.best(:,2));
                    [FRR_axe,FAR_axe]= calculer_metriques(users,imposters);%calculer_metriques
                    % ************** afficher le graph Horizontal *************
                    x=[min_seuil:move_seuil:max_seuil];
                    [seuil_x seuil_y]=polyxpoly(x,FRR_axe,x,FAR_axe);
                    fprintf(' %s= %f \n',prefix,seuil_y(1));                   
                     %initialitation les nom des variabl 
                    name_data_user_bestscore=erase(name_data_user_bestscore,prefix);
                    name_data_imposter_bestscore=erase(name_data_imposter_bestscore,prefix);
                end
               fprintf('---------------------------------------------\n\n'); 
             end
            fprintf('--------------------- End Windows %d         ---------------------\n',windows);

         end
  end
        
fprintf('--------------------- Show plote finished ---------------------\n\n');