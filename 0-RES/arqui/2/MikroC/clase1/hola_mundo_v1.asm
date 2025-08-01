
_configurar:

;hola_mundo_v1.c,1 :: 		void configurar()
;hola_mundo_v1.c,4 :: 		TRISD = 0;
	CLRF        TRISD+0 
;hola_mundo_v1.c,5 :: 		PORTD = 0;
	CLRF        PORTD+0 
;hola_mundo_v1.c,6 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_main:

;hola_mundo_v1.c,8 :: 		void main()
;hola_mundo_v1.c,10 :: 		int contador = 0;
;hola_mundo_v1.c,12 :: 		configurar();
	CALL        _configurar+0, 0
;hola_mundo_v1.c,14 :: 		while (1) // while true
L_main0:
;hola_mundo_v1.c,16 :: 		PORTD ++; // esto para hacerlo contador
	MOVF        PORTD+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;hola_mundo_v1.c,18 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;hola_mundo_v1.c,19 :: 		}
	GOTO        L_main0
;hola_mundo_v1.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
