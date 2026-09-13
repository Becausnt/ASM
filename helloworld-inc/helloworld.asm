;-----------------------------------
; Helloworld with external function includion

%include        'functions.asm'

SECTION .data
msg1 db 'Hello there!', 0x0
msg2 db 'GENERAL KENOBI', 0x0

SECTION .text
global _start

_start:

    mov eax, msg1
    call println

    mov eax, msg2
    call println

    call quit