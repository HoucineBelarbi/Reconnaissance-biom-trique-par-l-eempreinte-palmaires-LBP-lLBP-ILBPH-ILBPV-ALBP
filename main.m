  clear;clc;
  run("options.m");
  for ex=1:length(ALLextraction)
     extraction=ALLextraction(ex);
     for w=1: length(allwindows)
         windows=allwindows(w);
          for dim=1:length(dim_bloc)
            for dr=1:length(direction)
            run('choice.m');
            name_data_save=strcat(prefix,name_data_save);
            name_data_user=strcat(prefix,name_data_user);  % name data have score 
            name_data_user_bestscore=strcat(prefix,name_data_user_bestscore);
            name_data_imposter=strcat(prefix,name_data_imposter);
            %name_data_imposter_bestscore=strcat(prefix,name_data_imposter_bestscore);

            train(start_personne,name_data_save);%train
            users=calc_genuine(start_personne,name_data_save);%calc_geuine
        %    imposters=calculer_imposters();%calc_impoeters
        %     users
         %   imposters

            %delete file
%             delete(strcat(name_data_user,'.',format_data_saved));
%         %run('    delete(strcat(name_data_imposter,'.',format_data_saved));
%              delete(strcat(name_data_user,'.',format_data_saved));
%              delete(strcat(name_data_imposter,'.',format_data_saved));

            %initialitation les nom des variabl 
            name_data_save=erase(name_data_save,prefix);    
            name_data_user=erase(name_data_user,prefix);  % name data have score 
            name_data_imposter=erase(name_data_imposter,prefix);
            name_data_user_bestscore=erase(name_data_user_bestscore,prefix);
            %name_data_imposter_bestscore=erase(name_data_imposter_bestscore,prefix);    
            end
          end
     end
  end
run('mainImposter.m'); 
%run('show_plot.m');