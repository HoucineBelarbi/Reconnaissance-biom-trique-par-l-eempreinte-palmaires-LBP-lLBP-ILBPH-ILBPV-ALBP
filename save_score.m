function save_score(temp,db)
 db_name=strcat(db,'.mat');
    try 
        load (db_name);
        table_score=[table_score, temp(:,2)];
        save(db_name, 'table_score'); 
    catch
        table_score=temp;
        save (db_name, 'table_score') ;
    end
end

