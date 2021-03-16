;size_t	ft_read(int fd, void *buf, size_t count);

extern __errno_location

section .text
	global	ft_read

ft_read:
	xor rax, rax		;0 for read operation id in linux 	
	mov rdi, rdi
	mov rsi, rsi	
	mov rdx, rdx
	syscall
	cmp rax, 0
	jl _error
	ret	

_error:
	mov rcx, rax
	neg rcx
	call __errno_location wrt ..plt
	mov [rax], rcx
	mov rax, -1
	ret
