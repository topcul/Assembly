org 100h

.data
adsoyad db ' topcu '
.code

mov si,offset adsoyad ;Dizinin offset(baslangic adresini) si'ye atandi.
mov di,si             ;Dizinin son karkterine kadar yazdirilacagi icin dizinin son adresi bilinmeli.
add di,14             ;Offset adresine karakter sayisi eklenip son adres bulunur.Di'de saklanir. 
yaz:                  ;Ekrana yazdiran etiket.
mov al,[si]           ;INT 10h / AH = 0Eh  kesmesinde AL,yazilacak karakteri tutar.
                      ;SI'de tutulan adresteki karakter AL'ye atanarak ekrana yazdirilir.

mov ah,0eh            ;Kesmede yazilmasi gereken deger
int 10h               ;INT 10H kesmesi
inc si                ;SI arttirilarak bir sonraki karakter ele aliniyor.
cmp si,di             ;SI'deki adres ile dizinin son adresi karsilastiriliyor.
jnz yaz               ;Eger 0 degilse yani son karakter degilse yaz etiketine gider ve bir sonraki karakteri yazdirir.

ret




