; Hello world
; nasm -f elf hello_world.asm && ld -m elf_i386 hello_world.o -o helloworld

SECTION .data
msg db  'Hello World!', 0xa    ; 0Ah = \n
len equ $ - msg                ; len of string

SECTION .text
global _start

_start:

    mov     ebx, msg
    mov     eax, ebx

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx

    mov     edx, eax     ; number of bytes to write
    mov     ecx, msg    ; string address
    mov     ebx, 1      ; STDOUT
    mov     eax, 4      ; SYS_WRITE
    int     80h         ; call

    mov     ebx, 0      ; exit code 0
    mov     eax, 1      ; SYS_EXIT
    int     80h         ; call

