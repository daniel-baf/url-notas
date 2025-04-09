PROCESSOR 18F4550
    
    #include <xc.inc>	// include normalito
    psect resetVec, global, reloc=2, class=CODE, delta=1 // configuracinoes

resetVec: // org sirve marcar una dirección en memoria
   org	0x00	    ; vector RESET
   goto	inicio	    ; JUMP de inicio
   org	0x20	    ; posición 32 de memoria
   
    psect inicio, global, reloc=2, class=CODE, delta=1 ; banderas necesarias para que el procedimiento funcione

inicio:
    contador	    set 0x60	    ; colocamos el contador en la posicion 60 de memoria
    contador2	    set 0x61
    ; un valor literal puede ser cargado en un registro especificandose como `k`
    ; W es equivalente al registro AX/eax, w sirve para hacer operaciones
    movlw	    0xff	    ; w =  255
    movwf	    contador	    ; contador = w
    
    movlw	    0xff	    ; w =  255
    movwf	    contador2	    ; contador = w
    ; no vamos a cofigurar las entradas analogicas porque no usaremos sus puetos, si usaramos
    ; los puertos B, si tendriamos que configurarlo como entrada analógica
    clrf	    TRISD	    ; TRISD = 00000000, configurado como salida
    // clrf	    PORTD	    ; PORTD = 00000000, valor inicial 0
    movlw	    0x01
    movwf	    PORTD
    
retardo:
    
	; queremos generar un loop dentro de otro loop
	decfsz	    contador, 1	    ; contador--
	goto	    retardo	    ; salto
	
	; reiniciamos el contador
	movlw	    0xff
	movwf	    contador
	
	decfsz	    contador2, 1    ; contador2--
	goto	    retardo
	
	; reiniciamos el contador
	movlw	    0xff
	movwf	    contador2
	rlncf	    PORTD, 1
;	rrcf	    PORTD, 1
	goto	    retardo
	end	    resetVec