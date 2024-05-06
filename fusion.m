clear; clc
run("options.m");
fprintf('\n------------------------ Clac fustion started ------------------------\n');
for ex=1:length(ALLextraction)
     extraction=upper(ALLextraction(ex));
     prefix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_');
      Table=load(strcat(prefix,name_best_err));
       scores=struct; 
        for dr=1:length(direction)
            direct=upper(direction(dr));
                 for row=1:size(Table.BestBloc,1)
                    Bloc= Table.BestBloc.Bloc(row);
                    windows= Table.BestBloc.windows(row);
                    prfix=strcat(prefix,'W',int2str(windows),'_',int2str(dim_bloc{row}(1)),'-',int2str(dim_bloc{row}(2)),'_',int2str(dim_bloc{row}(3)),'-',int2str(dim_bloc{row}(4)),'_',direct,'_');
                    temp=load(strcat(prfix,name_data_user_bestscore));
                    scores.gen(row).best=(str2double(temp.best(:,2))/windows);
                    temp=load(strcat(prfix,name_data_imposter_bestscore),'best');
                    scores.imp(row).best=(str2double(temp.best(:,2))/windows);
                 end
                 x=[min_seuil:move_seuil:max_seuil];
                 fusion_scores=calc_fusion(scores);
                 [fusion_scores.sum.frr,fusion_scores.sum.far]= calculer_metriques(fusion_scores.sum.gen,fusion_scores.sum.imp);
                 [fusion_scores.prod.frr,fusion_scores.prod.far]= calculer_metriques(fusion_scores.prod.gen,fusion_scores.prod.imp);
                 [fusion_scores.min.frr,fusion_scores.min.far]= calculer_metriques(fusion_scores.min.gen,fusion_scores.min.imp);
                 [fusion_scores.max.frr,fusion_scores.max.far]= calculer_metriques(fusion_scores.max.gen,fusion_scores.max.imp); 
                 [fusion_scores.wsr.frr,fusion_scores.wsr.far]=calculer_metriques(fusion_scores.wsr.gen,fusion_scores.wsr.imp);
                 [fusion_scores.wsr1.frr,fusion_scores.wsr1.far]=calculer_metriques(fusion_scores.wsr1.gen,fusion_scores.wsr1.imp);
                 [fusion_scores.wsr2.frr,fusion_scores.wsr2.far]=calculer_metriques(fusion_scores.wsr2.gen,fusion_scores.wsr2.imp);
                 [fusion_scores.wsr3.frr,fusion_scores.wsr3.far]=calculer_metriques(fusion_scores.wsr3.gen,fusion_scores.wsr3.imp);

                 metrique_sum=table(fusion_scores.sum.frr,fusion_scores.sum.far,'VariableNames',{'frr','far'});
                 metrique_prod=table(fusion_scores.prod.frr,fusion_scores.prod.far,'VariableNames',{'frr','far'});
                 metrique_min=table(fusion_scores.min.frr,fusion_scores.min.far,'VariableNames',{'frr','far'});
                 metrique_max=table(fusion_scores.max.frr,fusion_scores.max.far,'VariableNames',{'frr','far'});
                 metrique_wsr=table(fusion_scores.wsr.frr,fusion_scores.wsr.far,'VariableNames',{'frr','far'});
                 metrique_wsr1=table(fusion_scores.wsr1.frr,fusion_scores.wsr1.far,'VariableNames',{'frr','far'});
                 metrique_wsr2=table(fusion_scores.wsr2.frr,fusion_scores.wsr2.far,'VariableNames',{'frr','far'});
                 metrique_wsr3=table(fusion_scores.wsr3.frr,fusion_scores.wsr3.far,'VariableNames',{'frr','far'});
                 metriques=table(metrique_sum,metrique_prod,metrique_min,metrique_max,metrique_wsr,metrique_wsr1,metrique_wsr2,metrique_wsr3,'VariableNames',varnames);                
                 save(strcat(prefix,direct,'_','metriques'),'metriques');

                 
        end
         
end
fprintf('------------------------clac fusion finished ------------------------\n');