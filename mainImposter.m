  clear;clc;  
  run("options.m");
for ex=1:length(ALLextraction)
     extraction=ALLextraction(ex);
      for w=1: length(allwindows)
         windows=allwindows(w);
          tempExcutionDim=[];
          tempExcutionT=[];
          for dim=1:length(dim_bloc)
            for dr=1:length(direction)
                tic;    
                run('choice.m');    
                name_data_save=strcat(prefix,name_data_save);
                name_data_user=strcat(prefix,name_data_user);  % name data have score 
                name_data_user_bestscore=strcat(prefix,name_data_user_bestscore);
                name_data_imposter=strcat(prefix,name_data_imposter);
                name_data_imposter_bestscore=strcat(prefix,name_data_imposter_bestscore);      
            %     train(start_personne,name_data_save,Block);%train
            %     users=calc_genuine(start_personne,name_data_save,Block);%calc_geuine    
                imposters=calculer_imposters();%calc_impoeters
              %imposters
              %initialitation les nom des variabl 
                name_data_save=erase(name_data_save,prefix);    
                name_data_user=erase(name_data_user,prefix);  % name data have score 
                name_data_imposter=erase(name_data_imposter,prefix);
                name_data_user_bestscore=erase(name_data_user_bestscore,prefix);
                name_data_imposter_bestscore=erase(name_data_imposter_bestscore,prefix);    
                tempExcutionDim(dr)=toc;
            end
            tempExcutionT(dim,:)=tempExcutionDim;
          end
          Tem_prifix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_');
          tem_name=strcat(Tem_prifix,name_tempExcution);
          tempExcutionT=table(dim_bloc,tempExcutionT);          
          save(strcat(tem_name,'.mat'),'tempExcutionT');
          tem_name=[]; 
          tempExcutionT;
      end
end
run('show_plot.m');
run('show_EER.m');
run('show_TempExcution.m');
run('show_BestBloc.m');
run('show_fusion.m');



% run('show_plot.m');