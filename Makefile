all: elf

elf: elf.asm
	nasm elf.asm -f bin -o elf
	chmod +x elf
