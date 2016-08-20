AS=msp430-as
GCC=msp430-gcc
OBJCOPY=msp430-objcopy
OBJDUMP=msp430-objdump
CP=cp
RM=rm

all:
	$(AS) test.a430 -o test.elf
	$(OBJCOPY) -I elf32-msp430  test.elf -O binary test.bin
	$(OBJDUMP) -d test.elf > test.s
	$(CP) test.bin ..

c430:
	mv test.c430 test.c
	$(GCC) -std=c99 -mmcu=msp430g2553 -o test.elf test.c
	mv test.c test.c430
	$(OBJCOPY) -I elf32-msp430  test.elf -O binary test.bin
	$(OBJDUMP) -d test.elf > test.s
	$(CP) test.bin ..
	
   
clean:
	$(RM) -rf *.elf *.bin *.s
