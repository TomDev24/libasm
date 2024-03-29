;int ft_strcmp(const char *s1, const char *s2)

section .text
	global _ft_strcmp

_ft_strcmp:
	xor rax, rax
	push rbx
	push rdi
	push rsi
	xor rbx, rbx	
	.loop:
		mov al, byte[rdi]
		mov bl, byte[rsi]
		sub rax, rbx
		cmp al, byte 0
		jne _exit
		cmp byte[rdi], 0
		je _exit
		cmp byte[rsi],0
		je _exit
		inc rdi
		inc rsi
	jmp .loop

_exit:
	pop rsi
	pop rdi
	pop rbx
	ret
