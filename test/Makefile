AS=msp430-as
OBJCOPY=msp430-objcopy
OBJDUMP=msp430-objdump
CP=cp
RM=rm

all:
	$(AS) test.asm -o test.elf
	$(OBJCOPY) -I elf32-msp430  test.elf -O binary test.bin
	$(OBJDUMP) -d test.elf > test.s
	$(CP) test.bin ..
   
clean:
	$(RM) -rf *.elf *.bin *.s