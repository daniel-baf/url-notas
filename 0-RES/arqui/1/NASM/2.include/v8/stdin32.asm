; implementacion de una funcion que solicite un dato e imprima sus valores
; creadro jefe_mayoneso
; fecha 16-03-2023
; implementación de funciones que soliciten atributos e imprima un mensaje

; funcion que solicite datos
read:
    push        edx
    push        ecx
    push        ebx

    mov     edx, 255        ; 255 no. bytes que queremos leer
    mov     ecx, input      ; nombre de variable a leer
    mov     ebx, 0          ; 0 = leer desde STDIN file
    mov     eax, 3          ; invocamos a SYS_READ (Kernel opcode 3)
    int     80h             ; ejecutamos 

    ; retornamos los vlores originales
    pop         ebx
    pop         ecx
    pop         edx
    mov         eax, input
    ret
