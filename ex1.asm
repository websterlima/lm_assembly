	SECTION .data

var1:	DB	10
var2:	DB	7
var3:	DB	2

	SECTION .text

global _start

_start:
	mov	al, [var1]
	mov	bl, [var2]
	cmp	al, bl
	jl	less1
	mov	al, [var3]
	cmp	al, bl
	mov	cl, al
	jl	end
	mov	cl, bl
	jmp	end

less1:
	mov	bl, [var3]
	cmp	al, bl
	mov	cl, al
	jl	end
	mov	cl, bl
	jmp	end

end:
	mov	bl, cl
	mov	eax, 1
	int	0x80
