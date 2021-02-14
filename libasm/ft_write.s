;https://www.youtube.com/watch?v=NFv7l3wQsZ4&list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn&index=5
;not correct way https://stackoverflow.com/questions/24991944/linking-c-with-nasm

;cruical part https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f

section .text
        global ft_write

ft_write:
        mov rax, 1		;write call id
        mov rdi, rdi		;rdi is first param with fd
        mov rsi, rsi		;rsi is second param void *buf
        mov rdx, rdx		;rdx amount to type
        syscall
        ret			;rax is return val, and it seems its auto setted
