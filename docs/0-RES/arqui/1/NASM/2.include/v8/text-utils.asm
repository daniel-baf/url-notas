; Funciones toUpperCase y toLowerCase
; creadro jefe_mayoneso
; fecha 16-03-2023
; implementacion de funciones que conviertan el texto de mayuscula a minuscula y vice versa

; convierte el valor de la cadena que venta en eax a mayuscula
toUpperCase:
    push        eax
    push        ebx
    mov         ebx, eax                ; copy

start_for:
    cmp         byte[ebx], 0            ; is null?
    jz          end_for
check_is_lower:
    cmp         byte[ebx], 97           ; es menor que 'a'?
    jl          continue_for
    cmp         byte[ebx], 122          ; es mayor que 'z'?
    jg          continue_for
    ; esta en el rango [a,z]
    mov         al, [ebx]
    sub         al, 32
    mov         byte[ebx], al
continue_for:
    inc         ebx                     ; ebx ++
    jmp         start_for
end_for:
    pop ebx
    pop eax
    ret

; convierte el valor de la cadena que venta en eax a minuscula
; toUpperCase:
;     push        eax
;     push        ebx
;     mov         ebx, eax                ; copy
; 
; start_for:
;     cmp         byte[ebx], 0            ; is null?
;     jz          end_for
; check_is_lower:
;     cmp         byte[ebx], 97           ; es menor que 'a'?
;     jl          continue_for
;     cmp         byte[ebx], 122          ; es mayor que 'z'?
;     jg          continue_for
;     ; esta en el rango [a,z]
;     mov         al, [ebx]
;     sub         al, 32
;     mov         byte[ebx], al
; continue_for:
;     inc         ebx                     ; ebx ++
;     jmp         start_for
; end_for:
;     pop ebx
;     pop eax
;     ret

