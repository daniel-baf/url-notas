; Creator: @daniel-baf
; fecha: 2023-03-19
; this class we are supposed to cast a string to lower case or upper case
; also we want to create futures functions to concat 2 strings and cast a int to string and string to int

; cast the value on eax to uppercase
toUpperCase:
    push        eax                     ; backup of input
    push        ebx                     ; backup
    mov         ebx, eax                ; save on ebx the pointer to eax
    toUpperLoop:
        cmp         byte[ebx], 0            ; is null? the byte at ebx
        jz          toUpperLoopEnd          ; end of loop, jump to

        ; check if the actual byte correspond to a a-z char
        cmp         byte[ebx], 97           ; is byte lower than 'a'
        jl          toUpperLoopContinue     ; not a-z, do not change
        cmp         byte[ebx], 122          ; is byte higher than 'z'
        jg          toUpperLoopContinue     ; not a-z, do not change
        ; is into range [a,z]
        mov         al, [ebx]               ; uses al to acces byte[]
        sub         al, 32                  ; a-z -> A-Z ASCII
        mov         byte[ebx], al           ; update value at byte[ebx]
        
        toUpperLoopContinue:
        inc         ebx                     ; ebx ++
        jmp         toUpperLoop             ; continue loop
    
    toUpperLoopEnd:

    ; restore values
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