section .data

section .text

; esta funcion se encarga de sumar dos digitos que sean numeros, no textos
; eax, ebx -> eax + ebx, estos valores, tanto de eax como ebx, deben estar guardados como decimal
; esta funcion convierte el decimal a codigo ascii
sum:
    add     eax, 48     ; movemos el valor para que el 0 valga 48
    add     eax, ebx
    ret