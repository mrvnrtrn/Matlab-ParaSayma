function SB=SveB( resim )
[sat,sut]=size(resim);
SB = resim;
for i=1:sat
for j=1:sut
    if(resim(i,j)>125)
        SB(i,j)=255;
    else
        SB(i,j)=0;
    end
end
end
end