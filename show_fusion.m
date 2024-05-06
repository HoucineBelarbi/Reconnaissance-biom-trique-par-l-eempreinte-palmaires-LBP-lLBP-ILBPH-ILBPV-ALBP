clear; clc
run("options.m");
fprintf('\n------------------------ show merge started  ------------------------\n');
for ex=1:length(ALLextraction)
     extraction=upper(ALLextraction(ex));     
    for dr=1:length(direction)
         direct=upper(direction(dr));    
         fprintf('\nDirection %s\n',direct);
         prefix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_',direct,'_');
         Table=load(strcat(prefix,'metriques'));  
         err=struct;
            x=[min_seuil:move_seuil:max_seuil];
           [err(1).x err(1).y]=polyxpoly(x,Table.metriques.Sum.frr,x,Table.metriques.Sum.far);      
           [err(2).x err(2).y]=polyxpoly(x,Table.metriques.Prod.frr,x,Table.metriques.Prod.far);       
           [err(3).x err(3).y]=polyxpoly(x,Table.metriques.Min.frr,x,Table.metriques.Min.far);       
           [err(4).x err(4).y]=polyxpoly(x,Table.metriques.Max.frr,x,Table.metriques.Max.far);       
           [err(5).x, err(5).y]=polyxpoly(x,Table.metriques.Wsr.frr,x,Table.metriques.Wsr.far);
           [err(6).x, err(6).y]=polyxpoly(x,Table.metriques.Wsr1.frr,x,Table.metriques.Wsr1.far);
           [err(7).x, err(7).y]=polyxpoly(x,Table.metriques.Wsr2.frr,x,Table.metriques.Wsr2.far);
           [err(8).x, err(8).y]=polyxpoly(x,Table.metriques.Wsr3.frr,x,Table.metriques.Wsr3.far);
           terr=[];
           for i=1:8
               fprintf('   %s:= %f \n',string(varnames(i)),err(i).y);
               terr=[terr, err(i).y];
           end
           find(max(terr)==terr,1,'first');
    end    
end
fprintf('\n------------------------ show merge finched ------------------------\n');
