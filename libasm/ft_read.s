;size_t	ft_read(int fd, void *buf, size_t count);

extern ___error

section .text
	global	_ft_read

_ft_read:
	;xor rax, rax		;0 for read operation id in linux 	
	mov 	rax, 0x2000003
	;mov rdi, rdi
	;mov rsi, rsi	
	;mov rdx, rdx
	syscall
	jc _fin
	ret	

_fin:
	mov r15, rax
	push -1
	call ___error ;wrt ..plt
	mov [rax], r15
	pop rax
	ret
