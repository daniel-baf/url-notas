cpu         x86-64

%include    'utils/stdio.asm'
%include    'calc/calc.asm'
%include    'utils/text-utils.asm'

section .data
    msg     db          "Ingresa un numero: ", 0H

SECTION .bss

section .text

    global _start

_start:

    call        ask
    push        eax
    call        ask
    push        eax

    pop         edx
    mov         eax, edx
    call        printLn
    pop         edx
    mov         eax, edx
    call        printLn

    call        exit
    push    eax

ask:
    mov     eax, msg        ; eax = msg
    call    toUpperCase
    call    print           ; imprime msg
    call    readline        ; lee valor <- eax
    call    printLn
    ret