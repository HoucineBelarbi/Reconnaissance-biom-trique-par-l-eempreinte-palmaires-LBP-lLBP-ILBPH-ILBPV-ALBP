clear; clc
run("options.m");
fprintf('\n********************** Show plote started ******************************\n\n');
  for ex=1:length(ALLextraction)
     extraction=upper(ALLextraction(ex));
     fprintf('******* Star Extraction %s ******\n\n',extraction);
         for w=1: length(allwindows)
             windows=upper(allwindows(w));
             fprintf('************** Star Windows %d **************\n\n',windows);
             EER=[];
             for dim=1:length(dim_bloc)
                fprintf('------- Star show Bloc %d -------\n',dim);
                EER_dirct=[];
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
                    switch direct
                        case 'V'
                            ptitle='Les métriques Vertical';
                        case 'D'
                            ptitle='Les métriques Total';
                        otherwise
                            ptitle='Les métriques Horizontal';
                    end
                    % ************** afficher le deux graph Horizontal *************
                    [seuil_x seuil_y]=polyxpoly(x,FRR_axe,x,FAR_axe);
%                     fprintf(' %s= %f \n',prefix,seuil_y(1));
                    f=figure(dim);
                    subplot(length(direction),1,dr),plot(x,FRR_axe,'b',x,FAR_axe,'g','linewidth',1);
                    grid on;
                    box on
                    title(ptitle);
                    xlabel('Seuil');
                    label=strcat(direct,'FAR',' & ',direct, 'FRR');
                    ylabel(label);
                    hold on
                    plot(seuil_x,seuil_y,'r*','linewidth',3);
                    hold on; 
                    legend('FRR','FAR','EER');

                    if(dr==length(direction))
                        ftitel=strrep(prefix,direct,'Bloc');
                        set(figure(dim),'name',ftitel,'numbertitle','off');
                    end
                     %initialitation les nom des variabl 
                    name_data_user_bestscore=erase(name_data_user_bestscore,prefix);
                    name_data_imposter_bestscore=erase(name_data_imposter_bestscore,prefix);
                    EER_dirct=[EER_dirct, seuil_y(1)];
                end
                EER=[EER; EER_dirct];
               fprintf('------- End show Bloc %d -------\n\n\n',dim); 
             end
             Tem_prifix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_');
             save(strcat(Tem_prifix,name_EER,'.mat'),'EER');
            fprintf('******* End Windows %d **************\n\n',windows);

         end
  end
        
fprintf('\n********************** Show plote finished ******************************\n\n');