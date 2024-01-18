# Ejercicio 1

ARCHIVO: EJER21

Un año bisiesto es aquel año que es divisible entre 4, pero no divisible entre 100, a menos que sea divisible entre 400. Programa guardar en `resul` 1 si es bisiesto, 0 si no es bisiesto.

Usar valores para las pruebas: 
- 2023d = 0
- 2024d = 1
- 1800d = 0 
- 2000d = 1

```asm
; BISIESTO AKA EJER21
; Inicia el progrma como resul en 0, si no cae en la condicional, nunca cambia el valor
; ax = year
; ax mod 4 = 0? -> true
; ax mod 100 not 0 ? -> true
; ax mod 400 = 0 ? -> true
; Daniel Eduardo Bautista Fuentes 2121323
;
;
;******************** CÓDIGO DE INICIO ********************
    ideal
    dosseg
    model small
    stack 256
;***************** VARIABLES DEL PROGRAMA *****************
dataseg
    year        dw      ?     ; Muestras valores de DOUBLE WORD
    resul       dw      0
;******************* CÓDIGO DEL PROGRAMA *******************
codeseg
inicio:
    mov     ax, @data       ; Initialize DS
    mov     ds, ax
  
    mov     ax, [year]      ; Load the year into AX (16-bit)
  
    ; Check if the year is divisible by 4
    mov     bx, 4
    xor     dx, dx
    div     bx
    cmp     dx, 0           ; Check if the remainder is 0
    jnz     exit            ; If there's a remainder, it's not a leap year
  
    ; Check if the year is divisible by 100
    mov     ax, [year]      ; Load the year into AX (16-bit)
    mov     bx, 100
    xor     dx, dx
    div     bx
    cmp     dx, 0           ; Check if the remainder is 0
    jnz     is_leap_year    ; If there's a remainder, it could be a leap year
  
    ; Check if the year is divisible by 400
    mov     ax, [year]      ; Load the year into AX (16-bit)
    mov     bx, 400
    xor     dx, dx
    div     bx
    cmp     dx, 0           ; Check if the remainder is 0
    jnz     exit            ; If there's a remainder, it's not a leap year
  
is_leap_year:
    mov     [resul], 1       ; Set resul to 1 (leap year)
  
exit:
    mov     ah, 4Ch
    int     21h
;******************* CÓDIGO DE TERMINACIÓN ******************
    end     inicio
```

# Ejercicio 2

ARCHIVO: EJER22

Un programa que divida una variable de tipo palabra doble entre una variable tipo palabra. Utilice el algoritmo de restas repetidas. El dividendo estará en la variable `dividendo` y el divisor en la variable `divisor`, el cociente y el residuo en las variables de tipo palabra cociente y residuo. 

```
75/7

->
75 - 7 = 68  | 1
68 - 7 = 61  | 2
61 - 7 = 54  | 3
54 - 7 = 47  | 4
47 - 7 = 40  | 5
40 - 7 = 33  | 6
33 - 7 = 26  | 7
26 - 7 = 19  | 8
19 - 7 = 12  | 9
12 - 7 = 5   | 10
5            | residuo
```

Probar con los valores
- FFFF FFFF / \<value\>
- FFFF / \<value\>
- F / \<value\>

# Ejercicio 3

Programa que calcule el enésimo número de Fibonacci

Usar `JCXZ` recomendado por el ingeniero.

```
0 1
1 1
1 2
3 2
3 5
8 5
```

Código

```asm
; FIBONACCI AKA EJER23
; Calcula el no. n de fibonacci guardado en la variable concurr
; y lo muestra en la variable result
; compara para el no. 1 y retorna 0
; compara para el no. 2 y 3 y retorna 1
; sino, decrementa 1 en el no. de iteraciones para comparar cuando llegue a 0
; y realiza el sig. loop
; ax.copy
; ax = bx
; bx = bx + ax.copy
; repetir loop n - 1 veces
; guardar en result el valor final de ax
; Daniel Eduardo Bautista Fuentes 2121323
;
;
;******************** CÓDIGO DE INICIO ********************
    ideal
    dosseg
    model small
    stack 256
;***************** VARIABLES DEL PROGRAMA *****************
dataseg
    concurr     dw      ?     ; Muestras valores de DOUBLE WORD
    result      dw      ?
;******************* CÓDIGO DEL PROGRAMA *******************
codeseg
inicio:
    mov     ax, @data       ; INIT DATA SEG
    mov     ds, ax
  
    xor     ax, ax          ; CLEAR AX (16 LSB)
    xor     dx, dx          ; CLEAR DX (16 MSB)
  
    mov     cx, [concurr]
    cmp     cx, 1
    je      is_0
    cmp     cx, 4
    jl      is_3_or_lower
fibbonacci:
    mov     ax, 0
    mov     bx, 1
    dec     cx
fibbonacci_loop:
    xor     dx, dx          ; clear
    mov     dx, ax          ; backup
  
    mov     ax, bx          ; ax = bx
    add     bx, dx          ; bx = bx + prev ax
    dec     cx              ; ecx --
    jnz     fibbonacci_loop
    jmp     save
is_0:
    mov     ax, 0
    jmp     save
is_3_or_lower:
    mov     ax, 1
save:
    mov     [result], ax
salir:
    mov     ah, 4Ch
    int     21h
;******************* CÓDIGO DE TERMINACIÓN ******************
    end     inicio
```


