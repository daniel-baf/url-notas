; Contador hasta 10 version 2
; Creador: jefe_mayoneso
; Fecha: 2023-03-17
; Programa que realiza impresion de valores del 0 al 9 en pantalla, implementando las funciones intToStr y strToInt

%include    'utils/stdio32.asm'
%include    'utils/stdin32.asm'
%include    'utils/text-utils.asm'

SECTION .data
    msg         db          '-> elemento 1 ', 0H

SECTION .bss
    input:      resb        255

SECTION .text
    global      _start


_start:
    mov         eax, 'a'
    mov         eax, 'b'
    call        printStrLn

;    call        printLoop
    call        endP


printLoop:
    mov         ecx, 0      ; ecx = 0
nextNum:
    mov         eax, ecx    ; eax = ecx (dir en memoria)
    add         eax, 48     ; eax = eax + 48 = chr(eax)
    
    push        eax         ; pila.push(eax)
    mov         eax, esp    ; eax = pila.last
    call        printStrLn

    pop         eax         ; sacamos el valor de la pila
    inc         ecx         ;
    cmp         ecx, 11     ; revisamos si vale 9
    jl          nextNum 

    ret
