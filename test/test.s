
test.elf:     file format elf32-msp430


Disassembly of section .text:

00000000 <start>:
   0:	3a 40 14 00 	mov	#20,	r10	;#0x0014
   4:	0b 4a       	mov	r10,	r11	
   6:	9b 4a 02 00 	mov	2(r10),	6(r11)	;0x0002(r10), 0x0006(r11)
   a:	06 00 
   c:	90 40 f6 ff 	mov	-10(r0),-10(r0)	;PC rel. 0x0004, PC rel. 0x0006
  10:	f6 ff 
  12:	92 42 00 00 	mov	&0x0000,&0x0000	
  16:	00 00 
