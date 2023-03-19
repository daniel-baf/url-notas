%include    'stdio.asm'

section .data
    msg        db      '->', 0H
    msg2        db      '<-', 0H

section .text
    global _start

_start:

    mov     eax, msg
    call    print
    call    readline
    ; guardamos el valor en la pila
    call    printLn
    push    dword [eax]         ; puntero al valor

    mov     eax, msg
    call    print
    call    readline
    call    printLn
    ; guardamos el valor en la pila
    push    dword [eax]         ; puntero al valor

    ; imprimimos
    mov     eax, msg2
    call    print
    mov     eax, esp
    call    printLn
    pop     eax

    ; imprimimos
    mov     eax, msg2
    call    print
    mov     eax, esp
    call    printLn

    ; salimos 
    mov     eax, 1
    int     80h