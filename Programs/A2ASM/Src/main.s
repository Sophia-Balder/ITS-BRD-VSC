;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

ConstByteA  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01
    ldrb    R2,[R0]         ; Anw02
    ldrb    R3,[R0,#1]      ; Anw03
    lsl     R2, #8          ; Anw04
    orr     R2, R3          ; Anw05
    strh    R2,[R0]         ; Anw06 
    
;* const in var
    mov     R5, #0xFE  ; Anw07
    mov     R4, #0xAF       
    lsl     R4, #8
;* 
    orr     R5, R4   ; verbinde beide zu 0xAFFE
   ; Change value of VariableB to 0x1234
    ldr     R6, =VariableB  ; Anw09
    ldrb    R7, [R6]        ; Anw0A
    ldrb    R1, [R6, #1]    ; Anw0B
    lsl     R1, #8          ;
    orr     R7, R1, R7      ;
    strh    R7,[R6]         ;        


    b .                     ; Anw0E
    
    ALIGN
    END
