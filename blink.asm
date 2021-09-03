#include "p16F628a.inc" 
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
    
RES_VECT CODE 0x0000 
    GOTO START 
    
MAIN_PROG CODE
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33

START
    MOVLW 0x07 
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000000' 
    MOVWF TRISB
    BCF STATUS, RP0 
    NOP

inicio:
    bcf PORTB,0 
    call tiempo 
    nop 
    nop
    bsf PORTB,0 
    call tiempo 
    goto inicio 

tiempo: ; Calibrador para 3 microsegundos 
    nop
    nop		; NOTA: PARA 1 SEG QUITAR ESTE NOP, para 0.191099 seg esta bien
    movlw d'196' 
    movwf m
    
mloop:
    decfsz m,f
    goto mloop
    movlw d'100' 
    movwf i
    
iloop:
    nop 
    movlw d'20' 
    movwf j
    
jloop:
    nop 
    movlw d'30' 
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return 
    
    END
    ; 1seg: m 180 / i 90 / j 60 / k 60
    ; 0.191099 seg: m 196 + NOP / i 100 / j 20 / k 30