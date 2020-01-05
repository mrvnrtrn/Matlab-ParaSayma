function paraSay(resim)
clc;
resim=imresize(resim,[300 300]); %resim boyutlarý paranýn boyutunu anlamak için önemli hocam. O yüzden 300x300 þeklinde konrtol ediyorum.
figure(1),imshow(resim);
%********************************************%
griResim=griresim(resim); %Kendi algoritmamla resmi griye çeviriyorum.
sb=SveB(griResim); % Yine kendi algoritmamla gri resmi siyah-beyaza çeviriyorum.
figure(2),imshow(sb);
%********************************************%
sb=imcomplement(sb); %Negatiflk için.
figure(3),imshow(sb)
sb=imfill(sb,'holes');%Çukurlarý doldurmak için.
sb = bwareaopen(sb,30);%30p'den küçük olan nesneleri kaldýrmak için. 
figure(4),imshow(sb);
%********************************************%
se=strel('disk',12); %Yarýçapý 11px olan disk biçiminde matris.
sb2=imerode(sb,se); %Birlesik paralarý ayýtmak için (erozyon).
figure(5),imshow(sb2);
%********************************************%
[B,L] = bwboundaries(sb2);  % aþýnmýþ resimde kaç nesne olduðunu almak için
stats = regionprops(sb2, 'Area','Centroid');
figure(6),imshow(resim);
    toplam = 0;
    for n=1:length(B)
        a=stats(n).Area;  % paralarýn alanlarýný almak için 
        centroid=stats(n).Centroid;
            if (a>1200)
                 toplam = toplam + 1;
                 text(centroid(1),centroid(2),'1 TL');
            elseif a >800 &&  a < 1050
                toplam = toplam + 0.5;
                text(centroid(1),centroid(2),'50 Kr');
            elseif a >600 &&  a < 650
                toplam = toplam + 0.25;
                text(centroid(1),centroid(2),'25 Kr');
            elseif a > 360 &&  a < 590
                toplam = toplam + 0.10;
                text(centroid(1),centroid(2),'10 Kr');
            else
                 toplam = toplam + 0.05;
                 text(centroid(1),centroid(2),'5 Kr');
            end
    end

     title(['$$$$ TOPLAM €€€€ = ',num2str(toplam),' TL (tl simgesini kabul etmedi hocam)'])
%********************************************%
end