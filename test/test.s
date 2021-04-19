
test.elf:     file format elf32-msp430


Disassembly of section .text:

0000c000 <__watchdog_support>:
    c000:	55 42 20 01 	mov.b	&0x0120,r5	
    c004:	35 d0 08 5a 	bis	#23048,	r5	;#0x5a08
    c008:	82 45 00 02 	mov	r5,	&0x0200	

0000c00c <__init_stack>:
    c00c:	31 40 00 04 	mov	#1024,	r1	;#0x0400

0000c010 <__do_copy_data>:
    c010:	3f 40 00 00 	mov	#0,	r15	;#0x0000
    c014:	0f 93       	tst	r15		
    c016:	08 24       	jz	$+18     	;abs 0xc028
    c018:	92 42 00 02 	mov	&0x0200,&0x0120	
    c01c:	20 01 
    c01e:	2f 83       	decd	r15		
    c020:	9f 4f a0 c0 	mov	-16224(r15),512(r15);0xc0a0(r15), 0x0200(r15)
    c024:	00 02 
    c026:	f8 23       	jnz	$-14     	;abs 0xc018

0000c028 <__do_clear_bss>:
    c028:	3f 40 00 00 	mov	#0,	r15	;#0x0000
    c02c:	0f 93       	tst	r15		
    c02e:	07 24       	jz	$+16     	;abs 0xc03e
    c030:	92 42 00 02 	mov	&0x0200,&0x0120	
    c034:	20 01 
    c036:	1f 83       	dec	r15		
    c038:	cf 43 00 02 	mov.b	#0,	512(r15);r3 As==00, 0x0200(r15)
    c03c:	f9 23       	jnz	$-12     	;abs 0xc030

0000c03e <main>:
    c03e:	04 41       	mov	r1,	r4	
    c040:	24 53       	incd	r4		
    c042:	21 82       	sub	#4,	r1	;r2 As==10
    c044:	84 4f fa ff 	mov	r15,	-6(r4)	;0xfffa(r4)
    c048:	84 4e fc ff 	mov	r14,	-4(r4)	;0xfffc(r4)
    c04c:	f2 43 22 00 	mov.b	#-1,	&0x0022	;r3 As==11
    c050:	f2 43 21 00 	mov.b	#-1,	&0x0021	;r3 As==11
    c054:	b0 12 6c c0 	call	#0xc06c	
    c058:	c2 43 21 00 	mov.b	#0,	&0x0021	;r3 As==00
    c05c:	b0 12 6c c0 	call	#0xc06c	
    c060:	f7 3f       	jmp	$-16     	;abs 0xc050

0000c062 <__stop_progExec__>:
    c062:	32 d0 f0 00 	bis	#240,	r2	;#0x00f0
    c066:	fd 3f       	jmp	$-4      	;abs 0xc062

0000c068 <__ctors_end>:
    c068:	30 40 9e c0 	br	#0xc09e	

0000c06c <delay>:
    c06c:	04 12       	push	r4		
    c06e:	04 41       	mov	r1,	r4	
    c070:	24 53       	incd	r4		
    c072:	21 82       	sub	#4,	r1	;r2 As==10
    c074:	84 43 fa ff 	mov	#0,	-6(r4)	;r3 As==00, 0xfffa(r4)
    c078:	0b 3c       	jmp	$+24     	;abs 0xc090
    c07a:	84 43 fc ff 	mov	#0,	-4(r4)	;r3 As==00, 0xfffc(r4)
    c07e:	02 3c       	jmp	$+6      	;abs 0xc084
    c080:	94 53 fc ff 	inc	-4(r4)		;0xfffc(r4)
    c084:	b4 90 7c 00 	cmp	#124,	-4(r4)	;#0x007c, 0xfffc(r4)
    c088:	fc ff 
    c08a:	fa 3b       	jl	$-10     	;abs 0xc080
    c08c:	94 53 fa ff 	inc	-6(r4)		;0xfffa(r4)
    c090:	b4 90 ff 00 	cmp	#255,	-6(r4)	;#0x00ff, 0xfffa(r4)
    c094:	fa ff 
    c096:	f1 3b       	jl	$-28     	;abs 0xc07a
    c098:	21 52       	add	#4,	r1	;r2 As==10
    c09a:	34 41       	pop	r4		
    c09c:	30 41       	ret			

0000c09e <_unexpected_>:
    c09e:	00 13       	reti			

Disassembly of section .vectors:

0000ffe0 <__ivtbl_16>:
    ffe0:	68 c0 68 c0 68 c0 68 c0 68 c0 68 c0 68 c0 68 c0     h.h.h.h.h.h.h.h.
    fff0:	68 c0 68 c0 68 c0 68 c0 68 c0 68 c0 68 c0 00 c0     h.h.h.h.h.h.h...
