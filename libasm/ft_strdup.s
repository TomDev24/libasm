;char	*ft_strdup(const char *s);
;for some reason i couldn not call malloc
;gcc -no-pie -fno-pie main.c libasm.a  this solves this problem, on mac it probably work either way
;https://stackoverflow.com/questions/52126328/cant-call-c-standard-library-function-on-64-bit-linux-from-assembly-yasm-code

extern _ft_strlen
extern _ft_strcpy	;make strcpy work
extern _malloc

section .text
	global _ft_strdup

_ft_strdup:
	;mov rdi, rdi	our str	
	push rdi
	call _ft_strlen		;len will be in rax
	
	inc rax
	mov rdi, rax		;setting amout of byte for malloc	
	call _malloc ; wrt ..plt
	cmp rax, 0
	je _error	

	mov rdi, rax
	pop rcx
	mov r10, rsi
	mov rsi, rcx
	call _ft_strcpy
	mov rsi, r10
	mov rdi, rcx
	ret

_error:
	ret
