;-----------------------------------
; Helloworld with external function includion

%include        'functions.asm'

SECTION .data

SECTION .text
global _start

_start:

    pop     ecx     ; store number of args

next_arg:
    cmp     ecx, 0x0    ; any args left?
    jz      exit
    dec     ecx         ; decrease arg counter
    
    pop     eax         ; get argument
    call    println     ; print arg
    jmp     next_arg    ; iterate to next arg

exit:
    call    quit