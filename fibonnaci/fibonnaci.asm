;----------------------------------
; Calculate fibonacci numbers up to 100

SECTION .data
    num1 dd 0x0
    num2 dd 0x1

section .bss
    numbuf: resb 12        ; "-2147483648" + newline = 12 bytes

SECTION .text
global _start

_start:

next_number:
    mov     eax, [num1]     ; move value of num1 to eax, no need to zero with
                            ;  xor since mov overwrites the whole register
    add     eax, [num2]     ; eax = num1 + num2

    mov     ebx, [num2]     ; move to ebx because x86 can't move memory to memory
    mov     [num1], ebx     ; num1 = num2
    mov     [num2], eax     ; num2 = eax

    cmp     eax, 0x64       ; if eax, 100
    jg      exit            ; if eax > 100: exit

    call    print_uint      ; print number from eax
    jmp     next_number     ; loop


; ------- CLAUDE's UINT PRINT FUNCTION ---------
print_uint:
    mov ebx, 10
    lea edi, [numbuf + 11]
    mov byte [edi], 10     ; newline at the end

.next_digit:
    dec edi
    xor edx, edx           ; MUST zero edx before div
    div ebx                ; eax /= 10, edx = old eax % 10
    add dl, '0'            ; remainder → ASCII
    mov [edi], dl
    test eax, eax
    jnz .next_digit        ; do-while, so 0 prints as "0"

    mov ecx, edi           ; buffer start
    lea edx, [numbuf + 12]
    sub edx, edi           ; length = end - start
    mov ebx, 1             ; stdout
    mov eax, 4             ; sys_write
    int 0x80
    ret 


exit:
    mov     eax, 1
    int     0x80