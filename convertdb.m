    run("options.m");
    fprintf('start convert');
   for ex=1:length(ALLextraction)
     extraction=ALLextraction(ex);
      for w=1: length(allwindows)
         windows=allwindows(w);   
         for dim=1:length(dim_bloc)
            for dr=1:length(direction)
               direct=upper(direction(dr));
                bgBlock_H=dim_bloc{dim}(1,1);
                endBlock_H=dim_bloc{dim}(1,2);
                bgdblock_w=dim_bloc{dim}(1,3);
                endblock_w=dim_bloc{dim}(1,4);
            switch direct
                case 'V'
                bgBlock_H=bgBlock_H-4;
                endBlock_H=endBlock_H+4;
                case 'D'
                bgBlock_H=bgBlock_H-4;
                endBlock_H=endBlock_H+4;
                bgdblock_w=bgdblock_w-4;
                endblock_w=endblock_w+4;
                    otherwise
                bgdblock_w=bgdblock_w-4;
                endblock_w=endblock_w+4;
            end
           %diclartion prefix
            prefix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_',int2str(dim_bloc{dim}(1,1)),'-',int2str(dim_bloc{dim}(1,2)),'_',int2str(dim_bloc{dim}(1,3)),'-',int2str(dim_bloc{dim}(1,4)),'_',direct,'_');
            Second_prefix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_','B',int2str(dim),'_',direct,'_');
            %rename database user an imposter
            name_data_user_bestscore=strcat(prefix,name_data_user_bestscore);
            name_data_imposter_bestscore=strcat(prefix,name_data_imposter_bestscore);
            name_gen='GEN';
            name_imp='IMP';

            %load database user an imposter
            users=load(name_data_user_bestscore);
            users=str2double(users.best(:,2));
            dirfile=strcat('prof\' ,strcat(Second_prefix,'gen'));
            save(dirfile,'users');

            imposters=load(name_data_imposter_bestscore);
            imposters=str2double(imposters.best(:,2));
            dirfile=strcat('prof\',strcat(Second_prefix,'imp'));
            save(dirfile,'imposters');

             %initialitation les nom des variabl 
            name_data_user_bestscore=erase(name_data_user_bestscore,prefix);
            name_data_imposter_bestscore=erase(name_data_imposter_bestscore,prefix);

            end
         end
      end
   end
   fprintf('end convert');