
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

MOV AX,0AAAh    ;AX'e AAAh degeri atandi.
MOV CX,000Ah    ;CX'e Ah degeri atandi.
DIV CX          ;AAA sayisi,A sayisina bolundu ve sonuc AX'te tutuldu.
JPE ciftparity  ;Eger sonuctaki 1 dijitlerinin sayisi cift ise(ciftparity ozelligi) PF=1 olur
                ;ve ciftparity etiketine gidilir.

MOV DX,0CCCh    ;Ilk islem sonucu ciftparity degilse program burdan devam eder.
                ;ve DX registerina CCCh degerini atar.
ADD AX,DX       ;AX'te tutulan sonucla DX'teki degeri toplar ve sonuc AX'te saklanir.
JPE ciftparity2 ;AX'te tutulan toplam sonucu ciftparity ise ciftparity2 etiketine git.
JMP son         ;AX'te tutulan toplam sonucu ciftparity degilse son etiketine git.

ciftparity2:    ;Etiket
MOV BX,200h     ;DS'ye direkt deger atanamadigi icin,0200h adres baslangici BX'e atanir.
MOV DS,BX       ;BX'teki deger DS'ye atanir.
MOV SI,0400h    ;SI kaynak index yazmacina 0400h adres degeri atanir.
MOV [SI],AX     ;SI'nin tuttugu adrese AX'teki deger atanir.
JMP son         ;son etiketine git.

ciftparity:      ;Etiket.
MOV BX,200h      ;DS'de tutulmasi icin,0200h adres baslangici BX'e atanir.
MOV DS,BX        ;BX'teki deger DS'ye atanir.
MOV SI,0300h     ;SI kaynak index yazmacina 0300h adres degeri atanir.
MOV [SI],000Bh   ;SI'nin tuttugu adrese Bh degeri atanir.
JMP son          ;Islem bitince son etiketine git.

son:             ;Etiket
end              ;Programi sonlandirir.
ret
