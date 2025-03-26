/*
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323
    26/09/2023
     
    BINARY CLOCK, ON / OFF LEDS AND COUNT 
    0, 1, 10, 11, 100, 101, 110, 111...    
    This program is written for the PIC 18F4550 microcontroller.
    
*/
PROCESSOR 18F4550
#include  <xc.inc>
    // PILON CONFIG
    // directives that tell the compiler which processor is being used and which include file to include
    CONFIG  PBADEN =  OFF	        ; PORTB ANALOG DIGITAL ENABLE= OFF
    CONFIG  WDT    =  OFF	        ; Watch docg timer
    CONFIG  WDTPS  =  32768
    CONFIG  FOSC   =  HS	        ; 8Mhz PIC
    CONFIG  FCMEN  =  OFF
    CONFIG  IESO   =  OFF

psect vector_reset, global, reloc=2, class=CODE, delta=1 ; config

vector_reset:		; program recover
    org	    0x00	; vector RESET
    goto    start
    org	    0x20	; SP -> 32

psect start, global, reloc=2, class=CODE, delta=1   ; config

start:				; custom code init
    counter	set 0x60	; init counter
    counter2	set 0x61	; init counter2
    movlw       0xff		; w = 255	
    movwf       counter		; counter = w
    movlw       0xff		; w = 255	
    movwf       counter2	; counter = w
    setf        ADCON1		; ADCON1 = 1111 1111
    clrf        INTCON		; clear INTCON
    clrf        TRISD		; PORT B = IN/OUT
    clrf        PORTD
    
basc:
    incf        PORTD
await:				// await section
    decfsz      counter, 1	; init counter at 1
    goto        await		; wait on
    movlw       0xff		
    movwf       counter
    goto        await2		; wait off
    
await2:
    decfsz      counter, 1	; conditional decrement
    goto        await2		; forward loop
    movlw       0xff
    movwf       counter
    decfsz      counter2, 1
    goto        await
    movlw       0xff
    movwf       counter2
    goto        basc		; loop.exit()
    
    end	        vector_reset