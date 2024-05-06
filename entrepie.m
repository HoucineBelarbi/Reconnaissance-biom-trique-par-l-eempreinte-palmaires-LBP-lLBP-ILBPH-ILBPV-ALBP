clear; clc;
run("options.m");
fprintf('calculate entrepy started...\n');
N=nmbrpersonne;
finale=double(zeros(heighsize,widthsize));
compteur=0;
brtrain= waitbar(0,sprintf('calculate entrepy started'));
for k=1:nmbrpersonne
    for n = [1,nmbrpicutre]
     waitbar(k / nmbrpersonne,brtrain,sprintf('processing entrepy user %d pic %d ',k,n));
        
        [nfile fich]=getdir(k,n);
        if isfile(fich)
            im=(imread(fich));
            im=  imresize(im, [heighsize,widthsize]) ;
            %im=255-(im);%figure;imshow(im)
            finale=finale+double(im);%Somme des images d'apprentissage
            compteur=compteur+1;
        else
            n=nmbrpicutre;
        end
    end;
end
close(brtrain);
finale=finale/(2*nmbrpersonne);% Calcul de l'image moyenne

pas=16;entropies_des_blocs=[];
i1=1;j1=1;
p=1;
contor=1;
for i=1:pas:size(finale,1)
    % fprintf('  i ==%3.2d\n',i);
    j1=1;
    for j=1:pas:size(finale,2)
        t=uint8(finale(  i:i+pas-1,   j:j+pas-1));
        m=entropy(t);%mean(mean(t));
        %fprintf('  Mean==%3.2d\n',m);
        imgB(i:i+pas-1,j:j+pas-1)=m;
        entropies_des_blocs(i1,j1)=m;
        p=p+1;
        if m>=4.5
            fprintf ('%d_ Entropie=%f, x1=%d, x2=%i, y1=%d, y2=%d \n',contor, m, i, i+pas-1,j, j+pas-1);
        end;
        j1= j1+1;
            contor=contor+1;
    end;
    i1=i1+1;
end
imgB=imgB*(255/max(max(imgB)));
subplot(1,2,1),imshow(uint8(finale));
subplot(1,2,2),imshow(uint8(imgB));
% entropies_des_blocs
% entropies_des_blocs>=4.5


