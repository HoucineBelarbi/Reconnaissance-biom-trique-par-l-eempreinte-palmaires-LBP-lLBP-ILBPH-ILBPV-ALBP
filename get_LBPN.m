function Table_ERR=get_LBPN(Tab1,Tab2,col,w1,w2) 
%     a=[0.1028  0.0993;0.0961	0.1340;0.0950	0.0982;0.0767	0.0451];
%     b=[0.1033	0.0967;0.1044	0.1312;0.0983	0.1003;0.0767	0.0417];

    % a=[5  5;15 15;7 7;9 9];
    % b=[4  4;9 9;10 10;11 11];
    tw1=Tab1(:,col);
    tw2=Tab2(:,col);
    prt1=Tab1(:,col);
    prt2=Tab2(:,col);
    l1=length(tw1);
    l2=length(tw2);
    score=[];
    windows=[];
    Bloc=[];
    while (length(tw1)>0 || length(tw1)>0 )
        s=0;
        w=[];
        m1=min(tw1);
        m2=min(tw2);
        tl1=length(tw1);
        tl2=length(tw2);
        if (m1<=m2 && tl1>fix(l1/2)) || (sum(windows==9) >= fix(l2/2))
            s=m1;
            p=find(tw1==m1,1,'first');
            pr=find(prt1==m1,1,'first');
            prt1(pr)=0;            
            w=w1;
    %       fprintf('windows 1\n');
        else
            s=m2;
            p=find(tw2==m2,1,'last');
            pr=find(prt2==m2,1,'first');
            prt2(pr)=0;
    %       fprintf('windows 2\n');
            w=w2;
        end
    %     fprintf('--->s=%d\n',s);
        Bloc=[Bloc;pr];    
        score=[score;s];
        windows=[windows;w];
        tw1(p)=[];
        tw2(p)=[];
    end
    %score
    
    Table_ERR=table(Bloc,windows,score);
end
