; Operaciones aritmetica entre dos valores enteros
; creador @daniel-baf
; fecha 24/03/2023

%include        'utils/stdio.asm'

SECTION .data
    add_msg            db      'Suma de 90 + 9: ', 0H
    less_msg           db      'Resta de 99 - 81: ', 0H
    mult_msg           db      'Multiplicacion: ', 0H
    div_msg            db      'División: ', 0H

SECTION .text
    global      _start

_start:
        ; suma
    mov         eax, 9
    mov         ebx, 90
    call        sum

    ; resta
    mov         ebx, 81
    call        subst
    call        exit


; suma el valor de eax con ebx y devuelve el valor en eax
sum:
    push        eax             ; backup
    mov         eax, add_msg    ; mensaje
    call        print
    pop         eax
    add         eax, ebx
    call        iPrintLn
    ret


subst:
    push        eax             ; backup
    mov         eax, less_msg   ; mensaje
    call        print
    pop         eax
    sub         eax, ebx
    call        iPrintLn
    ret

mult:
    push        eax
    mov         eax, mult_msg
    call        print
    pop         eax
    mul         eax, ebx