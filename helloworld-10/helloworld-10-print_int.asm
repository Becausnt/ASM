; ---------------------------------
; Count to ten and print the numbers

%include "functions.asm"

SECTION .data
global _start 

_start:
    mov     ecx, 0      ; Counter
    jmp     number

next_number:
    inc     ecx

number:
    mov     eax, ecx
    call    println_int

    cmp     ecx, 2
    jne     next_number

    call    quit