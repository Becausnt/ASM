#!/bin/bash
# compile .asm files

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 file-to-compile.asm"
    exit 1
fi

case "$file" in
    *.asm) ;;
    *) echo "Error: expected a .asm file"; exit 1 ;;
esac

# main code
file="$1"
filename=${file%".asm"}

nasm -f elf $file
ld -m elf_i386 "$filename.o" -o "$filename"