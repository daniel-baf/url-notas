; Aplicaion de Gotoxy  Gotoxy
%include 	'stdio32.asm'

SECTION .data
	Mensaje 	db	'Hola  Mensaje', 0h

SECTION .text
	global	_start

_start:
	call	Borrar

	
	mov	dl, 57
	mov	dh, 57
	call	gotoxy

	mov	eax, Mensaje
	call	printStr

	call	exit
