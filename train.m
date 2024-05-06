function list_template=train(s_personne,name_data)
global format_data_saved taill_bloc_row taill_bloc_column bgBlock_H;
global endBlock_H  bgdblock_w  endblock_w 
global nmbrpersonne pic_template 
global heighsize widthsize

fprintf('\n********************** Training is running... ******************************\n');
brtrain= waitbar(0,sprintf('Training is processing'));
    for k=1:size(pic_template,2)
        list_template=uint8(zeros(taill_bloc_row,taill_bloc_column,nmbrpersonne));
        template=pic_template(1,k);
        for i=s_personne:(s_personne+nmbrpersonne-1)
            [nfile1 dir]=getdir(i,template);
            img=imread(dir);
            img = imresize(img,[heighsize widthsize]); % resize image
            list_template(:,:,i)=gettemplate(img,bgBlock_H, endBlock_H,bgdblock_w,endblock_w);
            waitbar(i / nmbrpersonne,brtrain,sprintf('Training Template %d User %d ',template,i));
        end
        name_file_template=strcat(name_data,'_',string(template),'.',format_data_saved);
        save(name_file_template, 'list_template');
    end
    close(brtrain);
    fprintf('********************** Training finished! ******************************\n\n');

    % options=[bdd format lenghtnamefile heighsize widthsize bgBlock_H endBlock_H endblock_w endblock_h];
    % for i=2:5
    % [nfile1 genuine]=calculer_genuine (2,1,5,options);
    % str=sprintf("\nfile:%s \n min score: %d\n",nfile1,genuine);
    % disp(str);
    % end
end


