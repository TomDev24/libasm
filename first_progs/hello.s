;1)take a look a registers table of rax eax ax al
;2)system call params registers table
;3)id of system calls (1 - is write, 60 is sys_exit)
;4)there are only 3 sections .data .text .bss
;5)labels -> _start:   etc are almost functions
;6)_start: is a main function, if ld wont find _start it errors

section .data
	text db "Ha","ello, World!", 10

section .text
	global _start  ; global, so that linker would the adress of label

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 15
	syscall

	mov rax, 60	;exit syscall id
	mov rdi, 0	;error paramater of sys_exit
	syscall
