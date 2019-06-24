
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

Org 100h
MOV AX,27d    ;AX registeri 27 decimal sayisini tutar.
ADD AX,15d    ;Program yalniz AX ve BX registeri kullanilarak yazilacagindan eklenecek decimal sayi, AX'in tuttugu sayinin uzerine eklenir.27d+15d=42d AX te tutulur cunku ADD komutunda sonuc,ilk operantta tutulur.
MOV BX,625d   ;BX registeri 625decimal sayisini tutar.
SUB BX,250d   ;BX'in tuttugu 625d sayisindan 250d sayisi cikarilir ve sonuc BX'te saklanir.
MUL BX        ;BX 16 bit olduðundan çarpma iþleminde gizli çarpan olarak AX iþleme katilir ve sonuc DX:AX e yazilir.DX:AX<-AX*BX.
ADD AX,191d   ;Iki parantezin carpim sonucunu tutan AX'e 191d sayisi eklenir ve genel sonuc AX'te saklanir.
RET   
;SONUC=3E45h




