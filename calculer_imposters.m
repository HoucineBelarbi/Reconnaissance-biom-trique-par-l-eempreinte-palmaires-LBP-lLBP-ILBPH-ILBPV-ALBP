function best=calculer_imposters()
global name_data_save format_data_saved 
global start_personne pic_template 
global start_imposter  name_data_imposter name_data_imposter_bestscore
global heighsize widthsize nmbrpersonne rotaion direct windows extraction
fprintf('\n********************** Calc Imposter ******************************\n\n');
  if isfile(strcat(name_data_imposter,'.mat')) 
      delete(strcat(name_data_imposter,'.mat'));
  end
%   train(start_personne,end_personne,name_data_save);

s=struct;
   for k=1:size(pic_template,2)
        template=pic_template(1,k);
         name_file_template=strcat(name_data_save,'_',string(template),'.',format_data_saved);
          list =load(name_file_template);
          s(k).db=list;
          fprintf('template %s loaded\n',name_file_template);
   end
   
 brimp= waitbar(0,'Imposter Processing');   
 result=[]; 
    for i=start_imposter:(start_imposter+nmbrpersonne-1)
        [nfile_imoster dir_imoster]=getdir(i,1);
         img_imposter=imread(dir_imoster);
         image_depart=img_imposter;
         fprintf('\n\nProcessing imposter : %i\n',i);         
        for personne=start_personne:(start_personne+nmbrpersonne-1)
                     brimp= waitbar((i-start_imposter)/(nmbrpersonne),brimp,sprintf('%s: processing Imposter: %d User: %d ',direct,i,personne));
                         destemplate= s(1).db.list_template(:,:,personne);
                         score=genuine(destemplate,img_imposter);
                         %fprintf('\n user : %d \n template= 1',personne);
                         for km=2:size(pic_template,2)
                             template=pic_template(1,k);
                             name_file_template=strcat(name_data_save,'_',string(template),'.',format_data_saved);
                             %fprintf('  template : %d named %s\n',template,name_file_template);
                                destemplate= s(km).db.list_template(:,:,personne); 
                                    for angle =rotaion%[-4,4]%
                                        img_imposter=image_depart;
                                        img_imposter=imrotate(img_imposter,(angle),'bicubic','crop');%b=b(5:end-4,5:end-4);
                                        img_imposter = imresize(img_imposter,[heighsize widthsize]);
                                        %                                                 figure;imshow(img_imposter)
                                        score=min(score,genuine(destemplate,img_imposter));
                                    end
                                    
                         end
        fprintf('W:%d E:%s D:%s IMP Score(imposter,user)=score(%d,%d): %d \n',windows,upper(extraction),direct,i,personne,score);     
        result=[result;[nfile_imoster, string(score)]] ;
        end
    end
     close(brimp);

    save_score(result,name_data_imposter);
load (name_data_imposter);
%    table_score
best=get_best_score(name_data_imposter,name_data_imposter_bestscore);

fprintf('\n********************** Imposter finished ******************************\n\n');
%    best
end
%      result
  
% end



 



% calc_genuine(101,103,'imposter') % excute train en calc geuine directemen
%                                  % comence par etudient numéro 101 jusqua etudient
%                                  % numéro 103 
% calc_genuine(1,3,'ilbh9')% excute train en calc geuine directemen
%                          % comence par etudient numéro 1 jusqua etudient
%                          % numéro 03 