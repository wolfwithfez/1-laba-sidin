.model small
.386
.stack 100h
.data
a 	db	127
b 	db	127
c 	db 	127
d 	dd 	(?)
.code
start:
	mov		ax, @data
	mov		ds, ax
	mov		bh, a
	mov		bl, b
	mov		cl, c

	movsx 	ax, bh
	add		ax, 18
	movsx 	dx, cl
	sub 	ax, dx
	sal 	dx, 1
	sub 	ax, dx
	movsx 	dx, bl
	sal 	dx, 1
	add 	ax, dx
	sal 	dx, 4
	add 	ax, dx
	sal 	dx, 1
	add 	ax, dx
	jz 		F
	movsx 	esi, ax
	
	mov 	al, cl
	imul	al
	movsx 	ecx, ax
	
	movsx	eax, bh
	add 	ecx, eax
	sal 	eax, 3
	add 	ecx, eax
	sal 	eax, 5
	add 	ecx, eax
	sal 	eax, 1
	add 	ecx, eax
	
	movsx 	ax, bl
	sal 	ax, 3
	sub 	ax, 1
	movsx 	ebx, ax
	imul  	ax
	sal 	eax, 16
	shrd 	eax, edx, 16
	imul	ebx
	add 	eax, ecx
	
	cdq
	idiv 	esi
	mov 	d, eax
	
F:
	mov 	ah, 4Ch
	int 	21h
end start