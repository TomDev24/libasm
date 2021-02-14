;https://stackoverflow.com/questions/17501015/what-is-the-address-of-local-labels-in-nasm
;https://www.youtube.com/watch?v=busHtSyx2-w&t=222s

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax	;setting our counter and return value to zero

	cmp byte[rdi], 0
	je _exit
	.loop:
		inc rax
		inc rdi
	cmp byte[rdi], 0
	jne .loop
	jmp _exit

_exit:
	ret
