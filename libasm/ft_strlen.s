;https://stackoverflow.com/questions/17501015/what-is-the-address-of-local-labels-in-nasm
;https://www.youtube.com/watch?v=busHtSyx2-w&t=222s

;https://docs.microsoft.com/ru-ru/cpp/build/x64-calling-convention?view=msvc-160
;whic registes should be saved
section .text
	global _ft_strlen

_ft_strlen:
	push rdi
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
	pop rdi
	ret
