	SECTION .data

n:	DB	5

	SECTION .text

global _start

_start:
	mov	al, [n]
	mov	bl, al
	dec	bl

repeat:
	mul	bl
	dec	bl
	jnz	repeat

	mov	bl, [n]
repeat2:
	sub	al, bl
	dec	bl
	jnz	repeat2

	mov	ebx, eax
	mov	eax, 1
	int	0x80
