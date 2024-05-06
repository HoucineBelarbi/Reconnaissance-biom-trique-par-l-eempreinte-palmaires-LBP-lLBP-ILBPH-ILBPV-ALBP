function best=get_best_score(db,bd_bestscore)
db_name=strcat(db,'.mat');
    try 
        load (db_name);
        best_column=min(str2double(table_score(:,2:end)),[],2);
        best=[table_score(:,1),best_column];
        save (bd_bestscore, 'best'); 
    catch
       str=sprintf("error loading %s",db_name);
      disp(str);
    end
end