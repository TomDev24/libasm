;char	*ft_strdup(const char *s);
;for some reason i couldn not call malloc
;gcc -no-pie -fno-pie main.c libasm.a  this solves this problem, on mac it probably work either way
;https://stackoverflow.com/questions/52126328/cant-call-c-standard-library-function-on-64-bit-linux-from-assembly-yasm-code

extern ft_strlen
extern ft_strcpy	;make strcpy work
extern malloc
extern __errno_location

section .text
	global ft_strdup

ft_strdup:
	;mov rdi, rdi	our str	
	push rdi
	call ft_strlen		;len will be in rax
	
	mov rdi, rax		;setting amout of byte for malloc	
	call malloc wrt ..plt
	
	mov rdi, rax
	pop rsi
	call ft_strcpy
	ret
