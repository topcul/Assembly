
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
dizi db 5,1,9,7,8  ;Dizi etiketi ile tanimli bir dizi 
.code
LEA si,dizi        ;SI registeri dizi'nin offset adresini tutar.
mov cx,4           ;Dongu degiskeni 4 degerini tutar.Bir sonraki satirda ilk eleman alindigindan dongu 1 eksik baslatilir. 
mov al,[si]        ;AL registerina SI'nin tuttugu adresteki deger ataniyor.

enkucuk:           ;Dizinin en kucuk elemanini bulan dongu
inc si             ;Program basinda ilk eleman zaten AL'de tutuldugundan,karsilastirmak icin  SI arttirilarak dizinin bir sonraki elemanina erisilir.
mov bl,[si]        ;Dizinin sonraki elemani BL'ye atanir.
cmp al,bl          ;Ilk elemanla bir sonraki eleman karsilastirilir.ç
jb git             ;Ilk eleman daha kucukse git etiketine gider.
mov al,bl          ;Karsilastirilan sayilardank kucuk olan sayi AL'de tutuluyor.
git:               ;AL'de tutulan elmanla diger elemanlari kasilastirarak daha kucugu bulmak icin donguye donulur.
loop enkucuk       ;Dongu 

LEA si,dizi        ;SI registeri dizi'nin offset adresini tutar.
mov cx,4           ;Dongu degiskeni 4 degerini tutar.Bir sonraki satirda ilk eleman alindigindan dongu 1 eksik baslatilir. 
mov bl,[si]        ;BL registerina SI'nin tuttugu adresteki deger ataniyor.

enbuyuk:           ;Dizinin en buyuk elemanini bulan dongu
inc si             ;Ilk elaman BL'de tutuldugundan bir sonraki eleman icin adres 1 arttirilir.
mov dl,[si]        ;SI adresindeki deger DL'ye atanir.
cmp bl,dl          ;Dizinin ilk elemani ile sirasiyla sonraki elemanlar karsilastirilir.
ja git2            ;BL daha buyukse git2 etiketine gidilir.
mov bl,dl          ;Karsilastirilanlardan buyuk olan BL'ye atanir.
git2:              ;BL'de tutulan elmanla diger elemanlari kasilastirarak daha buyugu bulmak icin donguye donulur.
loop enbuyuk       ;enbuyuk etiketine gonderen dongu.

add al,bl          ;AL'de tutulan en kucuk deger ile BL'de tutulan en kucuk deger toplanir.
mov dl,2           ;Kucuk ve Buyuk sayi oldugundan DL'ye 2 atanir.
div dl             ;AL'de tutulan degeri 2'ye bolerek ortalama bulunur.8 bitlik bolme oldugundan AX bolunur.AL'de bolum,AH'ta kalan tutulur.
mov bl,al          ;Ortalamanin BL'de tutulmasi istendiginden AL'deki sonuc BL registerina atanir.
ret                ;Program sonlandirilir.




