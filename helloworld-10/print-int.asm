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
    mov     ecx, 0      ; amount of digits to print

for_digit:
    inc     ecx         ; count digits to print
    mov     edx, 0      ; zero for results
    mov     esi, 10     ; divide by 10
    idiv    esi         ; Divide eax by esi

    add     edx, 48     ; convert to ascii
    push    edx         ; mov to stack for printing

    cmp     eax, 0      ; more digits to print?
    jne     for_digit

print_loop:
    dec     ecx         ; count down to zero
    mov     eax, esp    ; get address of digit to print
    call    print
    pop     eax         ; remove last digit from stack.

    cmp     ecx, 0      ; any more digits to print?
    jne     print_loop


    pop     eax         ; restore registers and return
    pop     ecx
    pop     edx
    pop     esi
    ret