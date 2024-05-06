function mn=genuine(template,img)
global bgBlock_H endBlock_H  bgdblock_w  endblock_w    move
[ri,ci]=size(img);
score=[];

start_H=min(bgBlock_H-1,move);
start_W=min(bgdblock_w-1,move);
access_H=min(ri-endBlock_H,move);
access_w=min(ci-endblock_w,move);

        
bb= img(bgBlock_H-move:endBlock_H+move,bgdblock_w-move:endblock_w+move);size(bb);
bloctotal=ILBP( bb  );size(bloctotal);
 
x=size(bloctotal,1)-size(template,1)+1;
y=size(bloctotal,2)-size(template,2)+1;
pas=1;%3;

for i=1:pas:x%size(img1,1)-size(temp2,1)%2
    for j=1:pas:y%size(img1,2)-size(temp2,2)%2
        t=bloctotal(i:i+size(template,1)-1,j:j+size(template,2)-1);
        % size(t)
        s=Calc_Hamming(template,t);
        %         str=sprintf('bloc now: bloc+move=[%d:%d ,%d:%d) score: %d',bg_H,end_H,bg_W,end_W,s);
        %         disp(str);
        score=[score;s];
    end
end
  

% % %     for j=-start_H:+access_H
% % %         for i=-start_W:+access_w
% % %         bg_H=bgBlock_H+j;        
% % %         end_H=endBlock_H+j;
% % %         bg_W=bgdblock_w+i;
% % %         end_W=endblock_w+i;
% % %         bloc=img(bg_H:end_H,bg_W:end_W);
% % %         bloc_LBP=ILBP(bloc);       %figure;imshow(bloc_LBP)
% % %         
% % %     %    bloc_LBP=bloctotal(bg_H:end_H,bg_W:end_W);size(bloc_LBP)
% % %         s=Calc_Hamming(template,bloc_LBP);
% % % %         str=sprintf('bloc now: bloc+move=[%d:%d ,%d:%d) score: %d',bg_H,end_H,bg_W,end_W,s);
% % % %         disp(str);
% % %         score=[score;s];
% % %         end
% % %     end
%     score'
    mn=min(score);
    mn=min(mn,10^6);
end
