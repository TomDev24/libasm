;https://stackoverflow.com/questions/4169417/self-modifying-code-always-segmentation-faults-on-linux
;https://stackoverflow.com/questions/16679478/what-does-the-usage-of-mprotect-as-an-asm-syscall-look-like-with-respect-to-it;

section .text
	global ft_strcpy	

ft_strcpy:
	mov rax, rdi
	mov rcx, -1
	xor rbx, rbx

	.loop:
		inc rcx
		mov rbx, [rsi + rcx]
		mov [rdi + rcx], rbx			;thi line gave seg fault, so i read about mprotect		
		;mov byte[rdi], byte[rsi] invalid
	cmp byte[rsi + rcx], 0
	jne .loop
	ret

_deb:
	jmp _deb

_exit:	
	ret

_mem_protect:
	mov rax, 0x0a
	mov rdi, rdi
	mov rsi, 2		;memory adresses amount to give write permission 	
	mov rdx, 0x2		;allow write to mem 	
	syscall
	ret
