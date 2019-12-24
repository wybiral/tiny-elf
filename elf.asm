bits 32
org 0x10000

ehdr:
    db 0x7F, "ELFMerry xmas!", 10
    dw 2                ; e_type
    dw 3                ; e_machine
    dd 1                ; e_version
    dd _part1           ; e_entry
    dd phdr - $$        ; e_phoff
_part1:
    mov ecx, 0x10004
    mov al, 4
    inc ebx
    jmp _part2
    dw phdrsize
phdr:
    dd 1            ; e_phnum e_shentsize p_type
    dd 0            ; e_shnum e_shstrndx  p_offset
ehdrsize equ  $ - ehdr
    dd $$           ; p_vaddr
    dd $$           ; p_paddr
    dd filesize     ; p_filesz
    dd filesize     ; p_memsz
    dd 7            ; p_flags
    dd 0x1000       ; p_align
phdrsize equ  $ - phdr

_part2:
    mov dl, 12
    int 0x80
    mov al, 1
    mov bl, 0
    int 0x80

filesize      equ     $ - $$