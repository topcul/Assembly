
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV ax,cs   ;Kod Segmentteki degeri AX'e atar.
MOV ds,ax   ;AX'teki degeri Data Segmente atar.LODSB komutu icin gerekli.
MOV es,ax   ;AX'teki degeri ES registera atar.STOSB komutu icin gerekli.
 
CLD         ;String komutlariyla kullanilarak DF=0 yapar ve her tekrarda SI ve DI 1 artarak CX azalir. 
MOV cx,14   ;Dongu degiskei olarak CX'e stringin uzunlugu atanir.Komutlar islendiginde 1 azalir.
LEA si,yazi ;yazi stringinin offset adresi SI ye atanir.
MOV di,200h ;STOSB komutunun arka planindan kullanilacagindan DI'ye 200h degeri atanir.

devam:
LODSB       ;DS:SI'deki adreste tutulan veriyi,harf harf AL/AX'e atar.
STOSB       ;AL/AX'ten alinan veriyi ES:DI'deki adreste tutulan bellekte saklar.
LOOP devam  ;CX=0 olana kadar dongu devam eder.
HLT
ret
yazi db "Merhaba dunya!"

ret

;LODSB, DS:SI tarafindan gosterilen adresten,verinin AL/AX'e yuklenmesini yapar.DF=0 oldugundan SI otomatik artarak
;her harfi tek tek AL'ye atar.
;STOSB, AL/AX'ten alinan verinin,ES:DI tarafindan gosterilen adreste saklanmasini saglar.DF=0 oldugundan SI otomatik artarak
;her harfi tek tek AL/AX'ten alarak bellege atar. 


