function fus=calc_fusion(scores)
fus=struct;
%sum fusion 
fus.sum.gen=0; fus.sum.imp=0;

%prod fusion 
fus.prod.gen=1; fus.prod.imp=1;

%min fusion 
fus.min.gen=10^9; fus.min.imp=10^9;

%max fusion 
fus.max.gen=0; fus.max.imp=0;

%sum wsr 
fus.wsr.gen=0; fus.wsr.imp=0;
    for i=1:size(scores.gen,2)
       fus.sum.gen=fus.sum.gen+scores.gen(i).best;
       fus.sum.imp=fus.sum.imp+scores.imp(i).best;
       
       fus.prod.gen=fus.prod.gen.*scores.gen(i).best;
       fus.prod.imp=fus.prod.imp.*scores.imp(i).best;
       
       fus.min.gen=min(fus.min.gen,scores.gen(i).best);
       fus.min.imp=min(fus.min.imp,scores.imp(i).best);
       
       fus.max.gen=max(fus.max.gen,scores.gen(i).best);
       fus.max.imp=max(fus.max.imp,scores.imp(i).best);
       
       fus.wsr.gen=fus.wsr.gen+(1/size(scores.gen,2))*(scores.gen(i).best);
       fus.wsr.imp=fus.wsr.imp+(1/size(scores.gen,2))*(scores.imp(i).best);       
    end
    t=numel(int2str(fix(max(fus.prod.gen))))-2;
    fus.prod.gen=fus.prod.gen/(10^t);
    fus.prod.imp=fus.prod.imp/(10^t);
    
       %WSR1=0.5  *scores_4n+0.5*  (   0.33*(scores_1n+ scores_2n+ scores_3n)  )
       fus.wsr1.gen=0.5*(scores.gen(4).best)+(0.5)*(0.33*(scores.gen(1).best+scores.gen(2).best+scores.gen(3).best));
       fus.wsr1.imp=0.5*(scores.imp(4).best)+(0.5)*(0.33*(scores.imp(1).best+scores.imp(2).best+scores.imp(3).best));
     
       fus.wsr2.gen=0.66*(scores.gen(4).best)+(0.33)*(0.33*(scores.gen(1).best+scores.gen(2).best+scores.gen(3).best));
       fus.wsr2.imp=0.66*(scores.imp(4).best)+(0.33)*(0.33*(scores.imp(1).best+scores.imp(2).best+scores.imp(3).best));
       
       fus.wsr3.gen=0.33*(scores.gen(4).best)+(0.66)*(0.33*(scores.gen(1).best+scores.gen(2).best+scores.gen(3).best));
       fus.wsr3.imp=0.33*(scores.imp(4).best)+(0.66)*(0.33*(scores.imp(1).best+scores.imp(2).best+scores.imp(3).best)); 
end


