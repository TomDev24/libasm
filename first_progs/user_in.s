;https://www.youtube.com/watch?v=busHtSyx2-w&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=3
;https://www.devdungeon.com/content/how-mix-c-and-assembly

section .data
	text1 db "What is your name? "
	text2 db "hello "

section .bss
	name resb 16

section .text
	global _user_in

_user_in:
	call _printText1
	call _getName
	call _printText2
	call _printName
	
	;mov rax, 60
	;mov rdi, 0
	;syscall
	ret

_printText1:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 19
	syscall
	ret

_printText2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 6
	syscall
	ret

_printName:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_getName:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret	
