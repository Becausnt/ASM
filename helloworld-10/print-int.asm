; ---------------------------------------
; function to print multi-digit integers

%include "functions.asm"

SECTION .text
global _start

_start:
    mov     eax, 100
    call    println_int
    call    quit
