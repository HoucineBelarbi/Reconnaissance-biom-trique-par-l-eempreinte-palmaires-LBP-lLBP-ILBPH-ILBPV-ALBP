clear;clc;  
run("options.m");
fprintf("\n------------------- Show Execution time -------------------\n\n");
  for ex=1:length(ALLextraction)
     extraction=upper(ALLextraction(ex));
     fprintf('%s \n',extraction);
     for w=1: length(allwindows)
         windows=allwindows(w);
         fprintf('------ Execution time E:%s  W:%d ------\n',extraction,windows);
         Tem_prifix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_');
         tem_name=strcat(Tem_prifix,name_tempExcution);
         Table=load(tem_name);
         Table.tempExcutionT
     end
  end
        
fprintf("\n------------------- Show Execution time -------------------\n");