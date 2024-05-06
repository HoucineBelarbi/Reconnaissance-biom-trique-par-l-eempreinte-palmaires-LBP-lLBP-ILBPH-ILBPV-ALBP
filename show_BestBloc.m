clear;clc;  
run("options.m");
fprintf("\n------------------- Show Best Bloc -------------------\n\n");
  for ex=1:length(ALLextraction)
         extraction=upper(ALLextraction(ex));
         fprintf('ILBPN %s \n',extraction);
                 fprintf('******* Best E:%s  ******\n',extraction);
                 Temp_prifix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_');
                 tem_name_a=strcat(Temp_prifix,'W',int2str(windows_fusion(1)),'_',name_EER); 
                 w1=load(tem_name_a);
                 w1=sum(w1.EER,2);
                 tem_name_b=strcat(Temp_prifix,'W',int2str(windows_fusion(2)),'_',name_EER);
                 w2=load(tem_name_b);
                 w2=sum(w2.EER,2);
                 BestBloc=get_LBPN(w1,w2,1,windows_fusion(1),windows_fusion(2))
                 save(strcat(Temp_prifix,name_best_err,'.mat'),'BestBloc')
  end
        
fprintf("\n------------------- Show Best Block -------------------\n\n");