	SECTION .data
msg:	DB	"Isso eh um teste"
copy:	DB	"                "

	SECTION .text

	global _start

%macro	print	2
	
	mov	ebx, 0

init:
	mov	eax, %1

	add	eax, ebx
	mov	eax, [eax]

	mov	[copy + ebx], eax

	inc	ebx

	cmp	ebx, %2
	jne	init
	
%endmacro

_start:
	mov	ecx, copy
	mov	edx, 0

loop:
	inc	edx
	dec	ecx

loop_comp:
	mov	ebx, [ecx]
	cmp	byte ebx, 101
	jne	loop

	;print	ecx, edx

	;mov	edx, 5
	;mov	ecx, copy
	;mov	ebx, 1
	;mov	eax, 4
	;int	0x80

	mov	ebx, edx
	mov	eax, 1
	int	0x80
