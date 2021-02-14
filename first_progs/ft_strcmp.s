;int ft_strcmp(const char *s1, const char *s2)

section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
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
	ret
