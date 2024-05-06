function mat = ALLBPV(t)
global windows
w=windows;
cen=fix(w/2);
[numR numC]=size(t);
mat=uint8(zeros(numR,numC));
    if(numR>=w)
        for j=1:numC
            for i=1:numR-(w-1)
              mat(i+cen,j)=calcCenterMean(t(:,j),i,i+(w-1));   
            end
        end
    mat=mat((cen+1):(numR-cen),:);
    else
        disp('oops!!..The number of image columns must be greater than or equal to nine (9)!');
    end
end