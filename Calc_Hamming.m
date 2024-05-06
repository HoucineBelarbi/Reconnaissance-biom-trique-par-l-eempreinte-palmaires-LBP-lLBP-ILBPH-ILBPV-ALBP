function matbin = Calc_Hamming(img1,img2)
d=bitxor(img1,img2);
k=dec2bin(d,8);
matbin=bitget(uint8(k),1);
matbin=sum(sum(matbin));
end