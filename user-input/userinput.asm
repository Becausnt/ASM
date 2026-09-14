; ASM program to handle user input

%include    'functions.asm'


SECTION .data
    enter_name  db  'Please enter your name:', 0x0
    hello       db  'Hello, ', 0x0

SECTION .bss
    name_buf    resb    64      ; buffer for username, 64 bytes should be fine

SECTION .text
global _start

_start:
    mov     eax, enter_name     ; move message address to eax
    call println                ; print

    mov     edx, 63             ; num of bytes to read, keep space for 0 terminator
    mov     ecx, name_buf       ; buffer to write to
    mov     ebx, 0              ; 0 = STDIN, 1 = STDOUT
    mov     eax, 3              ; SYS_READ
    int     0x80                ; syscall

    mov     byte [name_buf + eax], 0x0  ; add null-terminator at name_buf + num of bytes read

    mov     eax, hello          ; move name address to eax
    call print                  ; print without newline

    mov     eax, name_buf       ; name buffer address to eax
    call print                  ; print without newline because input already contains one

    call quit                   ; exit


