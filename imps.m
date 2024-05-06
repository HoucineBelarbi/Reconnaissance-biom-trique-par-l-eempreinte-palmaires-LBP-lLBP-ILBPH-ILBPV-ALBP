  for k=1:size(pic_template,2)
        template=pic_template(1,k);
         name_file_template=strcat(name_data_save,'_',string(template),'.',format_data_saved);
          s(k).db=load(name_file_template)      
%           str=sprintf("tepmlate: %s",name_file_template);
%           disp(str);
  end
    result=[];
    for i=start_imposter:(start_imposter+nmbrpersonne-1)
        [nfile_imoster dir_imoster]=getdir(i,1);
         img_imposter=imread(dir_imoster);
         image_depart=img_imposter;
         img_imposter = imresize(img_imposter,[heighsize widthsize]); % resize image
         str=sprintf("\ntepmlate: %s user: %s ",name_file_template,nfile_imoster);
         disp(str);
        for km=1:size(pic_template,2)
                         destemplate= s(km).db(:,:,1);
                         sdepart=genuine(destemplate,img_imposter);
                         for personne=start_personne+1:(start_personne+nmbrpersonne)
                                template=pic_template(1,k);
                                destemplate= s(km).db(:,:,personne);
                                score=genuine(destemplate,img_imposter);
                                score=min(sdepart,score);
                         end                 
        end
    end
     str=sprintf("\n%d)imposter score\ntemplate=%d-->(%s)",k,template,name_file_template);
     disp(str);
%      result
  
