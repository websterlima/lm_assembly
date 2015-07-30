	SECTION	.data

array:	DB	'F', 'R', 'A', 'Y', 'D', 'B', 'P'
SIZE:	DB	7

	SECTION	.text

	global _start

_start:
	mov	ecx, array
	jmp	loop_comp_ext

loop_ext:
	mov	esi, 0
	jmp	loop_comp

loop:
	mov	al, [ecx]
	mov	bl, [ecx + esi]

	cmp	al, bl
	jl	loop_comp
	
	mov	[ecx], bl
	mov	[ecx + esi], al

loop_comp:
	inc	esi

	mov	eax, esi

	cmp	al, [SIZE]
	jne	loop

print:
	mov	edx, 1
	mov	ebx, 1
	mov	eax, 4
	int	0x80
	
	inc	ecx

	mov	edx, [SIZE]
	dec	edx
	mov	[SIZE], edx

loop_comp_ext:
	cmp	ecx, SIZE
	jne	loop_ext

	mov	eax, 1
	int	0x80
