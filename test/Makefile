AS=msp430-as
GCC=msp430-gcc
GXX=msp430-g++
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
	$(GCC) -std=c99 -mcpu=430 -mmcu=msp430g2553 -nostartfiles -lm -o test.elf test.c
	$(OBJCOPY) -I elf32-msp430 test.elf -O binary test.bin
	$(OBJDUMP) -D test.elf > test.s
	$(CP) test.bin ..


cpp:
	$(GXX) -std=c++0x -mmcu=msp430g2553 -nostartfiles -o  test.elf  test.cpp
	
clean:
	$(RM) -rf *.elf *.bin *.s
