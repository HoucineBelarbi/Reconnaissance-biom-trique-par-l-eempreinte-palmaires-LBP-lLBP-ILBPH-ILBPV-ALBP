
function best=calc_genuine(s_personne,name_data)
global format_data_saved nmbrpicutre nmbrpersonne pic_template name_data_user name_data_user_bestscore move
global windows extraction
global heighsize widthsize rotaion direct
 if isfile(strcat(name_data_user,'.mat')) 
     delete(strcat(name_data_user,'.mat'));
 end
fprintf('\n********************** Calc Genuine ******************************\n\n');
fprintf('move=%d\n',move);
% train(s_personne,e_personne,name_data);
brgen= waitbar(0,sprintf('genuine processing'));
    for k=1:size(pic_template,2)
        template=pic_template(1,k);
         name_file_template=strcat(name_data,'_',string(template),'.',format_data_saved);
         list=load(name_file_template);
        [bdd_r,bdd_c,max_personne]=size(list.list_template);
        result=[];
      fprintf("\n%d. template: %d\n",k,template);
  
        if(nmbrpersonne<=max_personne)
            for personne=s_personne:(nmbrpersonne+s_personne-1)
            destemplate= list.list_template(:,:,personne);
                for picture=1:nmbrpicutre
                    if(~ismember(picture,pic_template))
                    [nfile dir]=getdir(personne,picture);
                      if isfile(dir)
                            img=imread(dir);
                            image_depart=img;
                            img = imresize(img,[heighsize widthsize]); % resize image
                            score=genuine(destemplate,img);
                             for angle =rotaion%[-4,4]%
                                img=image_depart;
                                img=imrotate(img,(angle),'bicubic','crop');%b=b(5:end-4,5:end-4);
                                img = imresize(img,[heighsize widthsize]);
                                %figure;imshow(img)
                                score=min(score,genuine(destemplate,img));
                            end
                          fprintf('W:%d E:%s D:%s T%d: GEN %s score: %d\n',windows,upper(extraction),direct,template,nfile,score);
                            row=[nfile, string(score)];
                            result=[result;row];
                            brgen= waitbar(personne/(nmbrpersonne+s_personne),brgen,sprintf('genuine processing :%s template: %d User: %d picture: %d',direct,template,personne,picture));

                      else
                          picture=nmbrpicutre;
                      end
                    end
                end
            end
        else
          err=sprintf('ooops....! Le nombre de personnes est supérieur au nombre de personnes dans la base de données\n nmbrpersonne=%d\n max_personne=%d',nmbrpersonne,max_personne);
            disp(err);
        end
%      str=sprintf("\n%d)score\ntemplate=%d-->(%s)",k,template,name_file_template);
%      disp(str);
%      result
     save_score(result,name_data_user);
    end
% users_score=strcat(name_data_user,'.mat');
load (name_data_user);
%     table_score;
% str=sprintf("\n%d)score\ntemplate=%d-->(%s)",k,template,name_file_template);
best=get_best_score(name_data_user,name_data_user_bestscore);
%     best
fprintf('\n********************** Genuine finished ******************************\n\n');
close(brgen);
end
