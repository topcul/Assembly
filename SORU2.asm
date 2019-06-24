
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



Org 100h
MOV AX,0FFFFh    ;AX'e FFFFh degeri atanir.
MOV BX,0AFFFh    ;BX'e AFFFh degeri atanir.
MUL BX           ;BX 16 bit oldugundan gizli carpan AX'tir.AX ile BX carpilir ve sonucç DX:AX'e yazilir.
MOV AL,DH        ;En onemli 2 biti yani,DH da bulunan degeri 12h a bolmek istedigimizde bolenin AX te olmasi gerekir cunku bolen register DL (8 bit),bolunen olarak AX i alacaktir.Bolumu AL'ye,kalani ise AH'a atayacaktir.
MOV AH,0         ;AH sifirlanir.
MOV DL,12h       ;Bolecek olan sayi 12h,DL'ye atanir.
DIV DL           ;AX'i DL'ye boler.AL bolumu,AH kalani tutar.
SUB AH,AL        ;Kalandan Bolum çcikarilir ve AH'ta tutulur.
ADD AH,27h       ;Sonuca 27h eklenir ve sonuc AH'ta tutulur.
MOV [0300h],AH   ;Toplamin 0700:0300h adresinde tutulmasi istendiginden sonuc 0300h adresine atanir.
RET              ;Isletim sistemine geri donulur.
        
;SONUC=2B
                    

