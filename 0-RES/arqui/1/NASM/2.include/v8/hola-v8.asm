; Hola mundo con ingreso de datos por peteicion en paantalla o ingreso en teclado
; Creador: jefe_mayoneso
; fecha: 2023/03/15
; TAREA de arqui, funcines para solicitar datos e imprimir y convertir de mayusculas a minusculas y viceversa

%include 'stdio32.asm'
%include 'stdin32.asm'
%include 'text-utils.asm'

SECTION .data
    msg1    db      'PoR faVor, inGRese su nombre: ', 0H
    msg2    db      'Hola, ', 0H

; seccion para reservar entradas
SECTION .bss
        ; guardamos un espacio en memoria que vale 255 espacios en memoria
    nombre: resb    255     ; resb = reservar, reservabmos 255 bytes, tamaño maximo para cadenas
    input:  resb    255     ; resb = reservar, reservabmos 255 bytes, tamaño maximo para cadenas

SECTION .text
    global _start

_start:
    mov         eax, msg1
    call        printStr
    call        read
    call        toUpperCase
    call        printStr
    call        endP
;     mov     eax, msg1
;     call    printStr
;     ; interrupcion 80 para solicitar entrada de texto en linux es sys_read
;     mov     edx, 255        ; 255 no. bytes que queremos leer
;     mov     ecx, nombre     ; nombre de variable a leer
;     mov     ebx, 0          ; 0 = leer desde STDIN file
;     mov     eax, 3          ; invocamos a SYS_READ (Kernel opcode 3)
;     int     80h             ; ejecutamos 
; 
;     mov     eax, msg2       ; eax = por favor...
;     call    printStr        ; imprime
; 
;     ; backup
;     push    eax
;     mov     eax, nombre     ; 
;     call    toUpperCase     ; eax.toUppercase
;     call    printStr        ; 
;     mov     eax, nombre
;     call    toLowerCase
;     call    printStr        ; 
;     pop eax
;     call endP