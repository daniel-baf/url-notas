PROCESSOR 18F4550
    #include <xc.inc>
    
    // declaracion de la funcion resetVec
    // psect fun_name, type, bandera para que funcione (revisar manual), clase (revisar manual), delta (revisar manual) 
    psect resetVec, global, reloc=2, class=CODE, delta=1
    resetVec:
	org	0x00	    // org sirve para mover el puntero del programa
	goto	inicio
	
	org	0x20	    // 0x20 porque se salta el espacio que ocupan las instrucciones integradas
	
    psect inicio, global, reloc=2, class=CODE, delta=1
    inicio:
	// Conffiguracion de puerto B para funcioanmiento digital
	setf	ADCON1	    // TRISD = 00000000 -> Conf. salida
	bsf	TRISB, 0    // TRISB[0] = 1
	clrf	PORTB
	    
	// configuracion e inicializacon de puerto
	clrf	TRISD	    //TRISD = 0000000 -> conf. salida
	clrf	PORTD	    // PORTD = 00000000, valor inicial 0
	
    ciclo:
	rrncf	PORTB, 0
	movwf	PORTD
    
;	movff	PORTB, PORTD
	goto	ciclo
	
	end	resetVec