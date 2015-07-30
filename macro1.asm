	SECTION .data
var1:	DB	4
var2:	DB	10H

	SECTION .text

%macro	double	1
	add	%1, %1
%endmacro

%macro	square	1
	mov	eax, %1
	mov	ebx, %1
	mul	ebx
	mov	%1, eax
%endmacro

	global _start

_start:
	mov	ecx, [var1]
	double	ecx
	square	ecx

	mov	ebx, eax
	mov	eax, 1
	int	0x80
