; ---------------------------------
; Count to ten and print the numbers

%include "functions.asm"

SECTION .data
global _start 

_start:
    mov     ecx, 0      ; Counter
    jmp     number

next_number:
    add     ecx, 0x1

number:
    mov     eax, ecx
    add     eax, 0x30
    push    eax
    mov     eax, esp
    ;mov     byte [eax + 1], 0x0    ; technically correct but unnecessary since mov to 32-bit registers
                                    ;  automatically zeroes it
    call    println
    pop     eax

    cmp     ecx, 0xa
    jne     next_number

    call    quit