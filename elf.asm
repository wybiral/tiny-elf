BITS 32
org 0x05000000
db  0x7F, "ELF"
dd  1
dd  0
dd  $$
dw  2
dw  3
dd  0x0500001B
dd  0x0500001B
dd  4
mov dl, 12
mov ecx, msg
int 0x80
db  0x25
dw  0x20
dw  0x01
inc eax
int 0x80
msg db  "Merry xmas!", 10