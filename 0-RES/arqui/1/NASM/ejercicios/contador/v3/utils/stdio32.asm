; IMPLEMENTACION de una clase que nos sirva para leer datos de consola e imprimir datos en consol
; creadro jefe_mayoneso
; fecha 19-03-2023
; esta clase se encarga de leer datos del teclado y devolverlo en eax y tambien imprime el valor de
; lo que este guardado en la direccion de memoria eax

%include    'utils/text-utils.asm'

SECTION .data

SECTION .text
; funcion que solicite datos
read:
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


; ; ------------------ IMPRESION  ------------------ ;
; imprime una cadena de texto con salto de linea
printStrLn:
    push        eax
    call        printStr    ; imprime el texto
    push        eax         ;
    mov         eax, 0AH    ;
    push        eax         ; 
    mov         eax, esp    ; asigna a eax la direccion ESP stack pointer
    call        printStr    ; imprime el salto de linea
    pop         eax
    pop         eax
    ; palabra original
    pop         eax
    ret


; ------------------ IMPRESION EN PANTALLA ------------------ ;
; void printStr(eax = cadena)
printStr:
    push        eax
    ; guardamos todos los datos para recuperarlos luego
    push        edx
    push        ecx
    push        ebx
    push        eax
    call        strLen ; calculamos la longitud (se guarda longitud en eax)

    mov         edx, eax    ; edx = lo que retorna strLen
    pop         eax         ; eax = primer registro de la pila
    mov         ecx, eax    ; movemos el valor a ecx
    mov         ebx, 1      ; salida 1 = pantalla
    mov         eax, 4      ; SYS_WRITE
    int         80h         ;

    ; restauramos los valores del programa
    pop         ebx
    pop         ecx
    pop         edx
    pop         eax
    ret

; ------------------ FIN DEL PROGRAMA ------------------ ;
exit: ; C = void endP()
    mov         ebx, 0      ; return 0
    mov         eax, 1      ; llama a SYS_EXIT (kernel.opcode 1)
    int 80h             ; llamada de interrupscion de kernel