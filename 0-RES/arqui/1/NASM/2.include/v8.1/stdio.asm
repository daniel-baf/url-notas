; Creador: @daniel_baf
; fecha: 2023-03-19
; Clase que se encarga de gestionar salidas y entradas en consola

section .data

section .bss
    buffer:         resb        255

section .text

; ####################################################
; ################### LEER DE CONSOLA ################
; ####################################################

; lee todo lo que sea ingresado en una linea, hasta detectar un salto de linea
; maximo buffer de 254 + 1 nulo
readline:
    ; hacemos una copia de seguridad
    push        edx
    push        ecx
    push        ebx

    ; Lee la entrada del usuario
    ; https://faculty.nps.edu/cseagle/assembly/sys_call.html
    mov         eax, 3          ; eax = no. de instruccion
    mov         ebx, 0          ; ebx = unsigned int
    mov         ecx, buffer     ; ecx = el buffer
    mov         edx, 255        ; edx = tamaño del buffer
    int         80H             ; llamada al sistema

    ; Busca el salto de línea en el buffer
    push        edi
    mov         edi, ecx        ; edi = dirección del buffer
    mov         ecx, eax        ; ecx = número de caracteres leídos
    xor         eax, eax        ; eax = contador de caracteres
    cld                         ; Dirección ascendente para repne scasb
    repne       scasb           ; Busca el salto de línea
    je          reemplzar_salto  ; Si se encontró el salto de línea, reemplaza con null byte
    ; Si no se encuentra el salto de línea, agrega un valor nulo al final de la entrada del usuario
    mov         byte [edi + ecx], 0H

    reemplzar_salto:
        mov         byte [edi + eax - 1], 0H     ; Reemplaza el salto de línea con null byte

    ; retornamos los vlores originales
    pop         edi
    pop         ebx
    pop         ecx
    pop         edx

    mov         eax, buffer

    ret

; #########################################################
; ################### IMPRIMIR EN PANTALLA ################
; #########################################################

printLn:
    call        print       ; imprime la cadena
    push        eax
    mov         eax, 0AH    ; salto de cadena
    push        eax         ; lo guardamos en la pila
    mov         eax, esp    ; eax -> dir en memoria de la pila que ahora contiene "\n"
    call        print
    pop         eax         ; sacamos el salto de linea
    pop         eax         ; recuperamos el valor original
    ret

print:
    ; guardamos los datos por si se necesitan
    push        ebx
    push        ecx
    push        edx
    push        eax         ; de ultimo el texto, pues lo recuperaremos

    push        eax         ; strLen sobreescribe eax
    call        strLen      ; <- leng = eax

    mov         edx, eax    ; edx = lo que retorna strLen
    pop         eax         ; eax = primer registro de la pila
    mov         ecx, eax    ; movemos el valor a ecx
    mov         ebx, 1      ; salida 1 = pantalla
    mov         eax, 4      ; SYS_WRITE
    int         80h         ;

    ; restauramos los datos
    pop         eax
    pop         edx
    pop         ecx
    pop         ebx
    ret                 ; retorno a funcion original

; ------------------ CALCULO DE LONGITUD DE CADENA ------------------ ;
; strLen(eax=<CADENA>) -> eax int n = <LONGITUD>
strLen:
    push        ebx            ; GUARDAMOS EL DATO EN LA PILA PARA LUEGO RECUPERARLO
    mov         ebx, eax       ; eax = ebx | ebx = direccion de memroia de msg

    sigCharLen: ; yo decidi ponerle el nombre sigCharLen, puede tener cualquier nombre
        cmp         byte[eax], 0    ; seria como decir en C msg[eax] == 0?
        jz          finLen          ; GOTO finLen si se cumple la condicion de arriba
        inc         eax             ; increamenta eax si no ha terminado la cadena
        jmp         sigCharLen      ; salta a la etiqueta siguiente

    finLen:
        sub         eax, ebx        ; longitud de la cadena
        pop         ebx             ; obtemos lo que sea que hay en la ultima posicion de pila
    ret             ; implementa un return porque es una funcion

; #########################################################
; ################### TERMINAR PROGRAMA ###################
; #########################################################

exit:
    mov         ebx, 0      ; RETURN 0
    mov         eax, 1      ; SYS_EXIT
    int         80h         ; llamada a kernel