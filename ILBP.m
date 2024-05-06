function mat=ILBP(bloc)
global windows;  %fenetre
cen=fix(windows/2);
global direct
    switch lower(direct)
    case 'v'
%         fprintf('**** v past ----');
          mat=ILBPV(bloc);
         
    case 'd'
%         fprintf('**** d past ----');
        mat1=ILBPV(bloc(:,(cen+1):end-(cen)));
        mat2=ILBPH(bloc((cen+1):end-(cen),:));
%         mat1=mat1(:,5:end-4);
%         mat2=mat2(5:end-4,:);
        mat=sqrt((double(mat1).^2+double(mat2).^2)*0.5);
         mat=uint8(mat);
             case 'm'
%         fprintf('**** d past ----');
        mat1=ILBPV(bloc(:,(cen+1):end-(cen)));
        mat2=ILBPH(bloc((cen+1):end-(cen),:));
%         mat1=mat1(:,5:end-4);
%         mat2=mat2(5:end-4,:);
        mat=max(mat1,mat2);
        case 'h'
%          fprintf('**** h past ----');
          mat=ILBPH(bloc);
     end

end