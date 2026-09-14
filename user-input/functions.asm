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
    
    mov     ecx, eax    ; move string to ecx
    call    slen        ; get string length -> val in eax
    mov     edx, eax    ; mov string length to edx

    mov     ebx, 1      ; STD_OUT
    mov     eax, 4      ; SYS_WRITE
    int     0x80        ; call

    pop     ebx
    pop     ecx
    pop     edx
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
; void exit()
; Exit program
quit:
    mov     eax, 1      ; SYS_EXIT
    int     0x80        ; call
    ret