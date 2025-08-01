;calculadora de numeros enteros
;autor_Pedro Andres Urrutia Hurtarte
%include 'stdio32.asm'
SECTION .data
	mensajeE db 'Error. verifique que solo haya numeros',0h
	mensajeEx db 'Error. verifique sus signos',0h
	mensajeEr db 'Error, division de 0'
SECTION .bss
	cadena resb 100 ; reserva 100 bytes
SECTION .text
global _start
;-------------------------------START
_start:
	mov ebp,esp 
	mov ecx,0
	mov ebx,2
;---------------------------------------Iniciode calculadora
Inicio: 
	mov eax,[ebp+ebx*4]
	cmp byte[eax+1],0
	jnz convertirNum
;-------------Signos a operar------------------------
	cmp byte[eax],43
	je Sumar 
	cmp byte [eax],45
	je Restar
	cmp byte [eax],47
	je Dividir
	cmp byte[eax],120
	je Multiplicar
;_--------------------------Fin Inicio de calculadora
;--------------------------Se convierte el numero
convertirNum:
	mov edi,0
	call Ascci
	cmp edi,1
	je noNum
	mov [cadena +ecx *4],eax
	inc ecx
	jmp finalCalculadora
;----------------------------------------fincalculadoraa
finalCalculadora:
	inc ebx 
	cmp ebx,[ebp]
	jle Inicio
	jmp mostrarpantalla
;------------------------------------tomar numero de pila
tomarnum:
	cmp ecx,2 
	jl expresioninvalida 
	dec ecx
	mov esi,[cadena+ecx*4]
	dec ecx 
	mov eax,[cadena+ecx*4]
	ret
;-------------------------------------respuestas
respuestas:
	mov [cadena + ecx * 4],eax
	inc ecx
	jmp finalCalculadora
;--------------------------------------operaciones
Sumar:                   ;Sumar
	call tomarnum
	add eax,esi
	call respuestas
Restar:                   ;Restar
	call tomarnum
	sub eax,esi
	call respuestas
Dividir:                   ;Dividir
    
	call tomarnum
	cmp esi,0
	je nodiv
	idiv esi
	call respuestas
Multiplicar:                   ;Multiplicar
	call tomarnum
	imul esi
	call respuestas
;------------imprimirresultado
	mostrarpantalla:
	cmp ecx,1
	jne expresioninvalida
	dec ecx
	mov eax, [cadena +ecx*4]
	call printInt
	call exit
;----------------------------Errores
	expresioninvalida:
	mov eax,mensajeE
	call printStr
	call exit
	noNum:
	mov eax,mensajeEx
	call printStr
	call exit
	nodiv:
	mov eax,mensajeEr
	call printStr
	call exit
	
