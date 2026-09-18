; -----------------------------
; int strlen(String text)
; String length calculation function
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

; -----------------------------
; int print(String text)
; print a string to STDOUT
print:
    push    ebx
    push    ecx
    push    edx
    push    eax
    
    mov     ecx, eax    ; move string to ecx
    call    slen        ; get string length -> val in eax
    mov     edx, eax    ; mov string length to edx

    mov     ebx, 1      ; STD_OUT
    mov     eax, 4      ; SYS_WRITE
    int     0x80        ; call

    pop     ebx
    pop     ecx
    pop     edx
    pop     eax
    ret

; --------------------------------
; void println(String string)
; function to print with a newline
println:
    call print

    push    eax

    mov     eax, 0xa    ; newline to eax
    push    eax         ; newline to stack
    
    mov     eax, esp    ; address of newline to eax
    call    print       ; print newline
    pop     eax         ; remove newline from stack
    pop     eax         ; restore eax
    ret

;-------------------------------
; void print_int(int)
; Print a (multi-digit) integer to stdout

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

;-------------------------------
; void println_int(int)
; Print a (multi-digit) integer with a trailing newline
println_int:
    call print_int
    push    eax

    mov     eax, 0xa    ; newline to eax
    push    eax         ; newline to stack
    
    mov     eax, esp    ; address of newline to eax
    call    print       ; print newline
    pop     eax         ; remove newline from stack
    pop     eax         ; restore eax
    ret

;-------------------------------
; void exit()
; Exit program
quit:
    mov     eax, 1      ; SYS_EXIT
    int     0x80        ; call
    ret