PROCESSOR 18F4550
#include <xc.inc>
    
    CONFIG  PBADEN = OFF
    CONFIG  WDT = OFF
    CONFIG  WDTPS = 32768
    CONFIG  FOSC = HS
    CONFIG  FCMEN = OFF
    CONFIG  IESO = OFF
psect resetVec, global, reloc=2, class=CODE, delta=1
    
resetVec:
    org	    0x00
    goto    inicio
psect hi_int_vec, global, reloc=2, class=CODE, delta=1
    org	    0x08
    goto    HighIsrHandler
    
psect inicio, global, reloc = 2, class = CODE, delta = 1 // siempre se pone esto
    org	    0x20
inicio:
    ;------------------Configuracion de registros
    ; Configuracion de TMR0
    movlw   0x68
    movwf   T0CON
    movlw   0xDB
    movwf   TMR0L
    movlw   0x00
    movwf   TMR0H
    ; configurar el puerto
    setf    ADCON1
    clrf    TRISD
    clrf    PORTD
    ; Configurar las interrupciones
    movlw   0xC0
    movwf   INTCON
    movlw   0x84
    movwf   INTCON2
    bsf	    INTCON, 5
    bsf	    T0CON, 7
; --------------Principal
ciclo:
    goto    ciclo
; --------Bloque de interrupcion
HighIsrHandler:
    bcf	    T0CON, 7
    bcf	    INTCON, 5
    bcf	    INTCON, 2
    btg	    PORTD, 0
    movlw   0x03
    movwf   T0CON
    movlw   0xDB
    movwf   TMR0L
    movlw   0x0B
    movwf   TMR0H
    movlw   0xC0
    movwf   INTCON
    movlw   0x84
    movwf   INTCON2
    bsf	    INTCON, 5
    bsf	    T0CON, 7
    retfie  1
    end	    resetVec