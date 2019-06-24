
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
sayilar db 0011b,0000b,1000b,1111b,1010b
.code
LEA si,sayilar
mov cl,5     ;Dizi 5 elemanli oldugu icin dongu degiskenine 5 atanir.
mov bl,0     ;0 bitlerinin sayisini tutar.
mov dl,4     ;Her deger 4 bit oldugundan 4 kez bit bit kontrol edilir.

dongu:
mov bl,0     ;Her ihtimale karsi BL sifirlanir.
mov al,[si]  ;Dizinin elemanlari sirasiyla AL'ye atanir.
jmp sifir    ;0 sayilarinin kontrolu icin sifir etiktine gidilir.

geridon:
inc si       ;Si 1 arttirilarak bir sonraki elemana gecilir.
mov dl,4     ;Her eleman icin 4 kez azalan dl,yenilenerek 4 degerini alir.
loop dongu   ;Donguye doner.
jmp bitir    ;Bitire gider.


sifir:       ;0 bit sayisini kontrol eden etiket.
ror al,1     ;AL'deki sayi 1 saga kaydirilir.Ilk bit hem carry'e duser hem de basa gelir.
jc devam:    ;Carry'e dusen bit 1 ise devam etiketine gidilir.
inc bl       ;Carry'e dusen bit 0 ise BL yazmaci 1 arttirilir.

devam:
dec dl       ;Carry'ye dusen bit 1 ise bu etikete gelir ve DL 1 azaltilarak bir sonraki bite gecilir.
jnz sifir    ;DL 0 degilse yani elemanin butun bitleri kontrol edilmemisse tekrar sifir etiketine gidilir.
mov bh,4     ;Eger elemanin her biti kontrol edilmisse BH'a 4 atanir. 
sub bh,bl    ;4'ten BL'deki deger cikarilir.
jnz geridon  ;Eger 4 bitte sifir ise bitire gider.Degilse geridon etiketine giderek bir sonraki eleman kontrol edilir.


bitir:       ;Program sonlandirilir.                           
end
ret




