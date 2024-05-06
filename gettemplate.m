% img=imread('BDD\001_1.bmp');
% gettemplate(img);

function template=gettemplate(img,bg_H, end_H,bg_W,end_W)
%******** extraction ***********
global extraction
ext=upper(extraction);
bloc=img(bg_H:end_H,bg_W:end_W);
switch ext
    case 'ALLBP'
        template=ALLBP(bloc);
    case 'ILBP'
        template=ILBP(bloc);
end

%***** le block (49:64,81:96)***********
end




