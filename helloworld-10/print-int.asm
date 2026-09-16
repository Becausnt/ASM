; ---------------------------------------
; function to print multi-digit integers

%include "functions.asm"

SECTION .text
global _start

_start:
    mov     eax, 100
    call    print_int
    call    quit

print_int:
    push    eax         ; num to divide
    push    ecx
    push    edx
    push    esi         ; dividend

for_digit:
    mov     edx, 0      ; zero for results
    mov     esi, 10     
    idiv    esi         ; Divide eax by esi
    add     eax, 48     ; convert to ascii

    push    eax         ; mov to stack for printing
    mov     eax, esp    ; move pointer to eax for printing
    call    print
    pop     eax         ; restore to avoid mess
    cmp     esi, 0
    jne     for_digit

    mov     eax, 0x0
    push    eax
    mov     eax, esp
    call    println
    pop     eax

    pop     eax
    pop     ecx
    pop     edx
    pop     esi
    ret