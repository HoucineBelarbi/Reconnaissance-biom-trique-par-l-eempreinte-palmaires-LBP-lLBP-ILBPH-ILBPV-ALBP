cen=fix(windows/2);
direct=upper(direction(dr));
        bgBlock_H=dim_bloc{dim}(1,1);
        endBlock_H=dim_bloc{dim}(1,2);
        bgdblock_w=dim_bloc{dim}(1,3);
        endblock_w=dim_bloc{dim}(1,4);
    switch direct
        case 'V'
        bgBlock_H=bgBlock_H-cen;
        endBlock_H=endBlock_H+cen;
        fprintf('Direction: vectoriel\n');
        case 'D'
        bgBlock_H=bgBlock_H-cen;
        endBlock_H=endBlock_H+cen;
        bgdblock_w=bgdblock_w-cen;
        endblock_w=endblock_w+cen;    
         fprintf('Direction: Both %s \n',direct);    
         case 'M'
        bgBlock_H=bgBlock_H-cen;
        endBlock_H=endBlock_H+cen;
        bgdblock_w=bgdblock_w-cen;
        endblock_w=endblock_w+cen;
         fprintf('Direction: Max(H,V)\n');
            otherwise
        bgdblock_w=bgdblock_w-cen;
        endblock_w=endblock_w+cen;
         fprintf('Direction: Horizontal\n');
    end
    prefix=strcat('N',int2str(nmbrpersonne),'_',extraction,'_','W',int2str(windows),'_',int2str(dim_bloc{dim}(1,1)),'-',int2str(dim_bloc{dim}(1,2)),'_',int2str(dim_bloc{dim}(1,3)),'-',int2str(dim_bloc{dim}(1,4)),'_',direct,'_');
