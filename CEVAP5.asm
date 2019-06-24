
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

Org 100h
mov [2000h],1h   ;2000h adresine bir sayi atandi.
mov [2001h],21h  ;2001h adresine de bir sayi atandi.
carp:            ;Sayilarin carpildigi etiket.
mov al,[2000h]   ;2000h adresindeki deger AL'ye atandi.
mov bl,[2001h]   ;2001h adresindeki deger BL'ye atandi.
mul bl           ;AL ile BL carpilir.8 bitlik oldugundan sonuc AX'te saklanir.
mov [2002h],ax   ;AX'te saklanan sonuc degeri 2002h adresine atanir.
mov cl,[2000h]   ;2000h'daki deger CL'ye atandi.
sub cl,bl        ;2000h ve 2001h adreslerindeki degerlerin farki bulunur.Bu sonuc bolen sayidir. 
cmp cl,0         ;CL de tutulan fark sonucu,0 ile karsilastirilir. 
JZ bolmehatasi   ;Eger 0 ise bolmehatasi etiketine gider.
JS tumleyen      ;Sonuc negatif ise tumleyen etiketine gider.(Sign bayragi kontrol edilir.)

bol:             ;Bolme islemi yaptilan etikettir.
div cl           ;AX'te tutulan sonuc degerini CL'deki farka boler.AH kalani,AL bolumu tutar.
mov [2003h],al   ;Bolum,2003h adresine atanir.
mov [2004h],ah   ;Kalan,2004h adresine atanir.
JMP son          ;Son etiketine gidip program sonlandirilir.


bolmehatasi:     ;Bolen durumunda olan fark degeri 0 ise program bu etikete gelir.                                  
add cl,5h        ;Fark sonucuna 5h eklenir.
JMP bol          ;Tekrar bol etiketine gidilir.

tumleyen:        ;Sign bayragi 1,yani farkin negatif oldugu durumda islenen etikettir.
mov dx,256d      ;DX'e 256d sayisi atanir.
sub dx,Cx        ;Sayinin 256'ya tumleyeni alinarak sayinin pozitifi bulunur ve DX'te saklanir.
mov cl,dl        ;DL'deki mutlak fark,negatif farkin tutuldugu CL'ye atanir.Boylelikle bolen sayi,negatif sayinin pozitif karsiligi olmus olur.
JMP bol          ;Program tekrar bol etiketine giderek isleme devam eder.
 
son:             ;Programi sonlandiran etiket.
end              ;Programi sonlandirir.

ret              ;Isletim sistemine geri donulur.



