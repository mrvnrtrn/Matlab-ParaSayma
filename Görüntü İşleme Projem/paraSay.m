function paraSay(resim)
clc;
resim=imresize(resim,[300 300]); %resim boyutlar� paran�n boyutunu anlamak i�in �nemli hocam. O y�zden 300x300 �eklinde konrtol ediyorum.
figure(1),imshow(resim);
%********************************************%
griResim=griresim(resim); %Kendi algoritmamla resmi griye �eviriyorum.
sb=SveB(griResim); % Yine kendi algoritmamla gri resmi siyah-beyaza �eviriyorum.
figure(2),imshow(sb);
%********************************************%
sb=imcomplement(sb); %Negatiflk i�in.
figure(3),imshow(sb)
sb=imfill(sb,'holes');%�ukurlar� doldurmak i�in.
sb = bwareaopen(sb,30);%30p'den k���k olan nesneleri kald�rmak i�in. 
figure(4),imshow(sb);
%********************************************%
se=strel('disk',12); %Yar��ap� 11px olan disk bi�iminde matris.
sb2=imerode(sb,se); %Birlesik paralar� ay�tmak i�in (erozyon).
figure(5),imshow(sb2);
%********************************************%
[B,L] = bwboundaries(sb2);  % a��nm�� resimde ka� nesne oldu�unu almak i�in
stats = regionprops(sb2, 'Area','Centroid');
figure(6),imshow(resim);
    toplam = 0;
    for n=1:length(B)
        a=stats(n).Area;  % paralar�n alanlar�n� almak i�in 
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

     title(['$$$$ TOPLAM ���� = ',num2str(toplam),' TL (tl simgesini kabul etmedi hocam)'])
%********************************************%
end