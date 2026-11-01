VariableA -> 0xBEEF

ldr R0, =VariableA (Anw01) 
-> R0 ändert sich zu 0x2000000c. Der Befehl läd die Speicheradresse von VariableA in den Register R0

ldrb R2, = [R0] (Anw02)
-> R2 änderst sich zu 0xEF (0x000000EF)
ldrb - load register byte, läd also 1 Byte. das hintere Byte (EF) liegt zuerst im Speicher

ldrb R3, [R0, #1] (Anw03)
-> R3 ändert sich zu 0xBE. es wird ein Byte, was ein byte weiter im speicher liegt gelade

lsl R2, #8 (Anw04)
-> #8 bedeutet 8 Bytes. 
lsl - logical ahift left. Diie bits in R2 werden also nach 8 stellen links verschoben. aus R2=0xEF wird R2=0xEF00

orr R2, R3 (Anw05)
orr verbindet R2 und R3. R2 (0xEF00) + R3 (0xBE) = 0xEFBE

strh R2, [R0] (Anw09)
strh - Store Register Halfword. R2 (0xEFBE) wird zurück in die Adresse VariableA geschrieben.

Aufgabe 2. 0xAFFE erstellen 

const in var
    mov     R5, #0xFE  ; Anw07
    mov     R4, #0xAF       
    lsl     R4, #8
;* 
    orr     R5, R4   ; verbinde beide zu 0xAFFE
    strh    R5, [R0         ; Anw08

    am ende steht in R5 - 0xAFFE


    aufgabe 3. 0x1234 erstellen

     ; Change value of VariableB to 0x1234
    ldr     R6, =VariableB  ; Anw09
    ldrb    R7, [R6]        ; Anw0A
    ldrb    R1, [R6, #1]    ; Anw0B
    lsl     R1, #8          ;
    orr     R7, R1, R7      ;
    strh    R7,[R6]         ;    

    am ende steht in R7 0x1234