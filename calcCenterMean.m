function center = calcCenterMean(Tble,bg,ed)
tb=Tble(bg:ed);
    center=0;
    j=0;  
    cen=fix((length(tb)-1)/2);
    tb=[tb(1:cen),tb(cen+2:end)];
    men=mean(tb);
    for i=1:length(tb);
     %  fprintf('t[%d]=%d ,2^%d=%d\n',i,tb(i),j,2^j);
         if(tb(i)>=(men))
         center=center+2^j;
          %fprintf('---->t[%d]=%d ,2^%d=%d\n',i,tb(i),j,2^j);
         end
        if(cen<5 | i<cen)
            %fprintf('i=%d cen=%d 2^j=%d\n',i,cen,2^j);
            j=j+1;            
        elseif(i>cen)           
            j=j-1;
            % fprintf('i=%d 2^j=%d\n',i,2^j);
        end
        %fprintf('center=%d \n',center');
    end

end


