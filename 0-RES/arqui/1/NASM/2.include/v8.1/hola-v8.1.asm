; Hola mundo con ingreso de datos por peteicion en paantalla o ingreso en teclado
; Creadlineor: jefe_mayoneso
; fecha: 2023/03/15
; TAREA de arqui, funcines para solicitar datos e imprimir y convertir de mayusculas a minusculas y viceversa

%include 'stdio.asm'
%include 'text-utils.asm'

SECTION .data
    msg1    db      'Ingresa tu nombre: ', 0H
    msg2    db      'INgreSA tu apellido: ', 0H
    msg3    db      'Ingresa tu pais: ', 0H
    msg4    db      'Hola, ', 0H
    msg5    db      ' vives en ', 0H

; seccion para reservar entradas
SECTION .bss

SECTION .text
    global _start

_start:
    call        reqData
    call        exit


reqData:
    ; solicitamos el nombre
    mov         eax, msg1           ; nombre?
    call        toLowerCase
    call        print
    call        readline            ; <- nombre
    call        printLn
    push        eax

    ; recomponemos
    mov         eax, msg2           ; apellido?
    call        toLowerCase
    call        print
    call        readline            ; <- apellido
    call        printLn
    push        eax

    mov         eax, msg3           ; pais?
    call        toLowerCase
    call        print
    call        readline
    call        printLn
    push        eax

    ; recuperamos los datos e imprimimos
    ; pila -> ESP -> | dir | apellido | nombre |
    ; en este punto esp -> nombre
    pop         edx                 ; pais
    pop         ecx                 ; apellido  
    pop         ebx                 ; nombre


    mov         eax, msg4       ; -> hola, 
    call        print
    mov         eax, ebx
    call        print           ; -> nombre |  hola, {nombre}

    mov         eax, ' '
    push        eax
    mov         eax, esp
    call        print
    pop         eax
    mov         eax, ecx
    call        print           ; -> {APELLIDO} | hola, {nombre} {apellido}

    mov         eax, msg5       ; -> en |  hola, {nombre} {apellido}\n vives en
    call        print
    mov         eax, edx
    call        printLn      ; -> {dir} |  hola, {nombre} {apellido} vives en {dir}
    ret
