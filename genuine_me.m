function mn=genuine(template,img)
global bgBlock_H endBlock_H  bgdblock_w  endblock_w  move direction
[ri,ci]=size(img);
score=[];
start_H=min(bgBlock_H-1,move);
start_W=min(bgdblock_w-1,move);
access_H=min(ri-endBlock_H,move);
access_w=min(ci-endblock_w,move);

    for j=-start_H:+access_H
        for i=-start_W:+access_w
        bg_H=bgBlock_H+j;        
        end_H=endBlock_H+j;
        bg_W=bgdblock_w+i;
        end_W=endblock_w+i;
        bloc=img(bg_H:end_H,bg_W:end_W);
        bloc_LBP=ILBP(bloc);       
        s=Calc_Hamming(template,bloc_LBP);
%         str=sprintf('bloc now: bloc+move=[%d:%d ,%d:%d) score: %d',bg_H,end_H,bg_W,end_W,s);
%         disp(str);
        score=[score;s];
        end
    end
    mn=min(score);
    mn=min(mn,10^6);
end
