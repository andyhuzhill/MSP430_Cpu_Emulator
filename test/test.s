
test.elf:     file format elf32-msp430


Disassembly of section .text:

00000000 <start>:
   0:	3b 40 9c 0c 	mov	#3228,	r11	;#0x0c9c
   4:	7a 40 fc ff 	mov.b	#-4,	r10	;#0xfffc
   8:	0b 4a       	mov	r10,	r11	
   a:	05 4b       	mov	r11,	r5	
   c:	12 d3       	setc			
   e:	90 40 f8 ff 	mov	-8(r0),	-8(r0)	;PC rel. 0x0008, PC rel. 0x000a
  12:	f8 ff 
  14:	92 42 00 00 	mov	&0x0000,&0x0000	
  18:	00 00 
  1a:	00 13       	reti			
  1c:	90 12 ec ff 	call	-20(r0)	;PC rel. 0x000a
  20:	12 d3       	setc			
  22:	22 d3       	setz			
