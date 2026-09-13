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
    int     80h         ; CALL

    pop     ebx
    pop     ecx
    pop     edx
    ret

;-------------------------------
; void exit()
; Exit program
quit:
    mov     eax, 1      ; SYS_EXIT
    int     80h
    ret