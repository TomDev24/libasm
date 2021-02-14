;size_t	ft_read(int fd, void *buf, size_t count);

section .text
	global	ft_read

ft_read:
	xor rax, rax		;0 for read operation id in linux 	
	mov rdi, rdi
	mov rsi, rsi	
	mov rdx, rdx
	syscall
	ret	
