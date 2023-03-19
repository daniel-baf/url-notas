; creador: @daniel-baf
; fecha: 2023-03-19
; esta clase se encarga de transformar textos entre minusculas y mayusculas

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