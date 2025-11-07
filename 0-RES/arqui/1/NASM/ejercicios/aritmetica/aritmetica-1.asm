; Operaciones aritmetica entre dos valores enteros
; creador @daniel-baf
; fecha 24/03/2023

%include        'utils/stdio.asm'

SECTION .data
    add_msg            db      'Suma de 90 + 9: ', 0H
    less_msg           db      'Resta de 99 - 81: ', 0H
    mult_msg           db      'Multiplicacion 18 * 4: ', 0H
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

    call        mult

    call        exit


; suma el valor de eax con ebx y devuelve el valor en eax
sum:
    push        eax             ; backup
    mov         eax, add_msg    ; mensaje
    call        print           ; imprime el mensaje
    pop         eax             ; recupera el dato numerico
    add         eax, ebx        ; eax = eax + ebx
    call        iPrintLn        ; imprime eax
    ret                         ; retorna


subst:
    push        eax             ; backup
    mov         eax, less_msg   ; mensaje
    call        print           ; imprime el mensaje
    pop         eax             ; recupera eax
    sub         eax, ebx        ; eax = eax - ebx
    call        iPrintLn        ; imprime el valor de eax
    ret                         ; retorna

mult:
	push	    eax
    push        eax             ; backup
    mov         eax, mult_msg   ; eax = mensaje
    call        print           ; imprime el mensaje; 

    pop         eax             ; recupera eax
    mov         ebx, 4          ; multiplica eax por ebx
    mul         eax
    call        print
    ret