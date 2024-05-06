function mat = ALLBPH(t)
global windows
w=windows;
cen=fix(w/2);
[numR numC]=size(t);
    mat=uint8(zeros(numR,numC));

    if(numC>=w)
        for j=1:numR
            for i=1:numC-(w)
              mat(j,i+cen)=calcCenterMean(t(j,:),i,i+(w-1));   
            end
        end
    mat=mat(:,(cen+1):(numC-(cen)));
    else
        disp('oops!!..The number of image columns must be greater than or equal to nine (9)!');
    end
end