;https://stackoverflow.com/questions/4169417/self-modifying-code-always-segmentation-faults-on-linux
;https://stackoverflow.com/questions/16679478/what-does-the-usage-of-mprotect-as-an-asm-syscall-look-like-with-respect-to-it;

section .text
	global _ft_strcpy	

_ft_strcpy:
	mov rax, rdi
	mov rcx, -1
	push rbx
	xor rbx, rbx

	.loop:
		inc rcx
		mov rbx, [rsi + rcx]
		mov [rdi + rcx], rbx			;thi line gave seg fault, so i read about mprotect		
		;mov byte[rdi], byte[rsi] invalid
	cmp byte[rsi + rcx], 0
	jne .loop
	pop rbx
	ret
