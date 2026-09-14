; --------------------------------------
; File explaining .bss (Block Started by Symbol) usage
; not compileable as no _start


SECTION .bss align=64   ; align the section to 64 byte boundaries, don't confuse with the ALIGN keyword

    alignb  1           ; Align the next variable to a n-byte blocks. alignb and not align because align
                        ;   writes actual zeros to memory while alignb just reserves the space. Since 
                        ;   BSS is nobits, recording only size and not aactual values, the write would
                        ;   have nowhere to go. Modern NASM recognises this and changes align to alignb
                        ;   but using alignb is clearer
                        ;   Aligning optimises reads and prevents errors with certain operations


    var1:   RESB 1      ; reserve 1 byte            1   [byte size]
    alignb  2
    var2:   RESW 1      ; reserve 1 word            2
    alignb  4
    var3:   RESD 1      ; reserve 1 double word     4
    alignb  8
    var4:   RESQ 1      ; reserve 1 quad word       8
    alignb  10
    var5:   REST 1      ; reserve 1 ten bytes       10
    alignb  16
    var6:   RESO 1      ; reserve 1 octo word       16
    alignb  32
    var7:   RESY 1      ; reserve 1 Y word          32
    alignb  64
    var8:   RESZ 1      ; reserve 1 Z word          64


    alignb 64
    buffer:     ;   mark beginning of buffer
    RESB 4096   ;   reserve 4096 bytes, too big to align for most use-cases
    buffer_end: ;   mark end of buffer

    alignb  1   
    var8:
    var8_alias:
    var8_alias1:
    var8_alias2:
    var8_aliasN:    ;   var8* all point at the same address
    resb    1