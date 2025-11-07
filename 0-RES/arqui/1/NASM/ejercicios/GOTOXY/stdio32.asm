; Libreria  stdio 32
SECTION .data
	BorrarStr		db	1Bh, '[2J', 1Bh, '[3J', 0h
	xy	db	1Bh, '[01;01H', 0h
;  funcion longitud de cadena
;  void strlen(cadena)
strlen:
	push 	ebx
	mov 	ebx, eax
siguiente:
	cmp	byte[eax], 0
	jz	finConteo
	inc	eax
	jmp	siguiente

	finConteo:
	sub	eax, ebx
	pop	ebx
	ret

;Mostrar cadena en pantalla
;void printStr(cadena)
printStr:
	push 	edx
	push 	ecx
	push 	ebx
	push 	eax

	call	strlen
	mov 	edx, eax
	pop	eax
	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	pop	ebx
	pop 	ecx
	pop 	edx
	ret

;Despligue con salto de linea
;void printStrln(cadena)
printStrln:
	call	printStr

	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	printStr
	pop 	eax
	pop	eax
	ret

;funcion ingresar cadena
; void inputStr(cadena)
inputStr:
	push 	edx
	push	ecx
	push	ebx
	push	eax

	mov	edx, eax
	mov	ecx, ebx
	mov	ebx, 0
	mov	eax, 3
	int	80h

	pop 	eax
	pop	ebx
	pop	ecx
	pop 	edx
	ret

;funcion imprimir numero
;void printInt(cadnea)
printInt:
	push	edx
	push	ecx
	push	ebx
	push	eax

cicloDiv:

	inc	ecx
	mov 	esi, 10
	mov	edx, 0
	idiv	esi
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	cicloDiv

cicloPrint:

	dec	ecx
	mov	eax, esp
	call 	printStr
	pop	eax
	cmp	ecx, 0
	jnz	cicloPrint

	mov	eax, 03
	push	eax
	mov	eax, esp
	call	printStr
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret




; funcion borrar pantalla
Borrar:
	mov	eax, BorrarStr
	call	printStr
	ret

;funcion gotoxy
;ah = x al = y
gotoxy:
	mov	eax, xy
	mov	ebx, eax
seguirCiclo:
	cmp	byte [ebx], 0
	jz	finCiclo
	cmp	byte [ebx], '['
	je	ponerX
	cmp	byte [ebx], ';'
	je	ponerY
	inc	ebx
	jmp	seguirCiclo	
ponerY:
	add	ebx, 2
	mov	byte [ebx], dl
	jmp	seguirCiclo
	
ponerX:
	add	ebx, 2
	mov 	byte [ebx], dh
	jmp 	seguirCiclo



finCiclo:
	call	printStr
	int	80h
	ret
; void exit()
exit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
