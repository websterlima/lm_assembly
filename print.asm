	SECTION .data

base:	DB	2
pilha:	TIMES 10	DB ' '
topo:
N	EQU	17

	SECTION .text

%macro	push	2
	dec	%2
	mov	[%2], %1
%endmacro

	global _start

_start:
	mov	ax, N
	mov	bl, [base]

	mov	ecx, topo

	jmp	loop_comp

loop:
	div	bl
	
	mov	dl, ah
	add	dl, 48

	push	dl, ecx

	xor	ah, ah

loop_comp:
	cmp	al, 0
	jne	loop

	mov	edx, topo
	sub	edx, ecx

	mov	ebx, 1
	mov	eax, 4
	int	0x80

	mov	eax, 1
	int	0x80
