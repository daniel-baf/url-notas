
_configurar:

;hola_mundo_v2_tmr0.c,1 :: 		void configurar()
;hola_mundo_v2_tmr0.c,4 :: 		T0CON = 0x68;
	MOVLW       104
	MOVWF       T0CON+0 
;hola_mundo_v2_tmr0.c,5 :: 		TMR0L = 0xED;
	MOVLW       237
	MOVWF       TMR0L+0 
;hola_mundo_v2_tmr0.c,6 :: 		TMR0H = 0x00;
	CLRF        TMR0H+0 
;hola_mundo_v2_tmr0.c,9 :: 		ADCON1 = 0xFF;
	MOVLW       255
	MOVWF       ADCON1+0 
;hola_mundo_v2_tmr0.c,10 :: 		TRISA = 0x10; // encendido para que sea de entrada
	MOVLW       16
	MOVWF       TRISA+0 
;hola_mundo_v2_tmr0.c,11 :: 		PORTA = 0x00;
	CLRF        PORTA+0 
;hola_mundo_v2_tmr0.c,12 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;hola_mundo_v2_tmr0.c,13 :: 		PORTD = 0x00;
	CLRF        PORTD+0 
;hola_mundo_v2_tmr0.c,16 :: 		INTCON  = 0x84;
	MOVLW       132
	MOVWF       INTCON+0 
;hola_mundo_v2_tmr0.c,17 :: 		INTCON2 = 0x84;
	MOVLW       132
	MOVWF       INTCON2+0 
;hola_mundo_v2_tmr0.c,18 :: 		T0IE_bit = 1; // TIMER0 = 1
	BSF         T0IE_bit+0, BitPos(T0IE_bit+0) 
;hola_mundo_v2_tmr0.c,20 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_main:

;hola_mundo_v2_tmr0.c,22 :: 		void main()
;hola_mundo_v2_tmr0.c,24 :: 		int contador = 0;
;hola_mundo_v2_tmr0.c,26 :: 		configurar();
	CALL        _configurar+0, 0
;hola_mundo_v2_tmr0.c,28 :: 		while (1) // while true
L_main0:
;hola_mundo_v2_tmr0.c,30 :: 		PORTD ++; // esto para hacerlo contador
	MOVF        PORTD+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;hola_mundo_v2_tmr0.c,32 :: 		delay_ms(200);
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
;hola_mundo_v2_tmr0.c,33 :: 		}
	GOTO        L_main0
;hola_mundo_v2_tmr0.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
