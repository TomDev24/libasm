;https://www.youtube.com/watch?v=NFv7l3wQsZ4&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=5
;not correct way https://stackoverflow.com/questions/24991944/linking-c-with-nasm

;cruical part https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f

;https://stackoverflow.com/questions/62859819/trying-to-set-up-errno-using-nasm  //abou error function
;in linux errno is set automaticly, and we use __errno_location in mac we use __error

;https://stackoverflow.com/questions/4017424/how-to-check-if-a-signed-integer-is-neg-or-pos
;and test showed me how to fix errno

extern ___error

section .text
        global _ft_write

_ft_write:
		mov 	rax, 0x2000004
        mov rdi, rdi		;rdi is first param with fd
        mov rsi, rsi		;rsi is second param void *buf
        mov rdx, rdx		;rdx amount to type
        syscall
		jc _error
        ret			;rax is return val, and it seems its auto setted

_error:
	mov r15, rax
	push -1
	call ___error ; wrt ..plt
	mov [rax], r15
	pop rax
	ret
