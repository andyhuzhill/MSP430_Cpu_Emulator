
test.elf:     file format elf32-msp430


Disassembly of section .text:

00000000 <start>:
   0:	3b 40 17 35 	mov	#13591,	r11	;#0x3517
   4:	05 4b       	mov	r11,	r5	
   6:	96 45 02 00 	mov	2(r5),	6(r6)	;0x0002(r5), 0x0006(r6)
   a:	06 00 
   c:	1b 45 02 00 	mov	2(r5),	r11	;0x0002(r5)
  10:	37 40 16 f0 	mov	#-4074,	r7	;#0xf016
  14:	b7 40 34 12 	mov	#4660,	0(r7)	;#0x1234, 0x0000(r7)
  18:	00 00 
  1a:	37 40 14 11 	mov	#4372,	r7	;#0x1114
  1e:	b7 40 5a a5 	mov	#-23206,0(r7)	;#0xa55a, 0x0000(r7)
  22:	00 00 
  24:	90 40 f0 ef 	mov	-4112(r0),4332(r0);PC rel. 0xf016, PC rel. 0x1114
  28:	ec 10 
  2a:	92 42 16 f0 	mov	&0xf016,&0x1114	
  2e:	14 11 
