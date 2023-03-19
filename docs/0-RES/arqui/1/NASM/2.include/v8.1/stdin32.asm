; implementacion de una funcion que solicite un dato e imprima sus valores
; creadro jefe_mayoneso
; fecha 16-03-2023
; implementación de funciones que soliciten atributos e imprima un mensaje

; funcion que solicite datos

read:
    push        edx
    push        ecx
    push        ebx

    ; Lee la entrada del usuario
    ; https://faculty.nps.edu/cseagle/assembly/sys_call.html
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 255
    int 0x80

    ; Busca el salto de línea en el buffer
    mov edi, ecx        ; edi = dirección del buffer
    mov ecx, eax        ; ecx = número de caracteres leídos
    xor eax, eax        ; eax = contador de caracteres
    cld                 ; Dirección ascendente para repne scasb
    repne scasb         ; Busca el salto de línea
    je reemplzar_salto  ; Si se encontró el salto de línea, reemplaza con null byte
    ; Si no se encuentra el salto de línea, agrega un valor nulo al final de la entrada del usuario
    mov byte [edi + ecx], 0
reemplzar_salto:
    ; Reemplaza el salto de línea con null byte
    mov byte [edi + eax - 1], 0


    ; retornamos los vlores originales
    pop         ebx
    pop         ecx
    pop         edx
    mov         eax, buffer

    ret

