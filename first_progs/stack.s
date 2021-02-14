section .data
	ex db "0",10
	num1 db 1
	num2 db 240

section .text
	global _start

_start:
	push qword num1
	push qword num2
	call _print
	
	mov rax, 60
	mov rdi, 0
	syscall

_print:
	push rbp		; saving pointer to previous frame
	mov rbp, rsp		; updating base pointer to the top of the stack
	push qword rbx		; saving value of rbx 
	
	mov rcx, [rbp + 2]	; num1 relative to base pointer
	mov rdx, [rbp + 1]	; num2 relativee to base pointer
	
	mov rax, 1
	mov rdi, rcx		; we will control this with num1

	mov r9, [rdx]		; this one with num2
	mov [ex], r9w

	mov rsi, ex
	mov rdx, 2
	syscall
	
	mov rbx, [rbp - 1]	;restoring value of rbx
	mov rsp, rbp
	pop rbp	
	ret 
