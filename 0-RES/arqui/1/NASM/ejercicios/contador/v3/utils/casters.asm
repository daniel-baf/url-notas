; #####################################################
; ############# CONVERSIONES DE VARIABLES #############
; #####################################################

; convierte el valor de un entero a un string

; funcion para convertir un string a numero
strToInteger:
    ; backup
    push        ebx
    push        ecx

    xor         ecx, ecx        ; los resultados se guardarian aqui, ecx = 0 
    mov         ebx, eax        ; eax = dir memoria de eax

    toIntegerLoop:
        mov         al, byte[ebx]           ; la cadena actual
        inc         ebx                     ; next char

        cmp         al, 0                   ; al = null -> fin de cadena
        jz          toIntegerLoopFinish     ; sale del loop

        imul        ecx, 10                 ; 10 = decimal
        sub         eax, 48                 ; ascii(0) = 48dec

        add         ecx, eax

        jmp         toIntegerLoop           ; regresamos al loop

        mov         eax, ecx                ; guardamos el valor en eax
    toIntegerLoopFinish:

    pop         ebx
    pop         ecx
    ret