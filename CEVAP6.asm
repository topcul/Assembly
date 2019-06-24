
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
dizi db 1,2,3,4,5,6,7,8,9,10 ;Byte tipinde bir dizi tanimlandi.
.code
lea si,dizi                  ;Dizinin adres degeri SI'de tutulur.
mov ax,0                     ;AX sifirlandi.
mov bx,0                     ;BX sifirlandi.
mov cx,10                    ;Dizi 10 elemanli oldugundan dongu degiskeni 10 degerini alir.
yiginaatama:      ;Dizi elemanlarinin yigina atildigi etiket.
mov al,[si]       ;SI'de tutulan adresteki degeri AL'ye atar.
push ax           ;AX'teki dizi elemani yigina atilir.
add si,1          ;Adres degeri db oldugundan SI,1 arttirilarak bir sonraki adrese gecilir.
loop yiginaatama  ;Dongu
mov cx,10         ;Sifirlanan CX registerina tekrar 10 degeri atanir.
mov ax,0          ;AX sifirlanir.
mov si,1000h      ;Yigindan cekilecek olan degerleri 1000h'tan itibaren yazdirir.SI'ye 1000h degeri verildi. 
yigindancekme:    ;Degerleri yigindan cekip ortalamasinin hesaplandigi etikettir.
pop dx            ;Yiginin en ust degeri cekilerek DX'te tutulur.
inc bl            ;Ortalamayi hesaplarken,ortalamasi bulunacak sayilarin adetini tutar.
add al,dl         ;Her gelen sayi bir onceki toplam ile toplanir ve AL'de tutulur.
mov dh,al         ;AL'de tutulan sonuc,saklanmasi icin DH'a atanir.
div bl            ;Toplami,sayi adetine boler.8 bit oldugundan,AX'i boler.AH kalani,AL ise bolumu tutar.
mov [si],al       ;Hesaplanan ortalamayi SI'nin tuttugu adrese atar.
mov ah,0          ;AH yani bolme isleminden kalan sifirlanir.
mov al,dh         ;Sirasiyla eklenecek sayilarin,o sayidan onceki toplam degrere eklenmesi icin onceki toplam degeri saklanir.
add si,1          ;Adres degeri db oldugundan adres 1 artar.
loop yigindancekme;Dongu
mov si,1000h      ;SI yazmaci 1000h adresini tutar.
mov cx,10         ;Dongu degiskeni CX'te 10 degeri tutulur.
mov ax,0          ;AX sifirlanir.
yaz:              ;Bellekte saklanan ortalamalari yigina atan etiket.
mov al,[si]       ;SI'nin tuttugu adresteki degeri AL'ye atar.
push ax           ;AX'te tutulan ortalama degerini yigina atar.
add si,1          ;Adres degeri db oldugundan adres 1 artar.
loop yaz          ;Dongu

end               ;Programi sonlandirir.
ret




