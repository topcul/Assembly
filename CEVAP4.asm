
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX,0700h    ;Sonucun tutulacagi 0700:0700 adresi icin DS'ye atanmak uzere AX,0700h degerini tutar.
MOV SI,0700h    ;SI yazmaci 0700 bellek adresi degerini tutar.
MOV DS,AX       ;AX yazmacindaki deger,DX yazmacina atanir.
MOV CX,99d      ;100'den kucuk decimal sayilar kontrol ettirileceginden CX dongu sayaci 99d'den baslatilir.
MOV DX,0h       ;DX yazmaci basta sifirlanir.

kontrol:        ;99'dan baslayarak azalan sayilar bu etiket altinda kontrol ettirilir.
MOV AX,CX       ;Dongu degerini tutan CX registerdaki deger AX'e atanir.
MOV BL,4d       ;BL'ye 4d degeri atanir.
DIV BL          ;AX'te tutulan sayi 4'e bolunur.Kalan AH'ta,Bolum ise AL'de tutulur.
CMP AH,0d       ;Kalan ile 0 karsilastirilir.
JZ besebolunebilme ;Kalan 0 ise 5'e bolunebilirligi kontrol eden besebolunebilme etiketine gidilir.

devam:           ;Sayi 4'e bolunemiyorsa kontrol dongusune gidilsin ve CX 1 azalarak bir sonraki sayi kontrol ettirilsin.
loop kontrol     ;kontrol etiketine giderek dongu olusturur.

toplam:          ;4'e ve 5'e bolunebilen sayilarin toplamini yapan etikettir.
ADD DX,CX        ;CX'teki sayi,DX'teki degere eklenir.
MOV [SI],DX      ;SI registerin tuttugu 0700 adresine,DX teki deger atanir.
CMP CX,0h        ;Dongu registeri CX ile 0 karsilastirilir.
JZ son           ;Eger sayilar bitmisse yani dongu registeri CX 0 ise son etiketine git.
loop kontrol     ;CX 0 degilse kontrol dongusune dondurur ve kontrol islemi devam eder.

besebolunebilme: ;Etiket
MOV AX,CX        ;CX'te tutulan kontrol edilecek sayi AX'e atanir.
MOV BL,5d        ;BL registeri 5d degerini tutar.
DIV BL           ;AX'teki deger BL'ye bolunur.Kalan AH'ta,Bolum AL'de saklanir.
CMP AH,0d        ;AH(5'e bolumunden kalan) ile 0 karsilastirilir.
JZ toplam        ;Eger sonuc yani kalan 0 ise toplam etiketine git.
JMP devam        ;Kalan 0 degilse devam etiketine giderek kontol dongusune tekrar girilir.

son:             ;Etiket
end              ;Programi sonlandirir.


ret




