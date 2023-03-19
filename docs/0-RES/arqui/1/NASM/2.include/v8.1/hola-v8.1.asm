; Hola mundo con ingreso de datos por peteicion en paantalla o ingreso en teclado
; Creador: jefe_mayoneso
; fecha: 2023/03/15
; TAREA de arqui, funcines para solicitar datos e imprimir y convertir de mayusculas a minusculas y viceversa

%include 'stdio32.asm'
%include 'stdin32.asm'
%include 'text-utils.asm'

SECTION .data
    msg1    db      'Ingresa tu nombre: ', 0H
    msg2    db      'INgreSA tu apellido: ', 0H
    msg3    db      'Ingresa tu pais: ', 0H
    msg4    db      'Hola, ', 0H
    msg5    db      ' vives en ', 0H

; seccion para reservar entradas
SECTION .bss
    ; guardamos un espacio en memoria que vale 255 espacios en memoria
    buffer:  resb    255   
    ; resb = reservar, reservabmos 255 bytes, tamaño maximo para cadenas + 1 byte nulo
    len      equ     $-buffer

SECTION .text
    global _start

_start:
    call        reqData
    call        endP


reqData:
    ; solicitamos el nombre
    mov         eax, msg1       ; nombre?
    call        toLowerCase
    call        printStr
    call        read            ; <- nombre
    push        eax
    call        printStrLn

    mov         eax, msg2       ; apellido?
    call        toLowerCase
    call        printStr
    call        read            ; <- apellido
    push        eax
    call        printStrLn

    mov         eax, msg3       ; pais?
    call        toLowerCase
    call        printStr
    call        read            ; <- pais
    push        eax
    call        printStrLn

    ; recuperamos los datos e imprimimos
    ; pila -> ESP -> | dir | apellido | nombre |
    pop         ecx             ; dir
    pop         ebx             ; apellido

    mov         eax, msg4       ; -> hola, 
    call        printStr
    pop         eax
    call        printStr        ; -> nombre |  hola, {nombre}

    mov         eax, ' '
    push        eax
    mov         eax, esp
    call        printStr
    pop         eax
    mov         eax, ebx        ; -> {APELLIDO} | hola, {nombre} {apellido}
    call        printStr

    mov         eax, msg5       ; -> en |  hola, {nombre} {apellido}\n vives en
    call        printStr
    mov         eax, ecx        ; ecx = direccion
    call        printStrLn      ; -> {dir} |  hola, {nombre} {apellido} vives en {dir}
    ret
