PROCESSOR 18F4550
#include <xc.inc>
    CONFIG PRADEN = OFF
    CONFIG WDF    = OFF
    CONFIG WDTPS  = 32768
    cONFIG FOSC   = HS
    CONFIG FCMEN  = OFF
    
    psect resetVec, global, reloc=2, class=CODE, delta=1
    
    resetVec:
	org	0x00	    ; vector RESET
	goto	inicio
	
    psect h1_int_vec, global, reloc=2, class=CODE, delta=1
 
	org	0x00
	goto	highISRHandler
	org	0x20	    ; posicion en memoria 20 del programa
	
	
    inicio:
	; configuracion del registro
	; configuracin de TMR0
	movlw	0x
	movwf	T0CON
	movwf	0xDB
	movwf	TMR0L
	movlw	0x0B
	movwf	TMR0H
	; configurar el puerto
	setf	ADCON1
	clrf	TRISD
	clrf	PORTD
	; configurar las interrupciones
	movlw	0xC0
	movwf	INTCON
	movlw	0x04
	movwf	INTCON2
	; encender bit
	bsf	INTCON, 5
	bsf	T0CON, 7
	
	; //////// programa principal

	ciclo:
	    goto    ciclo
	    
	; bloque des desbordamiento
	highISRHandler:
	    bcf	    T0CON, 7
	    bcf	    INTCON, 5
	    bcf	    INTCON, 2	; apagamos el bit 2
	    
	    ; cambiar de estado de bit
	    btg	    PORTD, 0
	    
	    ; reconfigurar todo
	    ; configuracion del registro
	    ; configuracin de TMR0
	    movlw	0x
	    movwf	T0CON
	    movwf	0xDB
	    movwf	TMR0L
	    movlw	0x0B
	    movwf	TMR0H
	    ; configurar el puerto
	    setf	ADCON1
	    clrf	TRISD
	    clrf	PORTD
	    ; configurar las interrupciones
	    movlw	0xC0
	    movwf	INTCON
	    movlw	0x04
	    movwf	INTCON2
	    ; encender bit
	    bsf	INTCON, 5
	    bsf	T0CON, 7
	    
	    ret		resetVec