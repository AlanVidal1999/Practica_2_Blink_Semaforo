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
    MOVLW b'00100001'
    MOVWF PORTB
    call tiempo5 
    MOVLW b'00100010'
    MOVWF PORTB
    call tiempo1
    MOVLW b'00001100'
    MOVWF PORTB
    nop
    nop
    call tiempo5
    MOVLW b'00010100'
    MOVWF PORTB
    call tiempo1
    goto inicio

tiempo5: ; 5 segundos
    movlw d'239' ; Calibrador para 3 microsegundos 
    movwf m
    
mloop5:
    decfsz m,f
    goto mloop5
    movlw d'255' 
    movwf i
iloop5:
    nop 
    movlw d'140' 
    movwf j
jloop5:
    nop 
    movlw d'45' 
    movwf k
kloop5:
    decfsz k,f
    goto kloop5
    decfsz j,f
    goto jloop5
    decfsz i,f
    goto iloop5
    return 
 
    
    
tiempo1: ; 1 segundo
    movlw d'210' ; Calibrador para 3 microsegundos 
    movwf m
    
mloop1:
    decfsz m,f
    goto mloop1
    movlw d'90' 
    movwf i
    
iloop1: 
    movlw d'60' 
    movwf j
    
jloop1:
    nop 
    movlw d'60' 
    movwf k
kloop1:
    decfsz k,f
    goto kloop1
    decfsz j,f
    goto jloop1
    decfsz i,f
    goto iloop1
    return 

    END
   
