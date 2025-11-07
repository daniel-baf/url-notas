; creator: @daniel-baf
; date: 2023-3-22
; ejercicio, imprimir valores en pantalla un numero, no un string, sino su valor en int


; esapcio en m

%include 'utils/stdio.asm'
%include 'utils/text-utils.asm'

SECTION     .data
    msg         db          'imprimiendo valores', 0AH

SECTION     .text
    global      _start

_start:

    mov         eax, msg
    call        toUpperCase
    call        print

    mov         ecx, 0      ; contador

    loop_cont:
        mov         eax, ecx    ; puntero al valor
        call        iPrintLn    ; imprimimos en pantalla con salto de linea
        ; repetimos el loop
        inc         ecx         ; ecx++
        cmp         ecx, 15     ; 
        jl          loop_cont
    ; end loop_cont    

    call        exit        ; salmos de la aplicacion

