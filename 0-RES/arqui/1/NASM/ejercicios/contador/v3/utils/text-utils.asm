; Funciones toUpperCase y toLowerCase
; creadro jefe_mayoneso
; fecha 16-03-2023
; implementacion de funciones que conviertan el texto de mayuscula a minuscula y vice versa

; funcion para convertir un numero a string
%include        'utils/casters.asm'

SECTION .data

SECTION .text

; ; concatena los valore que se manden en los parametros eax y edx
; ; estos parametros deben ser strings, o cadenas y cada cadena debe terminar en 0H
; concat:
;     ; copiamos la primera cadena al buffer
;     mov         esi, eax            ; puntero a primera cadena
;     mov         edi, buffer         ; puntero a buffer
;     mov         ecx, 0              ; contador
; 
;     concatLoop:
;         mov         al, byte[esi]       ; carga el primer caracter
;         mov         byte[edi], al       ; almacena el byte en el buffer
;         ; incrementa los valores
;         inc         esi                 ; incrementa el puntero de la cadena
;         inc         edi                 ; incrementa el puntero del buffer
;         inc         ecx                 ; incrementa el contador
; 
;         cmp         byte[esi], 0        ; comparamos hasta que lea null, o sea la cadena se acaba
;         jl          concatLoop
; 
;     mov         eax, ecx                ; almacena la longitud de la primera cadena en ecx
;     add         edi, eax                ; sumamos la longitud de la primera cadena
; 
;     ; copiamos la segunda cadena
;     mov         esi, edx            ; puntero a primera cadena
;     mov         ecx, 0              ; contador
; 
;     concatLoop2:
;         mov         al, byte[esi]       ; carga el primer caracter
;         mov         byte[edi], al       ; almacena el byte en el buffer
;         ; incrementa los valores
;         inc         esi                 ; incrementa el puntero de la cadena
;         inc         edi                 ; incrementa el puntero del buffer
;         inc         ecx                 ; incrementa el contador
; 
;         cmp         byte[esi], 0        ; comparamos hasta que lea null, o sea la cadena se acaba
;         jl          concatLoop2
;     
;     ; agregamos el valor null al final de la cadena
;     mov         byte[edi], 0H       ; agregamos el caracter null
;     mov         eax, buffer         ; guardamos en eax el buffer
;     ret

; #####################################################
; ############## TRANSFORMACION DE TEXTO ##############
; #####################################################

; convierte el valor de la cadena que venta en eax a mayuscula
toUpperCase:
    push        eax
    push        ebx
    mov         ebx, eax                ; copy
    toUpperLoop:
        cmp         byte[ebx], 0            ; is null?
        jz          toUpperLoopEnd

        ; SECCION DE CODIGO QUE VERIFICA QUE ESTE EN LOS PARAMETROS INDICADOS
        cmp         byte[ebx], 97           ; es menor que 'a'?
        jl          toUpperLoopContinue
        cmp         byte[ebx], 122          ; es mayor que 'z'?
        jg          toUpperLoopContinue
        
        ; esta en el rango [a,z]
        mov         al, [ebx]
        sub         al, 32
        mov         byte[ebx], al
        
        toUpperLoopContinue:
        inc         ebx                     ; ebx ++
        jmp         toUpperLoop
    
    toUpperLoopEnd:
    pop ebx
    pop eax
    
    ret

; convierte el valor de la cadena que venta en eax a minuscula
toLowerCase:
    push        eax
    push        ebx
    mov         ebx, eax                ; copy

    toLowerLoop:
        cmp         byte[ebx], 0            ; is null?
        jz          toLowerLoopEnd
    
        ; SECCION de codigo que verifica que este en los parametros [A,Z]
        cmp         byte[ebx], 65           ; es menor que 'A'?
        jl          toLowerLoopContinue
        cmp         byte[ebx], 90          ; es mayor que 'Z'?
        jg          toLowerLoopContinue
    
        ; esta en el rango [A,Z]
        mov         al, [ebx]
        add         al, 32
        mov         byte[ebx], al
    
        toLowerLoopContinue:
        inc         ebx                     ; ebx ++
        jmp         toLowerLoop

    toLowerLoopEnd:
    pop ebx
    pop eax
    
    ret