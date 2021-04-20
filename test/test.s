
test.elf:     file format elf32-msp430


Disassembly of section .text:

0000c000 <main>:
    c000:	04 41       	mov	r1,	r4	
    c002:	24 53       	incd	r4		
    c004:	31 50 e0 ff 	add	#-32,	r1	;#0xffe0
    c008:	84 4f fa ff 	mov	r15,	-6(r4)	;0xfffa(r4)
    c00c:	84 4e fc ff 	mov	r14,	-4(r4)	;0xfffc(r4)
    c010:	0f 44       	mov	r4,	r15	
    c012:	3f 50 e0 ff 	add	#-32,	r15	;#0xffe0
    c016:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c01a:	2f 53       	incd	r15		
    c01c:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c020:	2f 53       	incd	r15		
    c022:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c026:	2f 53       	incd	r15		
    c028:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c02c:	2f 53       	incd	r15		
    c02e:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c032:	2f 53       	incd	r15		
    c034:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c038:	2f 53       	incd	r15		
    c03a:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c03e:	2f 53       	incd	r15		
    c040:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c044:	2f 53       	incd	r15		
    c046:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c04a:	2f 53       	incd	r15		
    c04c:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c050:	2f 53       	incd	r15		
    c052:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c056:	2f 53       	incd	r15		
    c058:	8f 43 00 00 	mov	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c05c:	2f 53       	incd	r15		
    c05e:	cf 43 00 00 	mov.b	#0,	0(r15)	;r3 As==00, 0x0000(r15)
    c062:	1f 53       	inc	r15		
    c064:	b0 12 a4 c0 	call	#0xc0a4	
    c068:	b0 12 a4 c0 	call	#0xc0a4	
    c06c:	84 43 de ff 	mov	#0,	-34(r4)	;r3 As==00, 0xffde(r4)
    c070:	0e 3c       	jmp	$+30     	;abs 0xc08e
    c072:	1f 44 de ff 	mov	-34(r4),r15	;0xffde(r4)
    c076:	3f 50 90 ca 	add	#-13680,r15	;#0xca90
    c07a:	6e 4f       	mov.b	@r15,	r14	
    c07c:	0f 44       	mov	r4,	r15	
    c07e:	3f 50 e0 ff 	add	#-32,	r15	;#0xffe0
    c082:	1f 54 de ff 	add	-34(r4),r15	;0xffde(r4)
    c086:	cf 4e 00 00 	mov.b	r14,	0(r15)	;0x0000(r15)
    c08a:	94 53 de ff 	inc	-34(r4)	;0xffde(r4)
    c08e:	1f 44 de ff 	mov	-34(r4),r15	;0xffde(r4)
    c092:	3f 90 0c 00 	cmp	#12,	r15	;#0x000c
    c096:	ed 2b       	jnc	$-36     	;abs 0xc072
    c098:	30 12 9c ca 	push	#-13668	;#0xca9c
    c09c:	b0 12 ea c0 	call	#0xc0ea	
    c0a0:	21 53       	incd	r1		
    c0a2:	e0 3f       	jmp	$-62     	;abs 0xc064

0000c0a4 <delay>:
    c0a4:	04 12       	push	r4		
    c0a6:	04 41       	mov	r1,	r4	
    c0a8:	24 53       	incd	r4		
    c0aa:	21 82       	sub	#4,	r1	;r2 As==10
    c0ac:	84 43 fa ff 	mov	#0,	-6(r4)	;r3 As==00, 0xfffa(r4)
    c0b0:	0b 3c       	jmp	$+24     	;abs 0xc0c8
    c0b2:	84 43 fc ff 	mov	#0,	-4(r4)	;r3 As==00, 0xfffc(r4)
    c0b6:	02 3c       	jmp	$+6      	;abs 0xc0bc
    c0b8:	94 53 fc ff 	inc	-4(r4)		;0xfffc(r4)
    c0bc:	b4 90 7c 00 	cmp	#124,	-4(r4)	;#0x007c, 0xfffc(r4)
    c0c0:	fc ff 
    c0c2:	fa 3b       	jl	$-10     	;abs 0xc0b8
    c0c4:	94 53 fa ff 	inc	-6(r4)		;0xfffa(r4)
    c0c8:	b4 90 ff 00 	cmp	#255,	-6(r4)	;#0x00ff, 0xfffa(r4)
    c0cc:	fa ff 
    c0ce:	f1 3b       	jl	$-28     	;abs 0xc0b2
    c0d0:	21 52       	add	#4,	r1	;r2 As==10
    c0d2:	34 41       	pop	r4		
    c0d4:	30 41       	ret			

0000c0d6 <putchar>:
    c0d6:	04 12       	push	r4		
    c0d8:	04 41       	mov	r1,	r4	
    c0da:	24 53       	incd	r4		
    c0dc:	21 83       	decd	r1		
    c0de:	84 4f fc ff 	mov	r15,	-4(r4)	;0xfffc(r4)
    c0e2:	0f 43       	clr	r15		
    c0e4:	21 53       	incd	r1		
    c0e6:	34 41       	pop	r4		
    c0e8:	30 41       	ret			

0000c0ea <printf>:
    c0ea:	0d 41       	mov	r1,	r13	
    c0ec:	2d 53       	incd	r13		
    c0ee:	3e 4d       	mov	@r13+,	r14	
    c0f0:	3f 40 d6 c0 	mov	#-16170,r15	;#0xc0d6
    c0f4:	b0 12 a0 c2 	call	#0xc2a0	
    c0f8:	30 41       	ret			

0000c0fa <vprintf>:
    c0fa:	0d 4e       	mov	r14,	r13	
    c0fc:	0e 4f       	mov	r15,	r14	
    c0fe:	3f 40 d6 c0 	mov	#-16170,r15	;#0xc0d6
    c102:	b0 12 a0 c2 	call	#0xc2a0	
    c106:	30 41       	ret			

0000c108 <print_field>:
    c108:	0b 12       	push	r11		
    c10a:	0a 12       	push	r10		
    c10c:	09 12       	push	r9		
    c10e:	08 12       	push	r8		
    c110:	07 12       	push	r7		
    c112:	06 12       	push	r6		
    c114:	05 12       	push	r5		
    c116:	04 12       	push	r4		
    c118:	31 82       	sub	#8,	r1	;r2 As==11
    c11a:	08 4f       	mov	r15,	r8	
    c11c:	81 4e 04 00 	mov	r14,	4(r1)	;0x0004(r1)
    c120:	09 4d       	mov	r13,	r9	
    c122:	1f 41 1a 00 	mov	26(r1),	r15	;0x001a(r1)
    c126:	1d 41 1c 00 	mov	28(r1),	r13	;0x001c(r1)
    c12a:	4c 4d       	mov.b	r13,	r12	
    c12c:	04 4d       	mov	r13,	r4	
    c12e:	84 10       	swpb	r4		
    c130:	45 44       	mov.b	r4,	r5	
    c132:	4e 4f       	mov.b	r15,	r14	
    c134:	7e b0 40 00 	bit.b	#64,	r14	;#0x0040
    c138:	11 24       	jz	$+36     	;abs 0xc15c
    c13a:	f1 40 30 00 	mov.b	#48,	0(r1)	;#0x0030, 0x0000(r1)
    c13e:	00 00 
    c140:	0e 4f       	mov	r15,	r14	
    c142:	8e 10       	swpb	r14		
    c144:	5e f3       	and.b	#1,	r14	;r3 As==01
    c146:	03 24       	jz	$+8      	;abs 0xc14e
    c148:	7e 40 58 00 	mov.b	#88,	r14	;#0x0058
    c14c:	02 3c       	jmp	$+6      	;abs 0xc152
    c14e:	7e 40 78 00 	mov.b	#120,	r14	;#0x0078
    c152:	c1 4e 01 00 	mov.b	r14,	1(r1)	;0x0001(r1)
    c156:	0c 41       	mov	r1,	r12	
    c158:	2c 53       	incd	r12		
    c15a:	0f 3c       	jmp	$+32     	;abs 0xc17a
    c15c:	7e f0 20 00 	and.b	#32,	r14	;#0x0020
    c160:	04 24       	jz	$+10     	;abs 0xc16a
    c162:	f1 40 30 00 	mov.b	#48,	0(r1)	;#0x0030, 0x0000(r1)
    c166:	00 00 
    c168:	04 3c       	jmp	$+10     	;abs 0xc172
    c16a:	4c 93       	tst.b	r12		
    c16c:	05 24       	jz	$+12     	;abs 0xc178
    c16e:	c1 4d 00 00 	mov.b	r13,	0(r1)	;0x0000(r1)
    c172:	0c 41       	mov	r1,	r12	
    c174:	1c 53       	inc	r12		
    c176:	01 3c       	jmp	$+4      	;abs 0xc17a
    c178:	0c 41       	mov	r1,	r12	
    c17a:	0a 4c       	mov	r12,	r10	
    c17c:	8c 10       	swpb	r12		
    c17e:	8c 11       	sxt	r12		
    c180:	8c 10       	swpb	r12		
    c182:	8c 11       	sxt	r12		
    c184:	0b 4c       	mov	r12,	r11	
    c186:	06 41       	mov	r1,	r6	
    c188:	0c 41       	mov	r1,	r12	
    c18a:	8c 10       	swpb	r12		
    c18c:	8c 11       	sxt	r12		
    c18e:	8c 10       	swpb	r12		
    c190:	8c 11       	sxt	r12		
    c192:	07 4c       	mov	r12,	r7	
    c194:	0a 86       	sub	r6,	r10	
    c196:	0b 77       	subc	r7,	r11	
    c198:	0e 4f       	mov	r15,	r14	
    c19a:	8e 10       	swpb	r14		
    c19c:	c1 4e 02 00 	mov.b	r14,	2(r1)	;0x0002(r1)
    c1a0:	6e f2       	and.b	#4,	r14	;r2 As==10
    c1a2:	02 24       	jz	$+6      	;abs 0xc1a8
    c1a4:	07 45       	mov	r5,	r7	
    c1a6:	01 3c       	jmp	$+4      	;abs 0xc1aa
    c1a8:	37 43       	mov	#-1,	r7	;r3 As==11
    c1aa:	4f 4f       	mov.b	r15,	r15	
    c1ac:	7f b0 10 00 	bit.b	#16,	r15	;#0x0010
    c1b0:	3c 20       	jnz	$+122    	;abs 0xc22a
    c1b2:	1d 41 04 00 	mov	4(r1),	r13	;0x0004(r1)
    c1b6:	3d 53       	add	#-1,	r13	;r3 As==11
    c1b8:	1d 53       	inc	r13		
    c1ba:	cd 93 00 00 	tst.b	0(r13)		;0x0000(r13)
    c1be:	fc 23       	jnz	$-6      	;abs 0xc1b8
    c1c0:	1d 81 04 00 	sub	4(r1),	r13	;0x0004(r1)
    c1c4:	09 9a       	cmp	r10,	r9	
    c1c6:	02 28       	jnc	$+6      	;abs 0xc1cc
    c1c8:	09 8a       	sub	r10,	r9	
    c1ca:	01 3c       	jmp	$+4      	;abs 0xc1ce
    c1cc:	09 43       	clr	r9		
    c1ce:	e1 b3 02 00 	bit.b	#2,	2(r1)	;r3 As==10, 0x0002(r1)
    c1d2:	05 24       	jz	$+12     	;abs 0xc1de
    c1d4:	09 95       	cmp	r5,	r9	
    c1d6:	02 28       	jnc	$+6      	;abs 0xc1dc
    c1d8:	09 85       	sub	r5,	r9	
    c1da:	01 3c       	jmp	$+4      	;abs 0xc1de
    c1dc:	09 43       	clr	r9		
    c1de:	05 4d       	mov	r13,	r5	
    c1e0:	07 9d       	cmp	r13,	r7	
    c1e2:	01 2c       	jc	$+4      	;abs 0xc1e6
    c1e4:	05 47       	mov	r7,	r5	
    c1e6:	4f 93       	tst.b	r15		
    c1e8:	0d 38       	jl	$+28     	;abs 0xc204
    c1ea:	f1 40 20 00 	mov.b	#32,	6(r1)	;#0x0020, 0x0006(r1)
    c1ee:	06 00 
    c1f0:	06 43       	clr	r6		
    c1f2:	0b 43       	clr	r11		
    c1f4:	0e 3c       	jmp	$+30     	;abs 0xc212
    c1f6:	0f 41       	mov	r1,	r15	
    c1f8:	0f 56       	add	r6,	r15	
    c1fa:	6f 4f       	mov.b	@r15,	r15	
    c1fc:	8f 11       	sxt	r15		
    c1fe:	16 53       	inc	r6		
    c200:	88 12       	call	r8		
    c202:	01 3c       	jmp	$+4      	;abs 0xc206
    c204:	06 43       	clr	r6		
    c206:	06 9a       	cmp	r10,	r6	
    c208:	f6 3b       	jl	$-18     	;abs 0xc1f6
    c20a:	0b 4a       	mov	r10,	r11	
    c20c:	f1 40 30 00 	mov.b	#48,	6(r1)	;#0x0030, 0x0006(r1)
    c210:	06 00 
    c212:	05 8b       	sub	r11,	r5	
    c214:	05 3c       	jmp	$+12     	;abs 0xc220
    c216:	5f 41 06 00 	mov.b	6(r1),	r15	;0x0006(r1)
    c21a:	8f 11       	sxt	r15		
    c21c:	88 12       	call	r8		
    c21e:	1b 53       	inc	r11		
    c220:	0f 45       	mov	r5,	r15	
    c222:	0f 5b       	add	r11,	r15	
    c224:	0f 99       	cmp	r9,	r15	
    c226:	f7 2b       	jnc	$-16     	;abs 0xc216
    c228:	0a 3c       	jmp	$+22     	;abs 0xc23e
    c22a:	06 43       	clr	r6		
    c22c:	0b 43       	clr	r11		
    c22e:	07 3c       	jmp	$+16     	;abs 0xc23e
    c230:	1b 53       	inc	r11		
    c232:	0f 41       	mov	r1,	r15	
    c234:	0f 56       	add	r6,	r15	
    c236:	6f 4f       	mov.b	@r15,	r15	
    c238:	8f 11       	sxt	r15		
    c23a:	16 53       	inc	r6		
    c23c:	88 12       	call	r8		
    c23e:	06 9a       	cmp	r10,	r6	
    c240:	f7 3b       	jl	$-16     	;abs 0xc230
    c242:	e1 b3 02 00 	bit.b	#2,	2(r1)	;r3 As==10, 0x0002(r1)
    c246:	02 24       	jz	$+6      	;abs 0xc24c
    c248:	4a 44       	mov.b	r4,	r10	
    c24a:	08 3c       	jmp	$+18     	;abs 0xc25c
    c24c:	1a 41 04 00 	mov	4(r1),	r10	;0x0004(r1)
    c250:	0a 8b       	sub	r11,	r10	
    c252:	0d 3c       	jmp	$+28     	;abs 0xc26e
    c254:	3f 40 30 00 	mov	#48,	r15	;#0x0030
    c258:	88 12       	call	r8		
    c25a:	7a 53       	add.b	#-1,	r10	;r3 As==11
    c25c:	4a 93       	tst.b	r10		
    c25e:	fa 23       	jnz	$-10     	;abs 0xc254
    c260:	44 44       	mov.b	r4,	r4	
    c262:	0b 54       	add	r4,	r11	
    c264:	f3 3f       	jmp	$-24     	;abs 0xc24c
    c266:	37 53       	add	#-1,	r7	;r3 As==11
    c268:	8f 11       	sxt	r15		
    c26a:	88 12       	call	r8		
    c26c:	1b 53       	inc	r11		
    c26e:	0f 4a       	mov	r10,	r15	
    c270:	0f 5b       	add	r11,	r15	
    c272:	6f 4f       	mov.b	@r15,	r15	
    c274:	4f 93       	tst.b	r15		
    c276:	07 24       	jz	$+16     	;abs 0xc286
    c278:	07 93       	tst	r7		
    c27a:	f5 23       	jnz	$-20     	;abs 0xc266
    c27c:	04 3c       	jmp	$+10     	;abs 0xc286
    c27e:	3f 40 20 00 	mov	#32,	r15	;#0x0020
    c282:	88 12       	call	r8		
    c284:	1b 53       	inc	r11		
    c286:	0b 99       	cmp	r9,	r11	
    c288:	fa 2b       	jnc	$-10     	;abs 0xc27e
    c28a:	0f 4b       	mov	r11,	r15	
    c28c:	31 52       	add	#8,	r1	;r2 As==11
    c28e:	34 41       	pop	r4		
    c290:	35 41       	pop	r5		
    c292:	36 41       	pop	r6		
    c294:	37 41       	pop	r7		
    c296:	38 41       	pop	r8		
    c298:	39 41       	pop	r9		
    c29a:	3a 41       	pop	r10		
    c29c:	3b 41       	pop	r11		
    c29e:	30 41       	ret			

0000c2a0 <vuprintf>:
    c2a0:	0b 12       	push	r11		
    c2a2:	0a 12       	push	r10		
    c2a4:	09 12       	push	r9		
    c2a6:	08 12       	push	r8		
    c2a8:	07 12       	push	r7		
    c2aa:	06 12       	push	r6		
    c2ac:	05 12       	push	r5		
    c2ae:	04 12       	push	r4		
    c2b0:	31 50 b6 ff 	add	#-74,	r1	;#0xffb6
    c2b4:	81 4f 3a 00 	mov	r15,	58(r1)	;0x003a(r1)
    c2b8:	06 4e       	mov	r14,	r6	
    c2ba:	05 4d       	mov	r13,	r5	
    c2bc:	81 4e 3e 00 	mov	r14,	62(r1)	;0x003e(r1)
    c2c0:	c1 43 2f 00 	mov.b	#0,	47(r1)	;r3 As==00, 0x002f(r1)
    c2c4:	c1 43 2b 00 	mov.b	#0,	43(r1)	;r3 As==00, 0x002b(r1)
    c2c8:	c1 43 2e 00 	mov.b	#0,	46(r1)	;r3 As==00, 0x002e(r1)
    c2cc:	c1 43 2a 00 	mov.b	#0,	42(r1)	;r3 As==00, 0x002a(r1)
    c2d0:	81 43 30 00 	mov	#0,	48(r1)	;r3 As==00, 0x0030(r1)
    c2d4:	81 43 26 00 	mov	#0,	38(r1)	;r3 As==00, 0x0026(r1)
    c2d8:	07 43       	clr	r7		
    c2da:	81 43 2c 00 	mov	#0,	44(r1)	;r3 As==00, 0x002c(r1)
    c2de:	0e 41       	mov	r1,	r14	
    c2e0:	3e 50 1c 00 	add	#28,	r14	;#0x001c
    c2e4:	81 4e 1c 00 	mov	r14,	28(r1)	;0x001c(r1)
    c2e8:	30 40 1a c9 	br	#0xc91a	
    c2ec:	0f 46       	mov	r6,	r15	
    c2ee:	1f 53       	inc	r15		
    c2f0:	81 4f 40 00 	mov	r15,	64(r1)	;0x0040(r1)
    c2f4:	07 93       	tst	r7		
    c2f6:	1e 20       	jnz	$+62     	;abs 0xc334
    c2f8:	7e 90 25 00 	cmp.b	#37,	r14	;#0x0025
    c2fc:	13 20       	jnz	$+40     	;abs 0xc324
    c2fe:	81 43 00 00 	mov	#0,	0(r1)	;r3 As==00, 0x0000(r1)
    c302:	81 43 02 00 	mov	#0,	2(r1)	;r3 As==00, 0x0002(r1)
    c306:	81 46 3e 00 	mov	r6,	62(r1)	;0x003e(r1)
    c30a:	c1 43 2f 00 	mov.b	#0,	47(r1)	;r3 As==00, 0x002f(r1)
    c30e:	c1 43 2b 00 	mov.b	#0,	43(r1)	;r3 As==00, 0x002b(r1)
    c312:	c1 43 2e 00 	mov.b	#0,	46(r1)	;r3 As==00, 0x002e(r1)
    c316:	c1 43 2a 00 	mov.b	#0,	42(r1)	;r3 As==00, 0x002a(r1)
    c31a:	81 43 30 00 	mov	#0,	48(r1)	;r3 As==00, 0x0030(r1)
    c31e:	30 40 10 c9 	br	#0xc910	
    c322:	05 47       	mov	r7,	r5	
    c324:	8e 11       	sxt	r14		
    c326:	0f 4e       	mov	r14,	r15	
    c328:	91 12 3c 00 	call	60(r1)		;0x003c(r1)
    c32c:	91 53 2c 00 	inc	44(r1)		;0x002c(r1)
    c330:	30 40 f6 c8 	br	#0xc8f6	
    c334:	7e 90 63 00 	cmp.b	#99,	r14	;#0x0063
    c338:	c5 24       	jz	$+396    	;abs 0xc4c4
    c33a:	7e 90 64 00 	cmp.b	#100,	r14	;#0x0064
    c33e:	27 34       	jge	$+80     	;abs 0xc38e
    c340:	7e 90 30 00 	cmp.b	#48,	r14	;#0x0030
    c344:	94 24       	jz	$+298    	;abs 0xc46e
    c346:	7e 90 31 00 	cmp.b	#49,	r14	;#0x0031
    c34a:	1a 34       	jge	$+54     	;abs 0xc380
    c34c:	7e 90 2a 00 	cmp.b	#42,	r14	;#0x002a
    c350:	77 24       	jz	$+240    	;abs 0xc440
    c352:	7e 90 2b 00 	cmp.b	#43,	r14	;#0x002b
    c356:	0a 34       	jge	$+22     	;abs 0xc36c
    c358:	7e 90 23 00 	cmp.b	#35,	r14	;#0x0023
    c35c:	42 24       	jz	$+134    	;abs 0xc3e2
    c35e:	7e 90 25 00 	cmp.b	#37,	r14	;#0x0025
    c362:	e0 27       	jz	$-62     	;abs 0xc324
    c364:	7e 90 20 00 	cmp.b	#32,	r14	;#0x0020
    c368:	32 20       	jnz	$+102    	;abs 0xc3ce
    c36a:	56 3c       	jmp	$+174    	;abs 0xc418
    c36c:	7e 90 2d 00 	cmp.b	#45,	r14	;#0x002d
    c370:	49 24       	jz	$+148    	;abs 0xc404
    c372:	7e 90 2e 00 	cmp.b	#46,	r14	;#0x002e
    c376:	5b 24       	jz	$+184    	;abs 0xc42e
    c378:	7e 90 2b 00 	cmp.b	#43,	r14	;#0x002b
    c37c:	28 20       	jnz	$+82     	;abs 0xc3ce
    c37e:	47 3c       	jmp	$+144    	;abs 0xc40e
    c380:	7e 90 3a 00 	cmp.b	#58,	r14	;#0x003a
    c384:	8c 38       	jl	$+282    	;abs 0xc49e
    c386:	7e 90 58 00 	cmp.b	#88,	r14	;#0x0058
    c38a:	21 20       	jnz	$+68     	;abs 0xc3ce
    c38c:	e9 3c       	jmp	$+468    	;abs 0xc560
    c38e:	7e 90 6f 00 	cmp.b	#111,	r14	;#0x006f
    c392:	24 24       	jz	$+74     	;abs 0xc3dc
    c394:	7e 90 70 00 	cmp.b	#112,	r14	;#0x0070
    c398:	0a 34       	jge	$+22     	;abs 0xc3ae
    c39a:	7e 90 69 00 	cmp.b	#105,	r14	;#0x0069
    c39e:	e3 24       	jz	$+456    	;abs 0xc566
    c3a0:	7e 90 6c 00 	cmp.b	#108,	r14	;#0x006c
    c3a4:	22 24       	jz	$+70     	;abs 0xc3ea
    c3a6:	7e 90 64 00 	cmp.b	#100,	r14	;#0x0064
    c3aa:	11 20       	jnz	$+36     	;abs 0xc3ce
    c3ac:	dc 3c       	jmp	$+442    	;abs 0xc566
    c3ae:	7e 90 73 00 	cmp.b	#115,	r14	;#0x0073
    c3b2:	98 24       	jz	$+306    	;abs 0xc4e4
    c3b4:	7e 90 74 00 	cmp.b	#116,	r14	;#0x0074
    c3b8:	04 34       	jge	$+10     	;abs 0xc3c2
    c3ba:	7e 90 70 00 	cmp.b	#112,	r14	;#0x0070
    c3be:	07 20       	jnz	$+16     	;abs 0xc3ce
    c3c0:	b8 3c       	jmp	$+370    	;abs 0xc532
    c3c2:	7e 90 75 00 	cmp.b	#117,	r14	;#0x0075
    c3c6:	d1 24       	jz	$+420    	;abs 0xc56a
    c3c8:	7e 90 78 00 	cmp.b	#120,	r14	;#0x0078
    c3cc:	d2 24       	jz	$+422    	;abs 0xc572
    c3ce:	19 41 3e 00 	mov	62(r1),	r9	;0x003e(r1)
    c3d2:	18 41 2c 00 	mov	44(r1),	r8	;0x002c(r1)
    c3d6:	08 89       	sub	r9,	r8	
    c3d8:	30 40 e4 c8 	br	#0xc8e4	
    c3dc:	b1 42 28 00 	mov	#8,	40(r1)	;r2 As==11, 0x0028(r1)
    c3e0:	cb 3c       	jmp	$+408    	;abs 0xc578
    c3e2:	f1 d2 00 00 	bis.b	#8,	0(r1)	;r2 As==11, 0x0000(r1)
    c3e6:	30 40 14 c9 	br	#0xc914	
    c3ea:	69 41       	mov.b	@r1,	r9	
    c3ec:	59 f3       	and.b	#1,	r9	;r3 As==01
    c3ee:	6e 41       	mov.b	@r1,	r14	
    c3f0:	04 24       	jz	$+10     	;abs 0xc3fa
    c3f2:	7e f0 fe ff 	and.b	#-2,	r14	;#0xfffe
    c3f6:	6e d3       	bis.b	#2,	r14	;r3 As==10
    c3f8:	01 3c       	jmp	$+4      	;abs 0xc3fc
    c3fa:	5e d3       	bis.b	#1,	r14	;r3 As==01
    c3fc:	c1 4e 00 00 	mov.b	r14,	0(r1)	;0x0000(r1)
    c400:	30 40 14 c9 	br	#0xc914	
    c404:	f1 d0 10 00 	bis.b	#16,	0(r1)	;#0x0010, 0x0000(r1)
    c408:	00 00 
    c40a:	30 40 14 c9 	br	#0xc914	
    c40e:	f1 40 2b 00 	mov.b	#43,	2(r1)	;#0x002b, 0x0002(r1)
    c412:	02 00 
    c414:	30 40 14 c9 	br	#0xc914	
    c418:	f1 90 2b 00 	cmp.b	#43,	2(r1)	;#0x002b, 0x0002(r1)
    c41c:	02 00 
    c41e:	02 20       	jnz	$+6      	;abs 0xc424
    c420:	30 40 14 c9 	br	#0xc914	
    c424:	f1 40 20 00 	mov.b	#32,	2(r1)	;#0x0020, 0x0002(r1)
    c428:	02 00 
    c42a:	30 40 14 c9 	br	#0xc914	
    c42e:	c1 93 2a 00 	tst.b	42(r1)		;0x002a(r1)
    c432:	02 24       	jz	$+6      	;abs 0xc438
    c434:	30 40 fa c8 	br	#0xc8fa	
    c438:	d1 43 2e 00 	mov.b	#1,	46(r1)	;r3 As==01, 0x002e(r1)
    c43c:	30 40 14 c9 	br	#0xc914	
    c440:	0e 45       	mov	r5,	r14	
    c442:	2e 53       	incd	r14		
    c444:	2a 45       	mov	@r5,	r10	
    c446:	0a 93       	tst	r10		
    c448:	03 38       	jl	$+8      	;abs 0xc450
    c44a:	81 4a 26 00 	mov	r10,	38(r1)	;0x0026(r1)
    c44e:	0d 3c       	jmp	$+28     	;abs 0xc46a
    c450:	c1 93 2e 00 	tst.b	46(r1)		;0x002e(r1)
    c454:	02 24       	jz	$+6      	;abs 0xc45a
    c456:	30 40 0a c9 	br	#0xc90a	
    c45a:	f1 d0 10 00 	bis.b	#16,	0(r1)	;#0x0010, 0x0000(r1)
    c45e:	00 00 
    c460:	3a e3       	inv	r10		
    c462:	81 4a 26 00 	mov	r10,	38(r1)	;0x0026(r1)
    c466:	91 53 26 00 	inc	38(r1)		;0x0026(r1)
    c46a:	05 4e       	mov	r14,	r5	
    c46c:	27 3c       	jmp	$+80     	;abs 0xc4bc
    c46e:	81 93 26 00 	tst	38(r1)		;0x0026(r1)
    c472:	15 20       	jnz	$+44     	;abs 0xc49e
    c474:	c1 93 2e 00 	tst.b	46(r1)		;0x002e(r1)
    c478:	12 20       	jnz	$+38     	;abs 0xc49e
    c47a:	69 41       	mov.b	@r1,	r9	
    c47c:	79 f0 10 00 	and.b	#16,	r9	;#0x0010
    c480:	5e 43       	mov.b	#1,	r14	;r3 As==01
    c482:	01 24       	jz	$+4      	;abs 0xc486
    c484:	4e 43       	clr.b	r14		
    c486:	4e 4e       	mov.b	r14,	r14	
    c488:	0e 11       	rra	r14		
    c48a:	0e 43       	clr	r14		
    c48c:	4e 10       	rrc.b	r14		
    c48e:	6a 41       	mov.b	@r1,	r10	
    c490:	7a f0 7f 00 	and.b	#127,	r10	;#0x007f
    c494:	4a de       	bis.b	r14,	r10	
    c496:	c1 4a 00 00 	mov.b	r10,	0(r1)	;0x0000(r1)
    c49a:	30 40 14 c9 	br	#0xc914	
    c49e:	1a 41 26 00 	mov	38(r1),	r10	;0x0026(r1)
    c4a2:	0a 5a       	rla	r10		
    c4a4:	0c 4a       	mov	r10,	r12	
    c4a6:	0c 5c       	rla	r12		
    c4a8:	0c 5c       	rla	r12		
    c4aa:	0a 5c       	add	r12,	r10	
    c4ac:	81 4a 26 00 	mov	r10,	38(r1)	;0x0026(r1)
    c4b0:	b1 50 d0 ff 	add	#-48,	38(r1)	;#0xffd0, 0x0026(r1)
    c4b4:	26 00 
    c4b6:	8e 11       	sxt	r14		
    c4b8:	81 5e 26 00 	add	r14,	38(r1)	;0x0026(r1)
    c4bc:	d1 43 2a 00 	mov.b	#1,	42(r1)	;r3 As==01, 0x002a(r1)
    c4c0:	30 40 14 c9 	br	#0xc914	
    c4c4:	07 45       	mov	r5,	r7	
    c4c6:	27 53       	incd	r7		
    c4c8:	6e 45       	mov.b	@r5,	r14	
    c4ca:	c1 93 2e 00 	tst.b	46(r1)		;0x002e(r1)
    c4ce:	03 20       	jnz	$+8      	;abs 0xc4d6
    c4d0:	c1 93 2a 00 	tst.b	42(r1)		;0x002a(r1)
    c4d4:	26 27       	jz	$-434    	;abs 0xc322
    c4d6:	c1 4e 04 00 	mov.b	r14,	4(r1)	;0x0004(r1)
    c4da:	c1 43 05 00 	mov.b	#0,	5(r1)	;r3 As==00, 0x0005(r1)
    c4de:	0e 41       	mov	r1,	r14	
    c4e0:	2e 52       	add	#4,	r14	;r2 As==10
    c4e2:	03 3c       	jmp	$+8      	;abs 0xc4ea
    c4e4:	07 45       	mov	r5,	r7	
    c4e6:	27 53       	incd	r7		
    c4e8:	2e 45       	mov	@r5,	r14	
    c4ea:	c1 93 2e 00 	tst.b	46(r1)		;0x002e(r1)
    c4ee:	07 24       	jz	$+16     	;abs 0xc4fe
    c4f0:	e1 d2 01 00 	bis.b	#4,	1(r1)	;r2 As==10, 0x0001(r1)
    c4f4:	1f 41 26 00 	mov	38(r1),	r15	;0x0026(r1)
    c4f8:	c1 4f 03 00 	mov.b	r15,	3(r1)	;0x0003(r1)
    c4fc:	06 3c       	jmp	$+14     	;abs 0xc50a
    c4fe:	c1 93 2a 00 	tst.b	42(r1)		;0x002a(r1)
    c502:	03 24       	jz	$+8      	;abs 0xc50a
    c504:	91 41 26 00 	mov	38(r1),	48(r1)	;0x0026(r1), 0x0030(r1)
    c508:	30 00 
    c50a:	0e 93       	tst	r14		
    c50c:	02 20       	jnz	$+6      	;abs 0xc512
    c50e:	3e 40 a8 ca 	mov	#-13656,r14	;#0xcaa8
    c512:	11 12 04 00 	push	4(r1)		;0x0004(r1)
    c516:	11 12 04 00 	push	4(r1)		;0x0004(r1)
    c51a:	1d 41 34 00 	mov	52(r1),	r13	;0x0034(r1)
    c51e:	1f 41 3e 00 	mov	62(r1),	r15	;0x003e(r1)
    c522:	b0 12 08 c1 	call	#0xc108	
    c526:	21 52       	add	#4,	r1	;r2 As==10
    c528:	81 5f 2c 00 	add	r15,	44(r1)	;0x002c(r1)
    c52c:	05 47       	mov	r7,	r5	
    c52e:	30 40 f6 c8 	br	#0xc8f6	
    c532:	07 45       	mov	r5,	r7	
    c534:	27 53       	incd	r7		
    c536:	29 45       	mov	@r5,	r9	
    c538:	81 49 1e 00 	mov	r9,	30(r1)	;0x001e(r1)
    c53c:	5e 43       	mov.b	#1,	r14	;r3 As==01
    c53e:	09 93       	tst	r9		
    c540:	01 20       	jnz	$+4      	;abs 0xc544
    c542:	4e 43       	clr.b	r14		
    c544:	4e 5e       	rla.b	r14		
    c546:	4e 5e       	rla.b	r14		
    c548:	4e 5e       	rla.b	r14		
    c54a:	6a 41       	mov.b	@r1,	r10	
    c54c:	7a f0 f7 ff 	and.b	#-9,	r10	;#0xfff7
    c550:	4a de       	bis.b	r14,	r10	
    c552:	c1 4a 00 00 	mov.b	r10,	0(r1)	;0x0000(r1)
    c556:	05 47       	mov	r7,	r5	
    c558:	b1 40 10 00 	mov	#16,	40(r1)	;#0x0010, 0x0028(r1)
    c55c:	28 00 
    c55e:	53 3c       	jmp	$+168    	;abs 0xc606
    c560:	d1 d3 01 00 	bis.b	#1,	1(r1)	;r3 As==01, 0x0001(r1)
    c564:	06 3c       	jmp	$+14     	;abs 0xc572
    c566:	e1 d2 00 00 	bis.b	#4,	0(r1)	;r2 As==10, 0x0000(r1)
    c56a:	b1 40 0a 00 	mov	#10,	40(r1)	;#0x000a, 0x0028(r1)
    c56e:	28 00 
    c570:	03 3c       	jmp	$+8      	;abs 0xc578
    c572:	b1 40 10 00 	mov	#16,	40(r1)	;#0x0010, 0x0028(r1)
    c576:	28 00 
    c578:	6b 41       	mov.b	@r1,	r11	
    c57a:	6b b3       	bit.b	#2,	r11	;r3 As==10
    c57c:	24 24       	jz	$+74     	;abs 0xc5c6
    c57e:	0c 45       	mov	r5,	r12	
    c580:	3c 52       	add	#8,	r12	;r2 As==11
    c582:	28 45       	mov	@r5,	r8	
    c584:	17 45 02 00 	mov	2(r5),	r7	;0x0002(r5)
    c588:	16 45 04 00 	mov	4(r5),	r6	;0x0004(r5)
    c58c:	1b 45 06 00 	mov	6(r5),	r11	;0x0006(r5)
    c590:	81 48 1e 00 	mov	r8,	30(r1)	;0x001e(r1)
    c594:	81 47 20 00 	mov	r7,	32(r1)	;0x0020(r1)
    c598:	81 46 22 00 	mov	r6,	34(r1)	;0x0022(r1)
    c59c:	81 4b 24 00 	mov	r11,	36(r1)	;0x0024(r1)
    c5a0:	d1 43 2b 00 	mov.b	#1,	43(r1)	;r3 As==01, 0x002b(r1)
    c5a4:	08 93       	tst	r8		
    c5a6:	06 20       	jnz	$+14     	;abs 0xc5b4
    c5a8:	07 93       	tst	r7		
    c5aa:	04 20       	jnz	$+10     	;abs 0xc5b4
    c5ac:	06 93       	tst	r6		
    c5ae:	02 20       	jnz	$+6      	;abs 0xc5b4
    c5b0:	0b 93       	tst	r11		
    c5b2:	02 24       	jz	$+6      	;abs 0xc5b8
    c5b4:	c1 43 2b 00 	mov.b	#0,	43(r1)	;r3 As==00, 0x002b(r1)
    c5b8:	0b 5b       	rla	r11		
    c5ba:	0b 43       	clr	r11		
    c5bc:	0b 6b       	rlc	r11		
    c5be:	c1 4b 2f 00 	mov.b	r11,	47(r1)	;0x002f(r1)
    c5c2:	05 4c       	mov	r12,	r5	
    c5c4:	20 3c       	jmp	$+66     	;abs 0xc606
    c5c6:	5b f3       	and.b	#1,	r11	;r3 As==01
    c5c8:	07 45       	mov	r5,	r7	
    c5ca:	0d 24       	jz	$+28     	;abs 0xc5e6
    c5cc:	27 52       	add	#4,	r7	;r2 As==10
    c5ce:	28 45       	mov	@r5,	r8	
    c5d0:	1b 45 02 00 	mov	2(r5),	r11	;0x0002(r5)
    c5d4:	81 48 1e 00 	mov	r8,	30(r1)	;0x001e(r1)
    c5d8:	81 4b 20 00 	mov	r11,	32(r1)	;0x0020(r1)
    c5dc:	d1 43 2b 00 	mov.b	#1,	43(r1)	;r3 As==01, 0x002b(r1)
    c5e0:	08 93       	tst	r8		
    c5e2:	09 20       	jnz	$+20     	;abs 0xc5f6
    c5e4:	06 3c       	jmp	$+14     	;abs 0xc5f2
    c5e6:	27 53       	incd	r7		
    c5e8:	2b 45       	mov	@r5,	r11	
    c5ea:	81 4b 1e 00 	mov	r11,	30(r1)	;0x001e(r1)
    c5ee:	d1 43 2b 00 	mov.b	#1,	43(r1)	;r3 As==01, 0x002b(r1)
    c5f2:	0b 93       	tst	r11		
    c5f4:	02 24       	jz	$+6      	;abs 0xc5fa
    c5f6:	c1 43 2b 00 	mov.b	#0,	43(r1)	;r3 As==00, 0x002b(r1)
    c5fa:	0b 5b       	rla	r11		
    c5fc:	0b 43       	clr	r11		
    c5fe:	0b 6b       	rlc	r11		
    c600:	c1 4b 2f 00 	mov.b	r11,	47(r1)	;0x002f(r1)
    c604:	05 47       	mov	r7,	r5	
    c606:	f1 b2 00 00 	bit.b	#8,	0(r1)	;r2 As==11, 0x0000(r1)
    c60a:	12 24       	jz	$+38     	;abs 0xc630
    c60c:	c1 93 2b 00 	tst.b	43(r1)		;0x002b(r1)
    c610:	0f 20       	jnz	$+32     	;abs 0xc630
    c612:	68 41       	mov.b	@r1,	r8	
    c614:	b1 90 10 00 	cmp	#16,	40(r1)	;#0x0010, 0x0028(r1)
    c618:	28 00 
    c61a:	03 20       	jnz	$+8      	;abs 0xc622
    c61c:	78 d0 40 00 	bis.b	#64,	r8	;#0x0040
    c620:	05 3c       	jmp	$+12     	;abs 0xc62c
    c622:	b1 92 28 00 	cmp	#8,	40(r1)	;r2 As==11, 0x0028(r1)
    c626:	04 20       	jnz	$+10     	;abs 0xc630
    c628:	78 d0 20 00 	bis.b	#32,	r8	;#0x0020
    c62c:	c1 48 00 00 	mov.b	r8,	0(r1)	;0x0000(r1)
    c630:	68 41       	mov.b	@r1,	r8	
    c632:	68 b2       	bit.b	#4,	r8	;r2 As==10
    c634:	30 24       	jz	$+98     	;abs 0xc696
    c636:	c1 93 2f 00 	tst.b	47(r1)		;0x002f(r1)
    c63a:	2d 24       	jz	$+92     	;abs 0xc696
    c63c:	f1 40 2d 00 	mov.b	#45,	2(r1)	;#0x002d, 0x0002(r1)
    c640:	02 00 
    c642:	68 b3       	bit.b	#2,	r8	;r3 As==10
    c644:	11 24       	jz	$+36     	;abs 0xc668
    c646:	b1 e3 1e 00 	xor	#-1,	30(r1)	;r3 As==11, 0x001e(r1)
    c64a:	b1 e3 20 00 	xor	#-1,	32(r1)	;r3 As==11, 0x0020(r1)
    c64e:	b1 e3 22 00 	xor	#-1,	34(r1)	;r3 As==11, 0x0022(r1)
    c652:	b1 e3 24 00 	xor	#-1,	36(r1)	;r3 As==11, 0x0024(r1)
    c656:	91 53 1e 00 	inc	30(r1)		;0x001e(r1)
    c65a:	81 63 20 00 	adc	32(r1)		;0x0020(r1)
    c65e:	81 63 22 00 	adc	34(r1)		;0x0022(r1)
    c662:	81 63 24 00 	adc	36(r1)		;0x0024(r1)
    c666:	17 3c       	jmp	$+48     	;abs 0xc696
    c668:	58 b3       	bit.b	#1,	r8	;r3 As==01
    c66a:	0f 24       	jz	$+32     	;abs 0xc68a
    c66c:	1a 41 1e 00 	mov	30(r1),	r10	;0x001e(r1)
    c670:	1b 41 20 00 	mov	32(r1),	r11	;0x0020(r1)
    c674:	3a e3       	inv	r10		
    c676:	3b e3       	inv	r11		
    c678:	0e 4a       	mov	r10,	r14	
    c67a:	0f 4b       	mov	r11,	r15	
    c67c:	1e 53       	inc	r14		
    c67e:	0f 63       	adc	r15		
    c680:	81 4e 1e 00 	mov	r14,	30(r1)	;0x001e(r1)
    c684:	81 4f 20 00 	mov	r15,	32(r1)	;0x0020(r1)
    c688:	06 3c       	jmp	$+14     	;abs 0xc696
    c68a:	1a 41 1e 00 	mov	30(r1),	r10	;0x001e(r1)
    c68e:	3a e3       	inv	r10		
    c690:	1a 53       	inc	r10		
    c692:	81 4a 1e 00 	mov	r10,	30(r1)	;0x001e(r1)
    c696:	c1 43 1b 00 	mov.b	#0,	27(r1)	;r3 As==00, 0x001b(r1)
    c69a:	68 b3       	bit.b	#2,	r8	;r3 As==10
    c69c:	6a 24       	jz	$+214    	;abs 0xc772
    c69e:	16 41 1e 00 	mov	30(r1),	r6	;0x001e(r1)
    c6a2:	91 41 20 00 	mov	32(r1),	60(r1)	;0x0020(r1), 0x003c(r1)
    c6a6:	3c 00 
    c6a8:	18 41 22 00 	mov	34(r1),	r8	;0x0022(r1)
    c6ac:	14 41 24 00 	mov	36(r1),	r4	;0x0024(r1)
    c6b0:	07 41       	mov	r1,	r7	
    c6b2:	37 50 1a 00 	add	#26,	r7	;#0x001a
    c6b6:	09 46       	mov	r6,	r9	
    c6b8:	91 41 28 00 	mov	40(r1),	50(r1)	;0x0028(r1), 0x0032(r1)
    c6bc:	32 00 
    c6be:	1b 41 28 00 	mov	40(r1),	r11	;0x0028(r1)
    c6c2:	8b 10       	swpb	r11		
    c6c4:	8b 11       	sxt	r11		
    c6c6:	8b 10       	swpb	r11		
    c6c8:	8b 11       	sxt	r11		
    c6ca:	81 4b 34 00 	mov	r11,	52(r1)	;0x0034(r1)
    c6ce:	81 4b 36 00 	mov	r11,	54(r1)	;0x0036(r1)
    c6d2:	81 4b 38 00 	mov	r11,	56(r1)	;0x0038(r1)
    c6d6:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c6da:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c6de:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c6e2:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c6e6:	0c 49       	mov	r9,	r12	
    c6e8:	1d 41 44 00 	mov	68(r1),	r13	;0x0044(r1)
    c6ec:	0e 48       	mov	r8,	r14	
    c6ee:	0f 44       	mov	r4,	r15	
    c6f0:	b0 12 24 ca 	call	#0xca24	
    c6f4:	31 52       	add	#8,	r1	;r2 As==11
    c6f6:	0b 4c       	mov	r12,	r11	
    c6f8:	3c 90 0a 00 	cmp	#10,	r12	;#0x000a
    c6fc:	05 34       	jge	$+12     	;abs 0xc708
    c6fe:	7b 50 30 00 	add.b	#48,	r11	;#0x0030
    c702:	c7 4b 00 00 	mov.b	r11,	0(r7)	;0x0000(r7)
    c706:	0c 3c       	jmp	$+26     	;abs 0xc720
    c708:	4b 4c       	mov.b	r12,	r11	
    c70a:	d1 b3 01 00 	bit.b	#1,	1(r1)	;r3 As==01, 0x0001(r1)
    c70e:	03 24       	jz	$+8      	;abs 0xc716
    c710:	7a 40 37 00 	mov.b	#55,	r10	;#0x0037
    c714:	02 3c       	jmp	$+6      	;abs 0xc71a
    c716:	7a 40 57 00 	mov.b	#87,	r10	;#0x0057
    c71a:	4a 5b       	add.b	r11,	r10	
    c71c:	c7 4a 00 00 	mov.b	r10,	0(r7)	;0x0000(r7)
    c720:	06 47       	mov	r7,	r6	
    c722:	36 53       	add	#-1,	r6	;r3 As==11
    c724:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c728:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c72c:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c730:	11 12 3a 00 	push	58(r1)		;0x003a(r1)
    c734:	0c 49       	mov	r9,	r12	
    c736:	1d 41 44 00 	mov	68(r1),	r13	;0x0044(r1)
    c73a:	0e 48       	mov	r8,	r14	
    c73c:	0f 44       	mov	r4,	r15	
    c73e:	b0 12 fe c9 	call	#0xc9fe	
    c742:	31 52       	add	#8,	r1	;r2 As==11
    c744:	09 4c       	mov	r12,	r9	
    c746:	81 4d 3c 00 	mov	r13,	60(r1)	;0x003c(r1)
    c74a:	08 4e       	mov	r14,	r8	
    c74c:	04 4f       	mov	r15,	r4	
    c74e:	37 53       	add	#-1,	r7	;r3 As==11
    c750:	0c 93       	tst	r12		
    c752:	b2 23       	jnz	$-154    	;abs 0xc6b8
    c754:	0d 93       	tst	r13		
    c756:	b0 23       	jnz	$-158    	;abs 0xc6b8
    c758:	0e 93       	tst	r14		
    c75a:	ae 23       	jnz	$-162    	;abs 0xc6b8
    c75c:	0f 93       	tst	r15		
    c75e:	ac 23       	jnz	$-166    	;abs 0xc6b8
    c760:	81 43 1e 00 	mov	#0,	30(r1)	;r3 As==00, 0x001e(r1)
    c764:	81 43 20 00 	mov	#0,	32(r1)	;r3 As==00, 0x0020(r1)
    c768:	81 43 22 00 	mov	#0,	34(r1)	;r3 As==00, 0x0022(r1)
    c76c:	81 43 24 00 	mov	#0,	36(r1)	;r3 As==00, 0x0024(r1)
    c770:	6c 3c       	jmp	$+218    	;abs 0xc84a
    c772:	58 b3       	bit.b	#1,	r8	;r3 As==01
    c774:	3e 24       	jz	$+126    	;abs 0xc7f2
    c776:	14 41 1e 00 	mov	30(r1),	r4	;0x001e(r1)
    c77a:	17 41 20 00 	mov	32(r1),	r7	;0x0020(r1)
    c77e:	08 41       	mov	r1,	r8	
    c780:	38 50 1a 00 	add	#26,	r8	;#0x001a
    c784:	19 41 28 00 	mov	40(r1),	r9	;0x0028(r1)
    c788:	89 10       	swpb	r9		
    c78a:	89 11       	sxt	r9		
    c78c:	89 10       	swpb	r9		
    c78e:	89 11       	sxt	r9		
    c790:	1c 41 28 00 	mov	40(r1),	r12	;0x0028(r1)
    c794:	0d 49       	mov	r9,	r13	
    c796:	0e 44       	mov	r4,	r14	
    c798:	0f 47       	mov	r7,	r15	
    c79a:	b0 12 96 c9 	call	#0xc996	
    c79e:	0b 4e       	mov	r14,	r11	
    c7a0:	3e 90 0a 00 	cmp	#10,	r14	;#0x000a
    c7a4:	05 34       	jge	$+12     	;abs 0xc7b0
    c7a6:	7b 50 30 00 	add.b	#48,	r11	;#0x0030
    c7aa:	c8 4b 00 00 	mov.b	r11,	0(r8)	;0x0000(r8)
    c7ae:	0c 3c       	jmp	$+26     	;abs 0xc7c8
    c7b0:	4b 4e       	mov.b	r14,	r11	
    c7b2:	d1 b3 01 00 	bit.b	#1,	1(r1)	;r3 As==01, 0x0001(r1)
    c7b6:	03 24       	jz	$+8      	;abs 0xc7be
    c7b8:	7a 40 37 00 	mov.b	#55,	r10	;#0x0037
    c7bc:	02 3c       	jmp	$+6      	;abs 0xc7c2
    c7be:	7a 40 57 00 	mov.b	#87,	r10	;#0x0057
    c7c2:	4a 5b       	add.b	r11,	r10	
    c7c4:	c8 4a 00 00 	mov.b	r10,	0(r8)	;0x0000(r8)
    c7c8:	06 48       	mov	r8,	r6	
    c7ca:	36 53       	add	#-1,	r6	;r3 As==11
    c7cc:	1c 41 28 00 	mov	40(r1),	r12	;0x0028(r1)
    c7d0:	0d 49       	mov	r9,	r13	
    c7d2:	0e 44       	mov	r4,	r14	
    c7d4:	0f 47       	mov	r7,	r15	
    c7d6:	b0 12 60 c9 	call	#0xc960	
    c7da:	04 4e       	mov	r14,	r4	
    c7dc:	07 4f       	mov	r15,	r7	
    c7de:	38 53       	add	#-1,	r8	;r3 As==11
    c7e0:	0e 93       	tst	r14		
    c7e2:	d0 23       	jnz	$-94     	;abs 0xc784
    c7e4:	0f 93       	tst	r15		
    c7e6:	ce 23       	jnz	$-98     	;abs 0xc784
    c7e8:	81 43 1e 00 	mov	#0,	30(r1)	;r3 As==00, 0x001e(r1)
    c7ec:	81 43 20 00 	mov	#0,	32(r1)	;r3 As==00, 0x0020(r1)
    c7f0:	2c 3c       	jmp	$+90     	;abs 0xc84a
    c7f2:	17 41 1e 00 	mov	30(r1),	r7	;0x001e(r1)
    c7f6:	08 41       	mov	r1,	r8	
    c7f8:	38 50 1a 00 	add	#26,	r8	;#0x001a
    c7fc:	1e 41 28 00 	mov	40(r1),	r14	;0x0028(r1)
    c800:	0f 47       	mov	r7,	r15	
    c802:	b0 12 58 c9 	call	#0xc958	
    c806:	0d 4f       	mov	r15,	r13	
    c808:	3f 90 0a 00 	cmp	#10,	r15	;#0x000a
    c80c:	05 34       	jge	$+12     	;abs 0xc818
    c80e:	7d 50 30 00 	add.b	#48,	r13	;#0x0030
    c812:	c8 4d 00 00 	mov.b	r13,	0(r8)	;0x0000(r8)
    c816:	0c 3c       	jmp	$+26     	;abs 0xc830
    c818:	4d 4f       	mov.b	r15,	r13	
    c81a:	d1 b3 01 00 	bit.b	#1,	1(r1)	;r3 As==01, 0x0001(r1)
    c81e:	03 24       	jz	$+8      	;abs 0xc826
    c820:	7c 40 37 00 	mov.b	#55,	r12	;#0x0037
    c824:	02 3c       	jmp	$+6      	;abs 0xc82a
    c826:	7c 40 57 00 	mov.b	#87,	r12	;#0x0057
    c82a:	4c 5d       	add.b	r13,	r12	
    c82c:	c8 4c 00 00 	mov.b	r12,	0(r8)	;0x0000(r8)
    c830:	06 48       	mov	r8,	r6	
    c832:	36 53       	add	#-1,	r6	;r3 As==11
    c834:	1e 41 28 00 	mov	40(r1),	r14	;0x0028(r1)
    c838:	0f 47       	mov	r7,	r15	
    c83a:	b0 12 3e c9 	call	#0xc93e	
    c83e:	07 4f       	mov	r15,	r7	
    c840:	38 53       	add	#-1,	r8	;r3 As==11
    c842:	0f 93       	tst	r15		
    c844:	db 23       	jnz	$-72     	;abs 0xc7fc
    c846:	81 43 1e 00 	mov	#0,	30(r1)	;r3 As==00, 0x001e(r1)
    c84a:	b1 90 0a 00 	cmp	#10,	40(r1)	;#0x000a, 0x0028(r1)
    c84e:	28 00 
    c850:	02 24       	jz	$+6      	;abs 0xc856
    c852:	c1 43 02 00 	mov.b	#0,	2(r1)	;r3 As==00, 0x0002(r1)
    c856:	c1 93 2e 00 	tst.b	46(r1)		;0x002e(r1)
    c85a:	2a 24       	jz	$+86     	;abs 0xc8b0
    c85c:	0f 41       	mov	r1,	r15	
    c85e:	3f 50 1c 00 	add	#28,	r15	;#0x001c
    c862:	81 4f 42 00 	mov	r15,	66(r1)	;0x0042(r1)
    c866:	1a 41 1c 00 	mov	28(r1),	r10	;0x001c(r1)
    c86a:	8a 10       	swpb	r10		
    c86c:	8a 11       	sxt	r10		
    c86e:	8a 10       	swpb	r10		
    c870:	8a 11       	sxt	r10		
    c872:	81 4a 44 00 	mov	r10,	68(r1)	;0x0044(r1)
    c876:	81 46 46 00 	mov	r6,	70(r1)	;0x0046(r1)
    c87a:	0a 46       	mov	r6,	r10	
    c87c:	8a 10       	swpb	r10		
    c87e:	8a 11       	sxt	r10		
    c880:	8a 10       	swpb	r10		
    c882:	8a 11       	sxt	r10		
    c884:	81 4a 48 00 	mov	r10,	72(r1)	;0x0048(r1)
    c888:	1c 41 42 00 	mov	66(r1),	r12	;0x0042(r1)
    c88c:	1d 41 44 00 	mov	68(r1),	r13	;0x0044(r1)
    c890:	1c 81 46 00 	sub	70(r1),	r12	;0x0046(r1)
    c894:	1d 71 48 00 	subc	72(r1),	r13	;0x0048(r1)
    c898:	2c 83       	decd	r12		
    c89a:	1c 91 26 00 	cmp	38(r1),	r12	;0x0026(r1)
    c89e:	0e 2c       	jc	$+30     	;abs 0xc8bc
    c8a0:	e1 d3 01 00 	bis.b	#2,	1(r1)	;r3 As==10, 0x0001(r1)
    c8a4:	5e 41 26 00 	mov.b	38(r1),	r14	;0x0026(r1)
    c8a8:	4e 8c       	sub.b	r12,	r14	
    c8aa:	c1 4e 03 00 	mov.b	r14,	3(r1)	;0x0003(r1)
    c8ae:	06 3c       	jmp	$+14     	;abs 0xc8bc
    c8b0:	c1 93 2a 00 	tst.b	42(r1)		;0x002a(r1)
    c8b4:	03 24       	jz	$+8      	;abs 0xc8bc
    c8b6:	91 41 26 00 	mov	38(r1),	48(r1)	;0x0026(r1), 0x0030(r1)
    c8ba:	30 00 
    c8bc:	11 12 04 00 	push	4(r1)		;0x0004(r1)
    c8c0:	11 12 04 00 	push	4(r1)		;0x0004(r1)
    c8c4:	1d 41 34 00 	mov	52(r1),	r13	;0x0034(r1)
    c8c8:	0e 46       	mov	r6,	r14	
    c8ca:	1e 53       	inc	r14		
    c8cc:	1f 41 3e 00 	mov	62(r1),	r15	;0x003e(r1)
    c8d0:	b0 12 08 c1 	call	#0xc108	
    c8d4:	21 52       	add	#4,	r1	;r2 As==10
    c8d6:	81 5f 2c 00 	add	r15,	44(r1)	;0x002c(r1)
    c8da:	0d 3c       	jmp	$+28     	;abs 0xc8f6
    c8dc:	7f 49       	mov.b	@r9+,	r15	
    c8de:	8f 11       	sxt	r15		
    c8e0:	91 12 3c 00 	call	60(r1)		;0x003c(r1)
    c8e4:	0e 49       	mov	r9,	r14	
    c8e6:	0e 58       	add	r8,	r14	
    c8e8:	19 91 40 00 	cmp	64(r1),	r9	;0x0040(r1)
    c8ec:	f7 2b       	jnc	$-16     	;abs 0xc8dc
    c8ee:	81 49 3e 00 	mov	r9,	62(r1)	;0x003e(r1)
    c8f2:	81 4e 2c 00 	mov	r14,	44(r1)	;0x002c(r1)
    c8f6:	07 43       	clr	r7		
    c8f8:	0e 3c       	jmp	$+30     	;abs 0xc916
    c8fa:	91 41 26 00 	mov	38(r1),	48(r1)	;0x0026(r1), 0x0030(r1)
    c8fe:	30 00 
    c900:	d1 43 2e 00 	mov.b	#1,	46(r1)	;r3 As==01, 0x002e(r1)
    c904:	c1 43 2a 00 	mov.b	#0,	42(r1)	;r3 As==00, 0x002a(r1)
    c908:	03 3c       	jmp	$+8      	;abs 0xc910
    c90a:	05 4e       	mov	r14,	r5	
    c90c:	d1 43 2a 00 	mov.b	#1,	42(r1)	;r3 As==01, 0x002a(r1)
    c910:	81 43 26 00 	mov	#0,	38(r1)	;r3 As==00, 0x0026(r1)
    c914:	17 43       	mov	#1,	r7	;r3 As==01
    c916:	16 41 40 00 	mov	64(r1),	r6	;0x0040(r1)
    c91a:	6e 46       	mov.b	@r6,	r14	
    c91c:	4e 93       	tst.b	r14		
    c91e:	02 24       	jz	$+6      	;abs 0xc924
    c920:	30 40 ec c2 	br	#0xc2ec	
    c924:	1f 41 2c 00 	mov	44(r1),	r15	;0x002c(r1)
    c928:	31 50 4a 00 	add	#74,	r1	;#0x004a
    c92c:	34 41       	pop	r4		
    c92e:	35 41       	pop	r5		
    c930:	36 41       	pop	r6		
    c932:	37 41       	pop	r7		
    c934:	38 41       	pop	r8		
    c936:	39 41       	pop	r9		
    c938:	3a 41       	pop	r10		
    c93a:	3b 41       	pop	r11		
    c93c:	30 41       	ret			

0000c93e <__udivhi3>:
    c93e:	7c 40 10 00 	mov.b	#16,	r12	;#0x0010
    c942:	0d 4e       	mov	r14,	r13	
    c944:	0e 43       	clr	r14		
    c946:	0f 5f       	rla	r15		
    c948:	0e 6e       	rlc	r14		
    c94a:	0e 9d       	cmp	r13,	r14	
    c94c:	02 28       	jnc	$+6      	;abs 0xc952
    c94e:	0e 8d       	sub	r13,	r14	
    c950:	1f d3       	bis	#1,	r15	;r3 As==01
    c952:	1c 83       	dec	r12		
    c954:	f8 23       	jnz	$-14     	;abs 0xc946
    c956:	30 41       	ret			

0000c958 <__umodhi3>:
    c958:	b0 12 3e c9 	call	#0xc93e	
    c95c:	0f 4e       	mov	r14,	r15	
    c95e:	30 41       	ret			

0000c960 <__udivsi3>:
    c960:	0b 12       	push	r11		
    c962:	0a 12       	push	r10		
    c964:	09 12       	push	r9		
    c966:	79 40 20 00 	mov.b	#32,	r9	;#0x0020
    c96a:	0a 4c       	mov	r12,	r10	
    c96c:	0b 4d       	mov	r13,	r11	
    c96e:	0c 43       	clr	r12		
    c970:	0d 43       	clr	r13		
    c972:	0e 5e       	rla	r14		
    c974:	0f 6f       	rlc	r15		
    c976:	0c 6c       	rlc	r12		
    c978:	0d 6d       	rlc	r13		
    c97a:	0d 9b       	cmp	r11,	r13	
    c97c:	06 28       	jnc	$+14     	;abs 0xc98a
    c97e:	02 20       	jnz	$+6      	;abs 0xc984
    c980:	0c 9a       	cmp	r10,	r12	
    c982:	03 28       	jnc	$+8      	;abs 0xc98a
    c984:	0c 8a       	sub	r10,	r12	
    c986:	0d 7b       	subc	r11,	r13	
    c988:	1e d3       	bis	#1,	r14	;r3 As==01
    c98a:	19 83       	dec	r9		
    c98c:	f2 23       	jnz	$-26     	;abs 0xc972
    c98e:	39 41       	pop	r9		
    c990:	3a 41       	pop	r10		
    c992:	3b 41       	pop	r11		
    c994:	30 41       	ret			

0000c996 <__umodsi3>:
    c996:	b0 12 60 c9 	call	#0xc960	
    c99a:	0e 4c       	mov	r12,	r14	
    c99c:	0f 4d       	mov	r13,	r15	
    c99e:	30 41       	ret			

0000c9a0 <__xabi_udivmod64>:
    c9a0:	07 12       	push	r7		
    c9a2:	06 12       	push	r6		
    c9a4:	05 12       	push	r5		
    c9a6:	04 12       	push	r4		
    c9a8:	30 12 40 00 	push	#64		;#0x0040
    c9ac:	04 48       	mov	r8,	r4	
    c9ae:	05 49       	mov	r9,	r5	
    c9b0:	06 4a       	mov	r10,	r6	
    c9b2:	07 4b       	mov	r11,	r7	
    c9b4:	08 43       	clr	r8		
    c9b6:	09 43       	clr	r9		
    c9b8:	0a 43       	clr	r10		
    c9ba:	0b 43       	clr	r11		
    c9bc:	0c 5c       	rla	r12		
    c9be:	0d 6d       	rlc	r13		
    c9c0:	0e 6e       	rlc	r14		
    c9c2:	0f 6f       	rlc	r15		
    c9c4:	08 68       	rlc	r8		
    c9c6:	09 69       	rlc	r9		
    c9c8:	0a 6a       	rlc	r10		
    c9ca:	0b 6b       	rlc	r11		
    c9cc:	0b 97       	cmp	r7,	r11	
    c9ce:	0e 28       	jnc	$+30     	;abs 0xc9ec
    c9d0:	08 20       	jnz	$+18     	;abs 0xc9e2
    c9d2:	0a 96       	cmp	r6,	r10	
    c9d4:	0b 28       	jnc	$+24     	;abs 0xc9ec
    c9d6:	05 20       	jnz	$+12     	;abs 0xc9e2
    c9d8:	09 95       	cmp	r5,	r9	
    c9da:	08 28       	jnc	$+18     	;abs 0xc9ec
    c9dc:	02 20       	jnz	$+6      	;abs 0xc9e2
    c9de:	08 94       	cmp	r4,	r8	
    c9e0:	05 28       	jnc	$+12     	;abs 0xc9ec
    c9e2:	08 84       	sub	r4,	r8	
    c9e4:	09 75       	subc	r5,	r9	
    c9e6:	0a 76       	subc	r6,	r10	
    c9e8:	0b 77       	subc	r7,	r11	
    c9ea:	1c d3       	bis	#1,	r12	;r3 As==01
    c9ec:	91 83 00 00 	dec	0(r1)		;0x0000(r1)
    c9f0:	e5 23       	jnz	$-52     	;abs 0xc9bc
    c9f2:	21 53       	incd	r1		
    c9f4:	34 41       	pop	r4		
    c9f6:	35 41       	pop	r5		
    c9f8:	36 41       	pop	r6		
    c9fa:	37 41       	pop	r7		
    c9fc:	30 41       	ret			

0000c9fe <__udivdi3>:
    c9fe:	0b 12       	push	r11		
    ca00:	0a 12       	push	r10		
    ca02:	09 12       	push	r9		
    ca04:	08 12       	push	r8		
    ca06:	18 41 0a 00 	mov	10(r1),	r8	;0x000a(r1)
    ca0a:	19 41 0c 00 	mov	12(r1),	r9	;0x000c(r1)
    ca0e:	1a 41 0e 00 	mov	14(r1),	r10	;0x000e(r1)
    ca12:	1b 41 10 00 	mov	16(r1),	r11	;0x0010(r1)
    ca16:	b0 12 a0 c9 	call	#0xc9a0	
    ca1a:	38 41       	pop	r8		
    ca1c:	39 41       	pop	r9		
    ca1e:	3a 41       	pop	r10		
    ca20:	3b 41       	pop	r11		
    ca22:	30 41       	ret			

0000ca24 <__umoddi3>:
    ca24:	0b 12       	push	r11		
    ca26:	0a 12       	push	r10		
    ca28:	09 12       	push	r9		
    ca2a:	08 12       	push	r8		
    ca2c:	18 41 0a 00 	mov	10(r1),	r8	;0x000a(r1)
    ca30:	19 41 0c 00 	mov	12(r1),	r9	;0x000c(r1)
    ca34:	1a 41 0e 00 	mov	14(r1),	r10	;0x000e(r1)
    ca38:	1b 41 10 00 	mov	16(r1),	r11	;0x0010(r1)
    ca3c:	b0 12 a0 c9 	call	#0xc9a0	
    ca40:	0c 48       	mov	r8,	r12	
    ca42:	0d 49       	mov	r9,	r13	
    ca44:	0e 4a       	mov	r10,	r14	
    ca46:	0f 4b       	mov	r11,	r15	
    ca48:	38 41       	pop	r8		
    ca4a:	39 41       	pop	r9		
    ca4c:	3a 41       	pop	r10		
    ca4e:	3b 41       	pop	r11		
    ca50:	30 41       	ret			

0000ca52 <__udivmoddi4>:
    ca52:	0b 12       	push	r11		
    ca54:	0a 12       	push	r10		
    ca56:	09 12       	push	r9		
    ca58:	08 12       	push	r8		
    ca5a:	07 12       	push	r7		
    ca5c:	18 41 0c 00 	mov	12(r1),	r8	;0x000c(r1)
    ca60:	19 41 0e 00 	mov	14(r1),	r9	;0x000e(r1)
    ca64:	1a 41 10 00 	mov	16(r1),	r10	;0x0010(r1)
    ca68:	1b 41 12 00 	mov	18(r1),	r11	;0x0012(r1)
    ca6c:	b0 12 a0 c9 	call	#0xc9a0	
    ca70:	17 41 14 00 	mov	20(r1),	r7	;0x0014(r1)
    ca74:	87 48 00 00 	mov	r8,	0(r7)	;0x0000(r7)
    ca78:	87 49 02 00 	mov	r9,	2(r7)	;0x0002(r7)
    ca7c:	87 4a 04 00 	mov	r10,	4(r7)	;0x0004(r7)
    ca80:	87 4b 06 00 	mov	r11,	6(r7)	;0x0006(r7)
    ca84:	37 41       	pop	r7		
    ca86:	38 41       	pop	r8		
    ca88:	39 41       	pop	r9		
    ca8a:	3a 41       	pop	r10		
    ca8c:	3b 41       	pop	r11		
    ca8e:	30 41       	ret			

Disassembly of section .rodata:

0000ca90 <hello>:
    ca90:	68 65       	addc.b	@r5,	r8	
    ca92:	6c 6c       	addc.b	@r12,	r12	
    ca94:	6f 20       	jnz	$+224    	;abs 0xcb74
    ca96:	77 6f       	addc.b	@r15+,	r7	
    ca98:	72 6c       	addc.b	@r12+,	r2	
    ca9a:	64 00       	.word	0x0064;	????	
    ca9c:	68 65       	addc.b	@r5,	r8	
    ca9e:	6c 6c       	addc.b	@r12,	r12	
    caa0:	6f 20       	jnz	$+224    	;abs 0xcb80
    caa2:	77 6f       	addc.b	@r15+,	r7	
    caa4:	72 6c       	addc.b	@r12+,	r2	
    caa6:	64 00       	.word	0x0064;	????	
    caa8:	28 6e       	addc	@r14,	r8	
    caaa:	75 6c       	addc.b	@r12+,	r5	
    caac:	6c 29       	jnc	$+730    	;abs 0xcd86
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	10 00       	.word	0x0010;	????	
   2:	00 00       	.word	0x0000;	????	
   4:	02 00       	.word	0x0002;	????	
   6:	00 00       	.word	0x0000;	????	
   8:	00 00       	.word	0x0000;	????	
   a:	02 00       	.word	0x0002;	????	
   c:	ea c0 1e 00 	bic.b	@r0,	30(r10)	;0x001e(r10)
  10:	00 00       	.word	0x0000;	????	
  12:	00 00       	.word	0x0000;	????	
  14:	10 00       	.word	0x0010;	????	
  16:	00 00       	.word	0x0000;	????	
  18:	02 00       	.word	0x0002;	????	
  1a:	05 01       	.word	0x0105;	????	
  1c:	00 00       	.word	0x0000;	????	
  1e:	02 00       	.word	0x0002;	????	
  20:	08 c1       	bic	r1,	r8	
  22:	36 08       	.word	0x0836;	????	
  24:	00 00       	.word	0x0000;	????	
  26:	00 00       	.word	0x0000;	????	
  28:	10 00       	.word	0x0010;	????	
  2a:	00 00       	.word	0x0000;	????	
  2c:	02 00       	.word	0x0002;	????	
  2e:	6a 06       	.word	0x066a;	????	
  30:	00 00       	.word	0x0000;	????	
  32:	02 00       	.word	0x0002;	????	
  34:	3e c9       	bic	@r9+,	r14	
  36:	22 00       	.word	0x0022;	????	
  38:	00 00       	.word	0x0000;	????	
  3a:	00 00       	.word	0x0000;	????	
  3c:	10 00       	.word	0x0010;	????	
  3e:	00 00       	.word	0x0000;	????	
  40:	02 00       	.word	0x0002;	????	
  42:	4e 07       	.word	0x074e;	????	
  44:	00 00       	.word	0x0000;	????	
  46:	02 00       	.word	0x0002;	????	
  48:	60 c9       	bic.b	@r9,	r0	
  4a:	40 00       	.word	0x0040;	????	
  4c:	00 00       	.word	0x0000;	????	
  4e:	00 00       	.word	0x0000;	????	
  50:	10 00       	.word	0x0010;	????	
  52:	00 00       	.word	0x0000;	????	
  54:	02 00       	.word	0x0002;	????	
  56:	32 08       	.word	0x0832;	????	
  58:	00 00       	.word	0x0000;	????	
  5a:	02 00       	.word	0x0002;	????	
  5c:	a0 c9 f0 00 	bic	@r9,	240(r0)	;PC rel. 0x014e
  60:	00 00       	.word	0x0000;	????	
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	01 01       	.word	0x0101;	????	
   2:	00 00       	.word	0x0000;	????	
   4:	02 00       	.word	0x0002;	????	
   6:	00 00       	.word	0x0000;	????	
   8:	00 00       	.word	0x0000;	????	
   a:	02 01       	.word	0x0102;	????	
   c:	81 00       	.word	0x0081;	????	
   e:	00 00       	.word	0x0000;	????	
  10:	01 1a       	.word	0x1a01;	????	
  12:	00 00       	.word	0x0000;	????	
  14:	00 b6       	bit	r6,	r0	
  16:	00 00       	.word	0x0000;	????	
  18:	00 ea       	xor	r10,	r0	
  1a:	c0 08       	.word	0x08c0;	????	
  1c:	c1 00       	.word	0x00c1;	????	
  1e:	00 00       	.word	0x0000;	????	
  20:	00 02       	.word	0x0200;	????	
  22:	04 05       	.word	0x0504;	????	
  24:	78 00       	.word	0x0078;	????	
  26:	00 00       	.word	0x0000;	????	
  28:	02 02       	.word	0x0202;	????	
  2a:	07 66       	addc	r6,	r7	
  2c:	00 00       	.word	0x0000;	????	
  2e:	00 03       	.word	0x0300;	????	
  30:	02 05       	.word	0x0502;	????	
  32:	69 6e       	addc.b	@r14,	r9	
  34:	74 00       	.word	0x0074;	????	
  36:	02 01       	.word	0x0102;	????	
  38:	06 3d       	jmp	$+526    	;abs 0x246
  3a:	00 00       	.word	0x0000;	????	
  3c:	00 02       	.word	0x0200;	????	
  3e:	08 05       	.word	0x0508;	????	
  40:	73 00       	.word	0x0073;	????	
  42:	00 00       	.word	0x0000;	????	
  44:	02 01       	.word	0x0102;	????	
  46:	08 3b       	jl	$-494    	;abs 0xfe58
  48:	00 00       	.word	0x0000;	????	
  4a:	00 02       	.word	0x0200;	????	
  4c:	04 07       	.word	0x0704;	????	
  4e:	61 00       	.word	0x0061;	????	
  50:	00 00       	.word	0x0000;	????	
  52:	02 08       	.word	0x0802;	????	
  54:	07 5c       	add	r12,	r7	
  56:	00 00       	.word	0x0000;	????	
  58:	00 02       	.word	0x0200;	????	
  5a:	02 07       	.word	0x0702;	????	
  5c:	49 00       	.word	0x0049;	????	
  5e:	00 00       	.word	0x0000;	????	
  60:	02 01       	.word	0x0102;	????	
  62:	06 44       	mov	r4,	r6	
  64:	00 00       	.word	0x0000;	????	
  66:	00 04       	.word	0x0400;	????	
  68:	02 6d       	addc	r13,	r2	
  6a:	00 00       	.word	0x0000;	????	
  6c:	00 05       	.word	0x0500;	????	
  6e:	60 00       	.word	0x0060;	????	
  70:	00 00       	.word	0x0000;	????	
  72:	06 2c       	jc	$+14     	;abs 0x80
  74:	00 00       	.word	0x0000;	????	
  76:	00 02       	.word	0x0200;	????	
  78:	28 7d       	subc	@r13,	r8	
  7a:	00 00       	.word	0x0000;	????	
  7c:	00 07       	.word	0x0700;	????	
  7e:	02 00       	.word	0x0002;	????	
  80:	00 00       	.word	0x0000;	????	
  82:	00 06       	.word	0x0600;	????	
  84:	33 00       	.word	0x0033;	????	
  86:	00 00       	.word	0x0000;	????	
  88:	02 66       	addc	r6,	r2	
  8a:	72 00       	.word	0x0072;	????	
  8c:	00 00       	.word	0x0000;	????	
  8e:	08 01       	.word	0x0108;	????	
  90:	77 02       	.word	0x0277;	????	
  92:	00 00       	.word	0x0000;	????	
  94:	01 24       	jz	$+4      	;abs 0x98
  96:	01 2f       	jc	$-508    	;abs 0xfe9a
  98:	00 00       	.word	0x0000;	????	
  9a:	00 ea       	xor	r10,	r0	
  9c:	c0 fa c0 02 	and.b	r10,	704(r0)	;PC rel. 0x035e
  a0:	71 02       	.word	0x0271;	????	
  a2:	d1 00       	.word	0x00d1;	????	
  a4:	00 00       	.word	0x0000;	????	
  a6:	09 66       	addc	r6,	r9	
  a8:	6d 74       	subc.b	@r4,	r13	
  aa:	00 01       	.word	0x0100;	????	
  ac:	24 67       	addc	@r7,	r4	
  ae:	00 00       	.word	0x0000;	????	
  b0:	00 02       	.word	0x0200;	????	
  b2:	91 00       	.word	0x0091;	????	
  b4:	0a 0b       	.word	0x0b0a;	????	
  b6:	e9 00       	.word	0x00e9;	????	
  b8:	00 00       	.word	0x0000;	????	
  ba:	01 26       	jz	$-1020   	;abs 0xfcbe
  bc:	83 00       	.word	0x0083;	????	
  be:	00 00       	.word	0x0000;	????	
  c0:	00 00       	.word	0x0000;	????	
  c2:	00 00       	.word	0x0000;	????	
  c4:	0c 72       	subc	r2,	r12	
  c6:	63 00       	.word	0x0063;	????	
  c8:	01 27       	jz	$-508    	;abs 0xfecc
  ca:	2f 00       	.word	0x002f;	????	
  cc:	00 00       	.word	0x0000;	????	
  ce:	01 5f       	add	r15,	r1	
  d0:	00 0d       	.word	0x0d00;	????	
  d2:	01 12       	push	r1		
  d4:	00 00       	.word	0x0000;	????	
  d6:	00 01       	.word	0x0100;	????	
  d8:	30 01       	.word	0x0130;	????	
  da:	2f 00       	.word	0x002f;	????	
  dc:	00 00       	.word	0x0000;	????	
  de:	fa c0 08 c1 	bic.b	#-16120,28930(r10);#0xc108, 0x7102(r10)
  e2:	02 71 
  e4:	02 0e       	.word	0x0e02;	????	
  e6:	66 6d       	addc.b	@r13,	r6	
  e8:	74 00       	.word	0x0074;	????	
  ea:	01 30       	jn	$+4      	;abs 0xee
  ec:	67 00       	.word	0x0067;	????	
  ee:	00 00       	.word	0x0000;	????	
  f0:	14 00       	.word	0x0014;	????	
  f2:	00 00       	.word	0x0000;	????	
  f4:	0f e9       	xor	r9,	r15	
  f6:	00 00       	.word	0x0000;	????	
  f8:	00 01       	.word	0x0100;	????	
  fa:	30 83       	sub	#-1,	r0	;r3 As==11
  fc:	00 00       	.word	0x0000;	????	
  fe:	00 26       	jz	$-1022   	;abs 0xfd00
 100:	00 00       	.word	0x0000;	????	
 102:	00 00       	.word	0x0000;	????	
 104:	00 61       	addc	r1,	r0	
 106:	05 00       	.word	0x0005;	????	
 108:	00 02       	.word	0x0200;	????	
 10a:	00 d0       	bis	r0,	r0	
 10c:	00 00       	.word	0x0000;	????	
 10e:	00 02       	.word	0x0200;	????	
 110:	01 81       	sub	r1,	r1	
 112:	00 00       	.word	0x0000;	????	
 114:	00 01       	.word	0x0100;	????	
 116:	ad 02       	.word	0x02ad;	????	
 118:	00 00       	.word	0x0000;	????	
 11a:	b6 00       	.word	0x00b6;	????	
 11c:	00 00       	.word	0x0000;	????	
 11e:	08 c1       	bic	r1,	r8	
 120:	3e c9       	bic	@r9+,	r14	
 122:	72 00       	.word	0x0072;	????	
 124:	00 00       	.word	0x0000;	????	
 126:	02 04       	.word	0x0402;	????	
 128:	05 78       	subc	r8,	r5	
 12a:	00 00       	.word	0x0000;	????	
 12c:	00 02       	.word	0x0200;	????	
 12e:	02 07       	.word	0x0702;	????	
 130:	66 00       	.word	0x0066;	????	
 132:	00 00       	.word	0x0000;	????	
 134:	03 02       	.word	0x0203;	????	
 136:	05 69       	addc	r9,	r5	
 138:	6e 74       	subc.b	@r4,	r14	
 13a:	00 02       	.word	0x0200;	????	
 13c:	01 06       	.word	0x0601;	????	
 13e:	3d 00       	.word	0x003d;	????	
 140:	00 00       	.word	0x0000;	????	
 142:	04 18       	.word	0x1804;	????	
 144:	02 00       	.word	0x0002;	????	
 146:	00 02       	.word	0x0200;	????	
 148:	27 2f       	jc	$-432    	;abs 0xff98
 14a:	00 00       	.word	0x0000;	????	
 14c:	00 04       	.word	0x0400;	????	
 14e:	05 02       	.word	0x0205;	????	
 150:	00 00       	.word	0x0000;	????	
 152:	02 28       	jnc	$+6      	;abs 0x158
 154:	21 00       	.word	0x0021;	????	
 156:	00 00       	.word	0x0000;	????	
 158:	04 fa       	and	r10,	r4	
 15a:	00 00       	.word	0x0000;	????	
 15c:	00 02       	.word	0x0200;	????	
 15e:	29 5e       	add	@r14,	r9	
 160:	00 00       	.word	0x0000;	????	
 162:	00 02       	.word	0x0200;	????	
 164:	08 05       	.word	0x0508;	????	
 166:	73 00       	.word	0x0073;	????	
 168:	00 00       	.word	0x0000;	????	
 16a:	04 3a       	jl	$-1014   	;abs 0xfd74
 16c:	01 00       	.word	0x0001;	????	
 16e:	00 02       	.word	0x0200;	????	
 170:	2b 70       	subc	@r0,	r11	
 172:	00 00       	.word	0x0000;	????	
 174:	00 02       	.word	0x0200;	????	
 176:	01 08       	.word	0x0801;	????	
 178:	3b 00       	.word	0x003b;	????	
 17a:	00 00       	.word	0x0000;	????	
 17c:	04 17       	.word	0x1704;	????	
 17e:	02 00       	.word	0x0002;	????	
 180:	00 02       	.word	0x0200;	????	
 182:	2c 28       	jnc	$+90     	;abs 0x1dc
 184:	00 00       	.word	0x0000;	????	
 186:	00 04       	.word	0x0400;	????	
 188:	04 02       	.word	0x0204;	????	
 18a:	00 00       	.word	0x0000;	????	
 18c:	02 2d       	jc	$+518    	;abs 0x392
 18e:	8d 00       	.word	0x008d;	????	
 190:	00 00       	.word	0x0000;	????	
 192:	02 04       	.word	0x0402;	????	
 194:	07 61       	addc	r1,	r7	
 196:	00 00       	.word	0x0000;	????	
 198:	00 04       	.word	0x0400;	????	
 19a:	f9 00       	.word	0x00f9;	????	
 19c:	00 00       	.word	0x0000;	????	
 19e:	02 2e       	jc	$-1018   	;abs 0xfda4
 1a0:	9f 00       	.word	0x009f;	????	
 1a2:	00 00       	.word	0x0000;	????	
 1a4:	02 08       	.word	0x0802;	????	
 1a6:	07 5c       	add	r12,	r7	
 1a8:	00 00       	.word	0x0000;	????	
 1aa:	00 04       	.word	0x0400;	????	
 1ac:	02 01       	.word	0x0102;	????	
 1ae:	00 00       	.word	0x0000;	????	
 1b0:	02 56       	add	r6,	r2	
 1b2:	3d 00       	.word	0x003d;	????	
 1b4:	00 00       	.word	0x0000;	????	
 1b6:	02 02       	.word	0x0202;	????	
 1b8:	07 49       	mov	r9,	r7	
 1ba:	00 00       	.word	0x0000;	????	
 1bc:	00 05       	.word	0x0500;	????	
 1be:	02 be       	bit	r14,	r2	
 1c0:	00 00       	.word	0x0000;	????	
 1c2:	00 02       	.word	0x0200;	????	
 1c4:	01 06       	.word	0x0601;	????	
 1c6:	44 00       	.word	0x0044;	????	
 1c8:	00 00       	.word	0x0000;	????	
 1ca:	05 02       	.word	0x0205;	????	
 1cc:	cb 00       	.word	0x00cb;	????	
 1ce:	00 00       	.word	0x0000;	????	
 1d0:	06 be       	bit	r14,	r6	
 1d2:	00 00       	.word	0x0000;	????	
 1d4:	00 04       	.word	0x0400;	????	
 1d6:	2c 00       	.word	0x002c;	????	
 1d8:	00 00       	.word	0x0000;	????	
 1da:	03 28       	jnc	$+8      	;abs 0x1e2
 1dc:	db 00       	.word	0x00db;	????	
 1de:	00 00       	.word	0x0000;	????	
 1e0:	07 02       	.word	0x0207;	????	
 1e2:	00 00       	.word	0x0000;	????	
 1e4:	00 00       	.word	0x0000;	????	
 1e6:	04 33       	jn	$-502    	;abs 0xfff0
 1e8:	00 00       	.word	0x0000;	????	
 1ea:	00 03       	.word	0x0300;	????	
 1ec:	66 d0       	bis.b	@r0,	r6	
 1ee:	00 00       	.word	0x0000;	????	
 1f0:	00 08       	.word	0x0800;	????	
 1f2:	04 01       	.word	0x0104;	????	
 1f4:	33 cc       	.word	0xcc33;	????	Illegal as 2-op instr
 1f6:	01 00       	.word	0x0001;	????	
 1f8:	00 09       	.word	0x0900;	????	
 1fa:	0d 02       	.word	0x020d;	????	
 1fc:	00 00       	.word	0x0000;	????	
 1fe:	01 36       	jge	$-1020   	;abs 0xfe02
 200:	65 00       	.word	0x0065;	????	
 202:	00 00       	.word	0x0000;	????	
 204:	01 01       	.word	0x0101;	????	
 206:	07 02       	.word	0x0207;	????	
 208:	23 00       	.word	0x0023;	????	
 20a:	09 91       	cmp	r1,	r9	
 20c:	01 00       	.word	0x0001;	????	
 20e:	00 01       	.word	0x0100;	????	
 210:	39 65       	addc	@r5+,	r9	
 212:	00 00       	.word	0x0000;	????	
 214:	00 01       	.word	0x0100;	????	
 216:	01 06       	.word	0x0601;	????	
 218:	02 23       	jnz	$-506    	;abs 0x1e
 21a:	00 09       	.word	0x0900;	????	
 21c:	91 02       	.word	0x0291;	????	
 21e:	00 00       	.word	0x0000;	????	
 220:	01 3b       	jl	$-508    	;abs 0x24
 222:	65 00       	.word	0x0065;	????	
 224:	00 00       	.word	0x0000;	????	
 226:	01 01       	.word	0x0101;	????	
 228:	05 02       	.word	0x0205;	????	
 22a:	23 00       	.word	0x0023;	????	
 22c:	09 73       	sbc	r9		
 22e:	01 00       	.word	0x0001;	????	
 230:	00 01       	.word	0x0100;	????	
 232:	3c 65       	addc	@r5+,	r12	
 234:	00 00       	.word	0x0000;	????	
 236:	00 01       	.word	0x0100;	????	
 238:	01 04       	.word	0x0401;	????	
 23a:	02 23       	jnz	$-506    	;abs 0x40
 23c:	00 09       	.word	0x0900;	????	
 23e:	e3 02       	.word	0x02e3;	????	
 240:	00 00       	.word	0x0000;	????	
 242:	01 3d       	jmp	$+516    	;abs 0x446
 244:	65 00       	.word	0x0065;	????	
 246:	00 00       	.word	0x0000;	????	
 248:	01 01       	.word	0x0101;	????	
 24a:	03 02       	.word	0x0203;	????	
 24c:	23 00       	.word	0x0023;	????	
 24e:	09 10       	rrc	r9		
 250:	01 00       	.word	0x0001;	????	
 252:	00 01       	.word	0x0100;	????	
 254:	3e 65       	addc	@r5+,	r14	
 256:	00 00       	.word	0x0000;	????	
 258:	00 01       	.word	0x0100;	????	
 25a:	01 02       	.word	0x0201;	????	
 25c:	02 23       	jnz	$-506    	;abs 0x62
 25e:	00 09       	.word	0x0900;	????	
 260:	42 01       	.word	0x0142;	????	
 262:	00 00       	.word	0x0000;	????	
 264:	01 3f       	jmp	$-508    	;abs 0x68
 266:	65 00       	.word	0x0065;	????	
 268:	00 00       	.word	0x0000;	????	
 26a:	01 01       	.word	0x0101;	????	
 26c:	01 02       	.word	0x0201;	????	
 26e:	23 00       	.word	0x0023;	????	
 270:	09 a3       	dadc	r9		
 272:	02 00       	.word	0x0002;	????	
 274:	00 01       	.word	0x0100;	????	
 276:	40 65       	addc.b	r5,	r0	
 278:	00 00       	.word	0x0000;	????	
 27a:	00 01       	.word	0x0100;	????	
 27c:	01 00       	.word	0x0001;	????	
 27e:	02 23       	jnz	$-506    	;abs 0x84
 280:	00 09       	.word	0x0900;	????	
 282:	a5 01       	.word	0x01a5;	????	
 284:	00 00       	.word	0x0000;	????	
 286:	01 41       	mov	r1,	r1	
 288:	65 00       	.word	0x0065;	????	
 28a:	00 00       	.word	0x0000;	????	
 28c:	01 01       	.word	0x0101;	????	
 28e:	07 02       	.word	0x0207;	????	
 290:	23 01       	.word	0x0123;	????	
 292:	09 af       	dadd	r15,	r9	
 294:	01 00       	.word	0x0001;	????	
 296:	00 01       	.word	0x0100;	????	
 298:	42 65       	addc.b	r5,	r2	
 29a:	00 00       	.word	0x0000;	????	
 29c:	00 01       	.word	0x0100;	????	
 29e:	01 06       	.word	0x0601;	????	
 2a0:	02 23       	jnz	$-506    	;abs 0xa6
 2a2:	01 09       	.word	0x0901;	????	
 2a4:	7e 02       	.word	0x027e;	????	
 2a6:	00 00       	.word	0x0000;	????	
 2a8:	01 43       	clr	r1		
 2aa:	65 00       	.word	0x0065;	????	
 2ac:	00 00       	.word	0x0000;	????	
 2ae:	01 01       	.word	0x0101;	????	
 2b0:	05 02       	.word	0x0205;	????	
 2b2:	23 01       	.word	0x0123;	????	
 2b4:	0a 6b       	addc	r11,	r10	
 2b6:	02 00       	.word	0x0002;	????	
 2b8:	00 01       	.word	0x0100;	????	
 2ba:	44 be       	bit.b	r14,	r4	
 2bc:	00 00       	.word	0x0000;	????	
 2be:	00 02       	.word	0x0200;	????	
 2c0:	23 02       	.word	0x0223;	????	
 2c2:	0a b8       	bit	r8,	r10	
 2c4:	01 00       	.word	0x0001;	????	
 2c6:	00 01       	.word	0x0100;	????	
 2c8:	45 65       	rlc.b	r5		
 2ca:	00 00       	.word	0x0000;	????	
 2cc:	00 02       	.word	0x0200;	????	
 2ce:	23 03       	.word	0x0323;	????	
 2d0:	00 04       	.word	0x0400;	????	
 2d2:	9b 02       	.word	0x029b;	????	
 2d4:	00 00       	.word	0x0000;	????	
 2d6:	01 46       	mov	r6,	r1	
 2d8:	ec 00       	.word	0x00ec;	????	
 2da:	00 00       	.word	0x0000;	????	
 2dc:	0b fa       	and	r10,	r11	
 2de:	02 00       	.word	0x0002;	????	
 2e0:	00 01       	.word	0x0100;	????	
 2e2:	60 01       	.word	0x0160;	????	
 2e4:	2f 00       	.word	0x002f;	????	
 2e6:	00 00       	.word	0x0000;	????	
 2e8:	01 08       	.word	0x0801;	????	
 2ea:	02 00       	.word	0x0002;	????	
 2ec:	00 0c       	.word	0x0c00;	????	
 2ee:	25 02       	.word	0x0225;	????	
 2f0:	00 00       	.word	0x0000;	????	
 2f2:	01 60       	addc	r0,	r1	
 2f4:	b8 00       	.word	0x00b8;	????	
 2f6:	00 00       	.word	0x0000;	????	
 2f8:	0c fe       	and	r14,	r12	
 2fa:	01 00       	.word	0x0001;	????	
 2fc:	00 01       	.word	0x0100;	????	
 2fe:	60 cc       	bic.b	@r12,	r0	
 300:	01 00       	.word	0x0001;	????	
 302:	00 0d       	.word	0x0d00;	????	
 304:	70 00       	.word	0x0070;	????	
 306:	01 62       	addc	r2,	r1	
 308:	b8 00       	.word	0x00b8;	????	
 30a:	00 00       	.word	0x0000;	????	
 30c:	00 0e       	.word	0x0e00;	????	
 30e:	da 01       	.word	0x01da;	????	
 310:	00 00       	.word	0x0000;	????	
 312:	01 7a       	subc	r10,	r1	
 314:	01 2f       	jc	$-508    	;abs 0x118
 316:	00 00       	.word	0x0000;	????	
 318:	00 08       	.word	0x0800;	????	
 31a:	c1 a0 c2 38 	dadd.b	r0,	14530(r1);0x38c2(r1)
 31e:	00 00       	.word	0x0000;	????	
 320:	00 fa       	and	r10,	r0	
 322:	02 00       	.word	0x0002;	????	
 324:	00 0f       	.word	0x0f00;	????	
 326:	2f 01       	.word	0x012f;	????	
 328:	00 00       	.word	0x0000;	????	
 32a:	01 7a       	subc	r10,	r1	
 32c:	0a 03       	.word	0x030a;	????	
 32e:	00 00       	.word	0x0000;	????	
 330:	8c 00       	.word	0x008c;	????	
 332:	00 00       	.word	0x0000;	????	
 334:	0f 5d       	add	r13,	r15	
 336:	01 00       	.word	0x0001;	????	
 338:	00 01       	.word	0x0100;	????	
 33a:	7a c5       	bic.b	@r5+,	r10	
 33c:	00 00       	.word	0x0000;	????	
 33e:	00 9e       	cmp	r14,	r0	
 340:	00 00       	.word	0x0000;	????	
 342:	00 0f       	.word	0x0f00;	????	
 344:	55 02       	.word	0x0255;	????	
 346:	00 00       	.word	0x0000;	????	
 348:	01 7a       	subc	r10,	r1	
 34a:	28 00       	.word	0x0028;	????	
 34c:	00 00       	.word	0x0000;	????	
 34e:	b1 00       	.word	0x00b1;	????	
 350:	00 00       	.word	0x0000;	????	
 352:	0f fe       	and	r14,	r15	
 354:	01 00       	.word	0x0001;	????	
 356:	00 01       	.word	0x0100;	????	
 358:	7b cc       	bic.b	@r12+,	r11	
 35a:	01 00       	.word	0x0001;	????	
 35c:	00 c3       	bic	#0,	r0	;r3 As==00
 35e:	00 00       	.word	0x0000;	????	
 360:	00 10       	rrc	r0		
 362:	c7 02       	.word	0x02c7;	????	
 364:	00 00       	.word	0x0000;	????	
 366:	01 7d       	subc	r13,	r1	
 368:	2f 00       	.word	0x002f;	????	
 36a:	00 00       	.word	0x0000;	????	
 36c:	32 01       	.word	0x0132;	????	
 36e:	00 00       	.word	0x0000;	????	
 370:	11 25       	jz	$+548    	;abs 0x594
 372:	02 00       	.word	0x0002;	????	
 374:	00 01       	.word	0x0100;	????	
 376:	7e 10       	rrc.b	@r14+		
 378:	03 00       	.word	0x0003;	????	
 37a:	00 02       	.word	0x0200;	????	
 37c:	91 66 10 f3 	addc	-3312(r6),1(r1)	;0xf310(r6), 0x0001(r1)
 380:	01 00 
 382:	00 01       	.word	0x0100;	????	
 384:	7f 2f       	jc	$-256    	;abs 0x284
 386:	00 00       	.word	0x0000;	????	
 388:	00 62       	addc	r2,	r0	
 38a:	01 00       	.word	0x0001;	????	
 38c:	00 10       	rrc	r0		
 38e:	7e 02       	.word	0x027e;	????	
 390:	00 00       	.word	0x0000;	????	
 392:	01 80       	sub	r0,	r1	
 394:	28 00       	.word	0x0028;	????	
 396:	00 00       	.word	0x0000;	????	
 398:	9a 01       	.word	0x019a;	????	
 39a:	00 00       	.word	0x0000;	????	
 39c:	11 52 01 00 	add	&0x0001,r1	
 3a0:	00 01       	.word	0x0100;	????	
 3a2:	81 2f       	jc	$-252    	;abs 0x2a6
 3a4:	00 00       	.word	0x0000;	????	
 3a6:	00 01       	.word	0x0100;	????	
 3a8:	5a 12 d7 01 	push.b	471(r10)	;0x01d7(r10)
 3ac:	00 00       	.word	0x0000;	????	
 3ae:	32 c1       	bic	@r1+,	r2	
 3b0:	98 c1 01 81 	bic	-32511(r1),725(r8)	;0x8101(r1), 0x02d5(r8)
 3b4:	d5 02 
 3b6:	00 00       	.word	0x0000;	????	
 3b8:	13 f3       	.word	0xf313;	????	Illegal as 2-op instr
 3ba:	01 00       	.word	0x0001;	????	
 3bc:	00 c5       	bic	r5,	r0	
 3be:	01 00       	.word	0x0001;	????	
 3c0:	00 13       	reti			
 3c2:	e8 01       	.word	0x01e8;	????	
 3c4:	00 00       	.word	0x0000;	????	
 3c6:	fc 01       	.word	0x01fc;	????	
 3c8:	00 00       	.word	0x0000;	????	
 3ca:	14 32       	jn	$-982    	;abs 0xfff4
 3cc:	c1 98 c1 15 	cmp.b	r8,	5569(r1);0x15c1(r1)
 3d0:	fe 01       	.word	0x01fe;	????	
 3d2:	00 00       	.word	0x0000;	????	
 3d4:	10 02       	.word	0x0210;	????	
 3d6:	00 00       	.word	0x0000;	????	
 3d8:	00 00       	.word	0x0000;	????	
 3da:	14 b2 c1 2a 	bit	&0x2ac1,r4	
 3de:	c2 10       	.word	0x10c2;	????	
 3e0:	22 01       	.word	0x0122;	????	
 3e2:	00 00       	.word	0x0000;	????	
 3e4:	01 89       	sub	r9,	r1	
 3e6:	be 00       	.word	0x00be;	????	
 3e8:	00 00       	.word	0x0000;	????	
 3ea:	62 02       	.word	0x0262;	????	
 3ec:	00 00       	.word	0x0000;	????	
 3ee:	16 6c 65 6e 	addc	28261(r12),r6	;0x6e65(r12)
 3f2:	00 01       	.word	0x0100;	????	
 3f4:	8a 28       	jnc	$+278    	;abs 0x50a
 3f6:	00 00       	.word	0x0000;	????	
 3f8:	00 77       	subc	r7,	r0	
 3fa:	02 00       	.word	0x0002;	????	
 3fc:	00 00       	.word	0x0000;	????	
 3fe:	00 17       	.word	0x1700;	????	
 400:	01 2f       	jc	$-508    	;abs 0x204
 402:	00 00       	.word	0x0000;	????	
 404:	00 0a       	.word	0x0a00;	????	
 406:	03 00       	.word	0x0003;	????	
 408:	00 18       	.word	0x1800;	????	
 40a:	2f 00       	.word	0x002f;	????	
 40c:	00 00       	.word	0x0000;	????	
 40e:	00 05       	.word	0x0500;	????	
 410:	02 fa       	and	r10,	r2	
 412:	02 00       	.word	0x0002;	????	
 414:	00 19       	.word	0x1900;	????	
 416:	be 00       	.word	0x00be;	????	
 418:	00 00       	.word	0x0000;	????	
 41a:	20 03       	.word	0x0320;	????	
 41c:	00 00       	.word	0x0000;	????	
 41e:	1a 28       	jnc	$+54     	;abs 0x454
 420:	00 00       	.word	0x0000;	????	
 422:	00 01       	.word	0x0100;	????	
 424:	00 1b       	.word	0x1b00;	????	
 426:	01 75       	subc	r5,	r1	
 428:	02 00       	.word	0x0002;	????	
 42a:	00 01       	.word	0x0100;	????	
 42c:	f9 01       	.word	0x01f9;	????	
 42e:	2f 00       	.word	0x002f;	????	
 430:	00 00       	.word	0x0000;	????	
 432:	a0 c2 3e c9 	bic	#4,	-14018(r0);r2 As==10, PC rel. 0xcd72
 436:	89 02       	.word	0x0289;	????	
 438:	00 00       	.word	0x0000;	????	
 43a:	51 05       	.word	0x0551;	????	
 43c:	00 00       	.word	0x0000;	????	
 43e:	0f 2f       	jc	$-480    	;abs 0x25e
 440:	01 00       	.word	0x0001;	????	
 442:	00 01       	.word	0x0100;	????	
 444:	f9 0a       	.word	0x0af9;	????	
 446:	03 00       	.word	0x0003;	????	
 448:	00 26       	jz	$-1022   	;abs 0x4a
 44a:	03 00       	.word	0x0003;	????	
 44c:	00 0f       	.word	0x0f00;	????	
 44e:	f2 00       	.word	0x00f2;	????	
 450:	00 00       	.word	0x0000;	????	
 452:	01 f9       	and	r9,	r1	
 454:	c5 00       	.word	0x00c5;	????	
 456:	00 00       	.word	0x0000;	????	
 458:	39 03       	.word	0x0339;	????	
 45a:	00 00       	.word	0x0000;	????	
 45c:	0f 20       	jnz	$+32     	;abs 0x47c
 45e:	02 00       	.word	0x0002;	????	
 460:	00 01       	.word	0x0100;	????	
 462:	f9 e1 00 00 	xor.b	@r1+,	0(r9)	;0x0000(r9)
 466:	00 65       	addc	r5,	r0	
 468:	03 00       	.word	0x0003;	????	
 46a:	00 10       	rrc	r0		
 46c:	c7 02       	.word	0x02c7;	????	
 46e:	00 00       	.word	0x0000;	????	
 470:	01 fb       	and	r11,	r1	
 472:	2f 00       	.word	0x002f;	????	
 474:	00 00       	.word	0x0000;	????	
 476:	f5 03       	.word	0x03f5;	????	
 478:	00 00       	.word	0x0000;	????	
 47a:	1c 02       	.word	0x021c;	????	
 47c:	01 fd       	and	r13,	r1	
 47e:	8a 03       	.word	0x038a;	????	
 480:	00 00       	.word	0x0000;	????	
 482:	1d 64 01 00 	addc	1(r4),	r13	;0x0001(r4)
 486:	00 00       	.word	0x0000;	????	
 488:	1d d0 01 00 	bis	1(r0),	r13	;PC rel. 0x048b
 48c:	00 01       	.word	0x0100;	????	
 48e:	00 10       	rrc	r0		
 490:	0b 01       	.word	0x010b;	????	
 492:	00 00       	.word	0x0000;	????	
 494:	01 fd       	and	r13,	r1	
 496:	75 03       	.word	0x0375;	????	
 498:	00 00       	.word	0x0000;	????	
 49a:	1f 04       	.word	0x041f;	????	
 49c:	00 00       	.word	0x0000;	????	
 49e:	10 c7 01 00 	bic	1(r7),	r0	;0x0001(r7)
 4a2:	00 01       	.word	0x0100;	????	
 4a4:	fe 28       	jnc	$+510    	;abs 0x6a2
 4a6:	00 00       	.word	0x0000;	????	
 4a8:	00 8a       	sub	r10,	r0	
 4aa:	04 00       	.word	0x0004;	????	
 4ac:	00 10       	rrc	r0		
 4ae:	55 02       	.word	0x0255;	????	
 4b0:	00 00       	.word	0x0000;	????	
 4b2:	01 ff       	and	r15,	r1	
 4b4:	28 00       	.word	0x0028;	????	
 4b6:	00 00       	.word	0x0000;	????	
 4b8:	da 04       	.word	0x04da;	????	
 4ba:	00 00       	.word	0x0000;	????	
 4bc:	1e fe 01 00 	and	1(r14),	r14	;0x0001(r14)
 4c0:	00 01       	.word	0x0100;	????	
 4c2:	00 01       	.word	0x0100;	????	
 4c4:	cc 01       	.word	0x01cc;	????	
 4c6:	00 00       	.word	0x0000;	????	
 4c8:	03 91       	.word	0x9103;	????	Illegal as 2-op instr
 4ca:	a4 7f 1f 9b 	subc	@r15,	-25825(r4);0x9b1f(r4)
 4ce:	01 00       	.word	0x0001;	????	
 4d0:	00 01       	.word	0x0100;	????	
 4d2:	01 01       	.word	0x0101;	????	
 4d4:	c5 00       	.word	0x00c5;	????	
 4d6:	00 00       	.word	0x0000;	????	
 4d8:	06 05       	.word	0x0506;	????	
 4da:	00 00       	.word	0x0000;	????	
 4dc:	1f 5d 01 00 	add	1(r13),	r15	;0x0001(r13)
 4e0:	00 01       	.word	0x0100;	????	
 4e2:	02 01       	.word	0x0102;	????	
 4e4:	b8 00       	.word	0x00b8;	????	
 4e6:	00 00       	.word	0x0000;	????	
 4e8:	55 05       	.word	0x0555;	????	
 4ea:	00 00       	.word	0x0000;	????	
 4ec:	1f 61 02 00 	addc	2(r1),	r15	;0x0002(r1)
 4f0:	00 01       	.word	0x0100;	????	
 4f2:	03 01       	.word	0x0103;	????	
 4f4:	be 00       	.word	0x00be;	????	
 4f6:	00 00       	.word	0x0000;	????	
 4f8:	a7 05       	.word	0x05a7;	????	
 4fa:	00 00       	.word	0x0000;	????	
 4fc:	1f 33       	jn	$-448    	;abs 0x33c
 4fe:	02 00       	.word	0x0002;	????	
 500:	00 01       	.word	0x0100;	????	
 502:	04 01       	.word	0x0104;	????	
 504:	2f 00       	.word	0x002f;	????	
 506:	00 00       	.word	0x0000;	????	
 508:	22 06       	.word	0x0622;	????	
 50a:	00 00       	.word	0x0000;	????	
 50c:	1f c2 01 00 	bic	&0x0001,r15	
 510:	00 01       	.word	0x0100;	????	
 512:	05 01       	.word	0x0105;	????	
 514:	51 05       	.word	0x0551;	????	
 516:	00 00       	.word	0x0000;	????	
 518:	36 06       	.word	0x0636;	????	
 51a:	00 00       	.word	0x0000;	????	
 51c:	1f 39       	jl	$+576    	;abs 0x75c
 51e:	02 00       	.word	0x0002;	????	
 520:	00 01       	.word	0x0100;	????	
 522:	06 01       	.word	0x0106;	????	
 524:	51 05       	.word	0x0551;	????	
 526:	00 00       	.word	0x0000;	????	
 528:	72 06       	.word	0x0672;	????	
 52a:	00 00       	.word	0x0000;	????	
 52c:	1f 6b 01 00 	addc	1(r11),	r15	;0x0001(r11)
 530:	00 01       	.word	0x0100;	????	
 532:	07 01       	.word	0x0107;	????	
 534:	51 05       	.word	0x0551;	????	
 536:	00 00       	.word	0x0000;	????	
 538:	9e 06       	.word	0x069e;	????	
 53a:	00 00       	.word	0x0000;	????	
 53c:	1f 85 01 00 	sub	1(r5),	r15	;0x0001(r5)
 540:	00 01       	.word	0x0100;	????	
 542:	08 01       	.word	0x0108;	????	
 544:	51 05       	.word	0x0551;	????	
 546:	00 00       	.word	0x0000;	????	
 548:	ca 06       	.word	0x06ca;	????	
 54a:	00 00       	.word	0x0000;	????	
 54c:	20 08       	.word	0x0820;	????	
 54e:	01 09       	.word	0x0901;	????	
 550:	01 81       	sub	r1,	r1	
 552:	04 00       	.word	0x0004;	????	
 554:	00 21       	jnz	$+514    	;abs 0x756
 556:	69 31       	jn	$+724    	;abs 0x82a
 558:	36 00       	.word	0x0036;	????	
 55a:	01 0b       	.word	0x0b01;	????	
 55c:	01 3d       	jmp	$+516    	;abs 0x760
 55e:	00 00       	.word	0x0000;	????	
 560:	00 21       	jnz	$+514    	;abs 0x762
 562:	70 74       	subc.b	@r4+,	r0	
 564:	72 00       	.word	0x0072;	????	
 566:	01 0c       	.word	0x0c01;	????	
 568:	01 a6       	dadd	r6,	r1	
 56a:	00 00       	.word	0x0000;	????	
 56c:	00 21       	jnz	$+514    	;abs 0x76e
 56e:	69 33       	jn	$-300    	;abs 0x442
 570:	32 00       	.word	0x0032;	????	
 572:	01 0e       	.word	0x0e01;	????	
 574:	01 48       	mov	r8,	r1	
 576:	00 00       	.word	0x0000;	????	
 578:	00 21       	jnz	$+514    	;abs 0x77a
 57a:	69 36       	jge	$-812    	;abs 0x24e
 57c:	34 00       	.word	0x0034;	????	
 57e:	01 11       	rra	r1		
 580:	01 53       	add	#0,	r1	;r3 As==00
 582:	00 00       	.word	0x0000;	????	
 584:	00 00       	.word	0x0000;	????	
 586:	1e ec 01 00 	xor	1(r12),	r14	;0x0001(r12)
 58a:	00 01       	.word	0x0100;	????	
 58c:	13 01       	.word	0x0113;	????	
 58e:	47 04       	.word	0x0447;	????	
 590:	00 00       	.word	0x0000;	????	
 592:	02 71       	subc	r1,	r2	
 594:	1e 1e       	.word	0x1e1e;	????	
 596:	2c 02       	.word	0x022c;	????	
 598:	00 00       	.word	0x0000;	????	
 59a:	01 14       	.word	0x1401;	????	
 59c:	01 58       	add	r8,	r1	
 59e:	05 00       	.word	0x0005;	????	
 5a0:	00 03       	.word	0x0300;	????	
 5a2:	91 a8 7f 22 	dadd	8831(r8),603(r1)	;0x227f(r8), 0x025b(r1)
 5a6:	5b 02 
 5a8:	00 00       	.word	0x0000;	????	
 5aa:	01 26       	jz	$-1020   	;abs 0x1ae
 5ac:	01 24       	jz	$+4      	;abs 0x5b0
 5ae:	c3 22       	jnz	$-632    	;abs 0x336
 5b0:	ee 00       	.word	0x00ee;	????	
 5b2:	00 00       	.word	0x0000;	????	
 5b4:	01 42       	mov	r2,	r1	
 5b6:	02 ce       	bic	r14,	r2	
 5b8:	c3 22       	jnz	$-632    	;abs 0x340
 5ba:	d7 02       	.word	0x02d7;	????	
 5bc:	00 00       	.word	0x0000;	????	
 5be:	01 a7       	dadd	r7,	r1	
 5c0:	01 ea       	xor	r10,	r1	
 5c2:	c4 22       	jnz	$-630    	;abs 0x34c
 5c4:	ee 02       	.word	0x02ee;	????	
 5c6:	00 00       	.word	0x0000;	????	
 5c8:	01 f2       	and	r2,	r1	
 5ca:	01 06       	.word	0x0601;	????	
 5cc:	c6 22       	jnz	$-626    	;abs 0x35a
 5ce:	e6 01       	.word	0x01e6;	????	
 5d0:	00 00       	.word	0x0000;	????	
 5d2:	01 d8       	bis	r8,	r1	
 5d4:	01 78       	subc	r8,	r1	
 5d6:	c5 23       	jnz	$-116    	;abs 0x562
 5d8:	00 00       	.word	0x0000;	????	
 5da:	00 00       	.word	0x0000;	????	
 5dc:	ec 04       	.word	0x04ec;	????	
 5de:	00 00       	.word	0x0000;	????	
 5e0:	1f 4e 02 00 	mov	2(r14),	r15	;0x0002(r14)
 5e4:	00 01       	.word	0x0100;	????	
 5e6:	33 02       	.word	0x0233;	????	
 5e8:	2f 00       	.word	0x002f;	????	
 5ea:	00 00       	.word	0x0000;	????	
 5ec:	f6 06       	.word	0x06f6;	????	
 5ee:	00 00       	.word	0x0000;	????	
 5f0:	00 23       	jnz	$-510    	;abs 0x3f2
 5f2:	0c 00       	.word	0x000c;	????	
 5f4:	00 00       	.word	0x0000;	????	
 5f6:	06 05       	.word	0x0506;	????	
 5f8:	00 00       	.word	0x0000;	????	
 5fa:	24 76       	subc	@r6,	r4	
 5fc:	61 6c       	addc.b	@r12,	r1	
 5fe:	00 01       	.word	0x0100;	????	
 600:	6f 01       	.word	0x016f;	????	
 602:	2f 00       	.word	0x002f;	????	
 604:	00 00       	.word	0x0000;	????	
 606:	01 07       	.word	0x0701;	????	
 608:	00 00       	.word	0x0000;	????	
 60a:	00 25       	jz	$+514    	;abs 0x80c
 60c:	b8 c6 50 c7 	bic	@r6+,	-14512(r8);0xc750(r8)
 610:	20 05       	.word	0x0520;	????	
 612:	00 00       	.word	0x0000;	????	
 614:	1f c1 02 00 	bic	2(r1),	r15	;0x0002(r1)
 618:	00 01       	.word	0x0100;	????	
 61a:	20 02       	.word	0x0220;	????	
 61c:	2f 00       	.word	0x002f;	????	
 61e:	00 00       	.word	0x0000;	????	
 620:	1c 07       	.word	0x071c;	????	
 622:	00 00       	.word	0x0000;	????	
 624:	00 25       	jz	$+514    	;abs 0x826
 626:	84 c7 e0 c7 	bic	r7,	-14368(r4);0xc7e0(r4)
 62a:	3a 05       	.word	0x053a;	????	
 62c:	00 00       	.word	0x0000;	????	
 62e:	1f c1 02 00 	bic	2(r1),	r15	;0x0002(r1)
 632:	00 01       	.word	0x0100;	????	
 634:	25 02       	.word	0x0225;	????	
 636:	2f 00       	.word	0x002f;	????	
 638:	00 00       	.word	0x0000;	????	
 63a:	27 07       	.word	0x0727;	????	
 63c:	00 00       	.word	0x0000;	????	
 63e:	00 14       	.word	0x1400;	????	
 640:	fc c7 42 c8 	bic.b	@r7+,	-14270(r12);0xc842(r12)
 644:	1f c1 02 00 	bic	2(r1),	r15	;0x0002(r1)
 648:	00 01       	.word	0x0100;	????	
 64a:	28 02       	.word	0x0228;	????	
 64c:	2f 00       	.word	0x002f;	????	
 64e:	00 00       	.word	0x0000;	????	
 650:	32 07       	.word	0x0732;	????	
 652:	00 00       	.word	0x0000;	????	
 654:	00 00       	.word	0x0000;	????	
 656:	02 01       	.word	0x0102;	????	
 658:	02 48       	mov	r8,	r2	
 65a:	02 00       	.word	0x0002;	????	
 65c:	00 26       	jz	$-1022   	;abs 0x25e
 65e:	be 00       	.word	0x00be;	????	
 660:	00 00       	.word	0x0000;	????	
 662:	1a 28       	jnc	$+54     	;abs 0x698
 664:	00 00       	.word	0x0000;	????	
 666:	00 17       	.word	0x1700;	????	
 668:	00 00       	.word	0x0000;	????	
 66a:	e0 00       	.word	0x00e0;	????	
 66c:	00 00       	.word	0x0000;	????	
 66e:	02 00       	.word	0x0002;	????	
 670:	bf 02       	.word	0x02bf;	????	
 672:	00 00       	.word	0x0000;	????	
 674:	02 01       	.word	0x0102;	????	
 676:	44 03       	.word	0x0344;	????	
 678:	00 00       	.word	0x0000;	????	
 67a:	3e c9       	bic	@r9+,	r14	
 67c:	60 c9       	bic.b	@r9,	r0	
 67e:	2f 62       	addc	#4,	r15	;r2 As==10
 680:	75 69       	addc.b	@r9+,	r5	
 682:	6c 64       	addc.b	@r4,	r12	
 684:	2f 67       	addc	@r7,	r15	
 686:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 688:	2d 6d       	addc	@r13,	r13	
 68a:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 68c:	34 33       	jn	$-406    	;abs 0x4f6
 68e:	30 2d       	jc	$+610    	;abs 0x8f0
 690:	67 52       	add.b	#4,	r7	;r2 As==10
 692:	42 52       	rla.b	r2		
 694:	52 6f 2f 67 	addc.b	26415(r15),r2	;0x672f(r15)
 698:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 69a:	2d 6d       	addc	@r13,	r13	
 69c:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 69e:	34 33       	jn	$-406    	;abs 0x508
 6a0:	30 2d       	jc	$+610    	;abs 0x902
 6a2:	34 2e       	jc	$-918    	;abs 0x30c
 6a4:	36 2e       	jc	$-914    	;abs 0x312
 6a6:	33 7e       	.word	0x7e33;	????	Illegal as 2-op instr
 6a8:	6d 73       	subc.b	#2,	r13	;r3 As==10
 6aa:	70 67       	addc.b	@r7+,	r0	
 6ac:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 6ae:	2d 32       	jn	$-932    	;abs 0x30a
 6b0:	30 31       	jn	$+610    	;abs 0x912
 6b2:	32 30       	jn	$+102    	;abs 0x718
 6b4:	34 30       	jn	$+106    	;abs 0x71e
 6b6:	36 2f       	jc	$-402    	;abs 0x524
 6b8:	2e 2f       	jc	$-418    	;abs 0x516
 6ba:	67 63       	addc.b	#2,	r7	;r3 As==10
 6bc:	63 2d       	jc	$+712    	;abs 0x984
 6be:	34 2e       	jc	$-918    	;abs 0x328
 6c0:	36 2e       	jc	$-914    	;abs 0x32e
 6c2:	33 2f       	jc	$-408    	;abs 0x52a
 6c4:	6c 69       	addc.b	@r9,	r12	
 6c6:	62 67       	addc.b	@r7,	r2	
 6c8:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 6ca:	2f 2e       	jc	$-928    	;abs 0x32a
 6cc:	2e 2f       	jc	$-418    	;abs 0x52a
 6ce:	67 63       	addc.b	#2,	r7	;r3 As==10
 6d0:	63 2f       	jc	$-312    	;abs 0x598
 6d2:	63 6f       	.word	0x6f63;	????	Illegal as 2-op instr
 6d4:	6e 66       	addc.b	@r6,	r14	
 6d6:	69 67       	addc.b	@r7,	r9	
 6d8:	2f 6d       	addc	@r13,	r15	
 6da:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 6dc:	34 33       	jn	$-406    	;abs 0x546
 6de:	30 2f       	jc	$-414    	;abs 0x540
 6e0:	6c 69       	addc.b	@r9,	r12	
 6e2:	62 67       	addc.b	@r7,	r2	
 6e4:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 6e6:	2e 53       	incd	r14		
 6e8:	00 2f       	jc	$-510    	;abs 0x4ea
 6ea:	62 75       	subc.b	@r5,	r2	
 6ec:	69 6c       	addc.b	@r12,	r9	
 6ee:	64 2f       	jc	$-310    	;abs 0x5b8
 6f0:	67 63       	addc.b	#2,	r7	;r3 As==10
 6f2:	63 2d       	jc	$+712    	;abs 0x9ba
 6f4:	6d 73       	subc.b	#2,	r13	;r3 As==10
 6f6:	70 34       	jge	$+226    	;abs 0x7d8
 6f8:	33 30       	jn	$+104    	;abs 0x760
 6fa:	2d 67       	addc	@r7,	r13	
 6fc:	52 42 52 52 	mov.b	&0x5252,r2	
 700:	6f 2f       	jc	$-288    	;abs 0x5e0
 702:	67 63       	addc.b	#2,	r7	;r3 As==10
 704:	63 2d       	jc	$+712    	;abs 0x9cc
 706:	6d 73       	subc.b	#2,	r13	;r3 As==10
 708:	70 34       	jge	$+226    	;abs 0x7ea
 70a:	33 30       	jn	$+104    	;abs 0x772
 70c:	2d 34       	jge	$+92     	;abs 0x768
 70e:	2e 36       	jge	$-930    	;abs 0x36c
 710:	2e 33       	jn	$-418    	;abs 0x56e
 712:	7e 6d       	addc.b	@r13+,	r14	
 714:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 716:	67 63       	addc.b	#2,	r7	;r3 As==10
 718:	63 2d       	jc	$+712    	;abs 0x9e0
 71a:	32 30       	jn	$+102    	;abs 0x780
 71c:	31 32       	jn	$-924    	;abs 0x380
 71e:	30 34       	jge	$+98     	;abs 0x780
 720:	30 36       	jge	$-926    	;abs 0x382
 722:	2f 62       	addc	#4,	r15	;r2 As==10
 724:	75 69       	addc.b	@r9+,	r5	
 726:	6c 64       	addc.b	@r4,	r12	
 728:	2d 72       	subc	#4,	r13	;r2 As==10
 72a:	65 73       	subc.b	#2,	r5	;r3 As==10
 72c:	75 6c       	addc.b	@r12+,	r5	
 72e:	74 2f       	jc	$-278    	;abs 0x618
 730:	6d 73       	subc.b	#2,	r13	;r3 As==10
 732:	70 34       	jge	$+226    	;abs 0x814
 734:	33 30       	jn	$+104    	;abs 0x79c
 736:	2f 6c       	addc	@r12,	r15	
 738:	69 62       	addc.b	#4,	r9	;r2 As==10
 73a:	67 63       	addc.b	#2,	r7	;r3 As==10
 73c:	63 00       	.word	0x0063;	????	
 73e:	47 4e       	mov.b	r14,	r7	
 740:	55 20       	jnz	$+172    	;abs 0x7ec
 742:	41 53       	add.b	#0,	r1	;r3 As==00
 744:	20 32       	jn	$-958    	;abs 0x386
 746:	2e 32       	jn	$-930    	;abs 0x3a4
 748:	31 2e       	jc	$-924    	;abs 0x3ac
 74a:	31 00       	.word	0x0031;	????	
 74c:	01 80       	sub	r0,	r1	
 74e:	e0 00       	.word	0x00e0;	????	
 750:	00 00       	.word	0x0000;	????	
 752:	02 00       	.word	0x0002;	????	
 754:	d3 02       	.word	0x02d3;	????	
 756:	00 00       	.word	0x0000;	????	
 758:	02 01       	.word	0x0102;	????	
 75a:	eb 03       	.word	0x03eb;	????	
 75c:	00 00       	.word	0x0000;	????	
 75e:	60 c9       	bic.b	@r9,	r0	
 760:	a0 c9 2f 62 	bic	@r9,	25135(r0);PC rel. 0x6991
 764:	75 69       	addc.b	@r9+,	r5	
 766:	6c 64       	addc.b	@r4,	r12	
 768:	2f 67       	addc	@r7,	r15	
 76a:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 76c:	2d 6d       	addc	@r13,	r13	
 76e:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 770:	34 33       	jn	$-406    	;abs 0x5da
 772:	30 2d       	jc	$+610    	;abs 0x9d4
 774:	67 52       	add.b	#4,	r7	;r2 As==10
 776:	42 52       	rla.b	r2		
 778:	52 6f 2f 67 	addc.b	26415(r15),r2	;0x672f(r15)
 77c:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 77e:	2d 6d       	addc	@r13,	r13	
 780:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 782:	34 33       	jn	$-406    	;abs 0x5ec
 784:	30 2d       	jc	$+610    	;abs 0x9e6
 786:	34 2e       	jc	$-918    	;abs 0x3f0
 788:	36 2e       	jc	$-914    	;abs 0x3f6
 78a:	33 7e       	.word	0x7e33;	????	Illegal as 2-op instr
 78c:	6d 73       	subc.b	#2,	r13	;r3 As==10
 78e:	70 67       	addc.b	@r7+,	r0	
 790:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 792:	2d 32       	jn	$-932    	;abs 0x3ee
 794:	30 31       	jn	$+610    	;abs 0x9f6
 796:	32 30       	jn	$+102    	;abs 0x7fc
 798:	34 30       	jn	$+106    	;abs 0x802
 79a:	36 2f       	jc	$-402    	;abs 0x608
 79c:	2e 2f       	jc	$-418    	;abs 0x5fa
 79e:	67 63       	addc.b	#2,	r7	;r3 As==10
 7a0:	63 2d       	jc	$+712    	;abs 0xa68
 7a2:	34 2e       	jc	$-918    	;abs 0x40c
 7a4:	36 2e       	jc	$-914    	;abs 0x412
 7a6:	33 2f       	jc	$-408    	;abs 0x60e
 7a8:	6c 69       	addc.b	@r9,	r12	
 7aa:	62 67       	addc.b	@r7,	r2	
 7ac:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 7ae:	2f 2e       	jc	$-928    	;abs 0x40e
 7b0:	2e 2f       	jc	$-418    	;abs 0x60e
 7b2:	67 63       	addc.b	#2,	r7	;r3 As==10
 7b4:	63 2f       	jc	$-312    	;abs 0x67c
 7b6:	63 6f       	.word	0x6f63;	????	Illegal as 2-op instr
 7b8:	6e 66       	addc.b	@r6,	r14	
 7ba:	69 67       	addc.b	@r7,	r9	
 7bc:	2f 6d       	addc	@r13,	r15	
 7be:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 7c0:	34 33       	jn	$-406    	;abs 0x62a
 7c2:	30 2f       	jc	$-414    	;abs 0x624
 7c4:	6c 69       	addc.b	@r9,	r12	
 7c6:	62 67       	addc.b	@r7,	r2	
 7c8:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 7ca:	2e 53       	incd	r14		
 7cc:	00 2f       	jc	$-510    	;abs 0x5ce
 7ce:	62 75       	subc.b	@r5,	r2	
 7d0:	69 6c       	addc.b	@r12,	r9	
 7d2:	64 2f       	jc	$-310    	;abs 0x69c
 7d4:	67 63       	addc.b	#2,	r7	;r3 As==10
 7d6:	63 2d       	jc	$+712    	;abs 0xa9e
 7d8:	6d 73       	subc.b	#2,	r13	;r3 As==10
 7da:	70 34       	jge	$+226    	;abs 0x8bc
 7dc:	33 30       	jn	$+104    	;abs 0x844
 7de:	2d 67       	addc	@r7,	r13	
 7e0:	52 42 52 52 	mov.b	&0x5252,r2	
 7e4:	6f 2f       	jc	$-288    	;abs 0x6c4
 7e6:	67 63       	addc.b	#2,	r7	;r3 As==10
 7e8:	63 2d       	jc	$+712    	;abs 0xab0
 7ea:	6d 73       	subc.b	#2,	r13	;r3 As==10
 7ec:	70 34       	jge	$+226    	;abs 0x8ce
 7ee:	33 30       	jn	$+104    	;abs 0x856
 7f0:	2d 34       	jge	$+92     	;abs 0x84c
 7f2:	2e 36       	jge	$-930    	;abs 0x450
 7f4:	2e 33       	jn	$-418    	;abs 0x652
 7f6:	7e 6d       	addc.b	@r13+,	r14	
 7f8:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 7fa:	67 63       	addc.b	#2,	r7	;r3 As==10
 7fc:	63 2d       	jc	$+712    	;abs 0xac4
 7fe:	32 30       	jn	$+102    	;abs 0x864
 800:	31 32       	jn	$-924    	;abs 0x464
 802:	30 34       	jge	$+98     	;abs 0x864
 804:	30 36       	jge	$-926    	;abs 0x466
 806:	2f 62       	addc	#4,	r15	;r2 As==10
 808:	75 69       	addc.b	@r9+,	r5	
 80a:	6c 64       	addc.b	@r4,	r12	
 80c:	2d 72       	subc	#4,	r13	;r2 As==10
 80e:	65 73       	subc.b	#2,	r5	;r3 As==10
 810:	75 6c       	addc.b	@r12+,	r5	
 812:	74 2f       	jc	$-278    	;abs 0x6fc
 814:	6d 73       	subc.b	#2,	r13	;r3 As==10
 816:	70 34       	jge	$+226    	;abs 0x8f8
 818:	33 30       	jn	$+104    	;abs 0x880
 81a:	2f 6c       	addc	@r12,	r15	
 81c:	69 62       	addc.b	#4,	r9	;r2 As==10
 81e:	67 63       	addc.b	#2,	r7	;r3 As==10
 820:	63 00       	.word	0x0063;	????	
 822:	47 4e       	mov.b	r14,	r7	
 824:	55 20       	jnz	$+172    	;abs 0x8d0
 826:	41 53       	add.b	#0,	r1	;r3 As==00
 828:	20 32       	jn	$-958    	;abs 0x46a
 82a:	2e 32       	jn	$-930    	;abs 0x488
 82c:	31 2e       	jc	$-924    	;abs 0x490
 82e:	31 00       	.word	0x0031;	????	
 830:	01 80       	sub	r0,	r1	
 832:	e0 00       	.word	0x00e0;	????	
 834:	00 00       	.word	0x0000;	????	
 836:	02 00       	.word	0x0002;	????	
 838:	e7 02       	.word	0x02e7;	????	
 83a:	00 00       	.word	0x0000;	????	
 83c:	02 01       	.word	0x0102;	????	
 83e:	a1 04       	.word	0x04a1;	????	
 840:	00 00       	.word	0x0000;	????	
 842:	a0 c9 90 ca 	bic	@r9,	-13680(r0);PC rel. 0xd2d4
 846:	2f 62       	addc	#4,	r15	;r2 As==10
 848:	75 69       	addc.b	@r9+,	r5	
 84a:	6c 64       	addc.b	@r4,	r12	
 84c:	2f 67       	addc	@r7,	r15	
 84e:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 850:	2d 6d       	addc	@r13,	r13	
 852:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 854:	34 33       	jn	$-406    	;abs 0x6be
 856:	30 2d       	jc	$+610    	;abs 0xab8
 858:	67 52       	add.b	#4,	r7	;r2 As==10
 85a:	42 52       	rla.b	r2		
 85c:	52 6f 2f 67 	addc.b	26415(r15),r2	;0x672f(r15)
 860:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 862:	2d 6d       	addc	@r13,	r13	
 864:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 866:	34 33       	jn	$-406    	;abs 0x6d0
 868:	30 2d       	jc	$+610    	;abs 0xaca
 86a:	34 2e       	jc	$-918    	;abs 0x4d4
 86c:	36 2e       	jc	$-914    	;abs 0x4da
 86e:	33 7e       	.word	0x7e33;	????	Illegal as 2-op instr
 870:	6d 73       	subc.b	#2,	r13	;r3 As==10
 872:	70 67       	addc.b	@r7+,	r0	
 874:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 876:	2d 32       	jn	$-932    	;abs 0x4d2
 878:	30 31       	jn	$+610    	;abs 0xada
 87a:	32 30       	jn	$+102    	;abs 0x8e0
 87c:	34 30       	jn	$+106    	;abs 0x8e6
 87e:	36 2f       	jc	$-402    	;abs 0x6ec
 880:	2e 2f       	jc	$-418    	;abs 0x6de
 882:	67 63       	addc.b	#2,	r7	;r3 As==10
 884:	63 2d       	jc	$+712    	;abs 0xb4c
 886:	34 2e       	jc	$-918    	;abs 0x4f0
 888:	36 2e       	jc	$-914    	;abs 0x4f6
 88a:	33 2f       	jc	$-408    	;abs 0x6f2
 88c:	6c 69       	addc.b	@r9,	r12	
 88e:	62 67       	addc.b	@r7,	r2	
 890:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 892:	2f 2e       	jc	$-928    	;abs 0x4f2
 894:	2e 2f       	jc	$-418    	;abs 0x6f2
 896:	67 63       	addc.b	#2,	r7	;r3 As==10
 898:	63 2f       	jc	$-312    	;abs 0x760
 89a:	63 6f       	.word	0x6f63;	????	Illegal as 2-op instr
 89c:	6e 66       	addc.b	@r6,	r14	
 89e:	69 67       	addc.b	@r7,	r9	
 8a0:	2f 6d       	addc	@r13,	r15	
 8a2:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 8a4:	34 33       	jn	$-406    	;abs 0x70e
 8a6:	30 2f       	jc	$-414    	;abs 0x708
 8a8:	6c 69       	addc.b	@r9,	r12	
 8aa:	62 67       	addc.b	@r7,	r2	
 8ac:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 8ae:	2e 53       	incd	r14		
 8b0:	00 2f       	jc	$-510    	;abs 0x6b2
 8b2:	62 75       	subc.b	@r5,	r2	
 8b4:	69 6c       	addc.b	@r12,	r9	
 8b6:	64 2f       	jc	$-310    	;abs 0x780
 8b8:	67 63       	addc.b	#2,	r7	;r3 As==10
 8ba:	63 2d       	jc	$+712    	;abs 0xb82
 8bc:	6d 73       	subc.b	#2,	r13	;r3 As==10
 8be:	70 34       	jge	$+226    	;abs 0x9a0
 8c0:	33 30       	jn	$+104    	;abs 0x928
 8c2:	2d 67       	addc	@r7,	r13	
 8c4:	52 42 52 52 	mov.b	&0x5252,r2	
 8c8:	6f 2f       	jc	$-288    	;abs 0x7a8
 8ca:	67 63       	addc.b	#2,	r7	;r3 As==10
 8cc:	63 2d       	jc	$+712    	;abs 0xb94
 8ce:	6d 73       	subc.b	#2,	r13	;r3 As==10
 8d0:	70 34       	jge	$+226    	;abs 0x9b2
 8d2:	33 30       	jn	$+104    	;abs 0x93a
 8d4:	2d 34       	jge	$+92     	;abs 0x930
 8d6:	2e 36       	jge	$-930    	;abs 0x534
 8d8:	2e 33       	jn	$-418    	;abs 0x736
 8da:	7e 6d       	addc.b	@r13+,	r14	
 8dc:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 8de:	67 63       	addc.b	#2,	r7	;r3 As==10
 8e0:	63 2d       	jc	$+712    	;abs 0xba8
 8e2:	32 30       	jn	$+102    	;abs 0x948
 8e4:	31 32       	jn	$-924    	;abs 0x548
 8e6:	30 34       	jge	$+98     	;abs 0x948
 8e8:	30 36       	jge	$-926    	;abs 0x54a
 8ea:	2f 62       	addc	#4,	r15	;r2 As==10
 8ec:	75 69       	addc.b	@r9+,	r5	
 8ee:	6c 64       	addc.b	@r4,	r12	
 8f0:	2d 72       	subc	#4,	r13	;r2 As==10
 8f2:	65 73       	subc.b	#2,	r5	;r3 As==10
 8f4:	75 6c       	addc.b	@r12+,	r5	
 8f6:	74 2f       	jc	$-278    	;abs 0x7e0
 8f8:	6d 73       	subc.b	#2,	r13	;r3 As==10
 8fa:	70 34       	jge	$+226    	;abs 0x9dc
 8fc:	33 30       	jn	$+104    	;abs 0x964
 8fe:	2f 6c       	addc	@r12,	r15	
 900:	69 62       	addc.b	#4,	r9	;r2 As==10
 902:	67 63       	addc.b	#2,	r7	;r3 As==10
 904:	63 00       	.word	0x0063;	????	
 906:	47 4e       	mov.b	r14,	r7	
 908:	55 20       	jnz	$+172    	;abs 0x9b4
 90a:	41 53       	add.b	#0,	r1	;r3 As==00
 90c:	20 32       	jn	$-958    	;abs 0x54e
 90e:	2e 32       	jn	$-930    	;abs 0x56c
 910:	31 2e       	jc	$-924    	;abs 0x574
 912:	31 00       	.word	0x0031;	????	
 914:	01 80       	sub	r0,	r1	

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11       	rra	r1		
   2:	01 25       	jz	$+516    	;abs 0x206
   4:	0e 13       	reti			;return from interupt
   6:	0b 03       	.word	0x030b;	????	
   8:	0e 1b       	.word	0x1b0e;	????	
   a:	0e 11       	rra	r14		
   c:	01 12       	push	r1		
   e:	01 10       	rrc	r1		
  10:	06 00       	.word	0x0006;	????	
  12:	00 02       	.word	0x0200;	????	
  14:	24 00       	.word	0x0024;	????	
  16:	0b 0b       	.word	0x0b0b;	????	
  18:	3e 0b       	.word	0x0b3e;	????	
  1a:	03 0e       	.word	0x0e03;	????	
  1c:	00 00       	.word	0x0000;	????	
  1e:	03 24       	jz	$+8      	;abs 0x26
  20:	00 0b       	.word	0x0b00;	????	
  22:	0b 3e       	jmp	$-1000   	;abs 0xfc3a
  24:	0b 03       	.word	0x030b;	????	
  26:	08 00       	.word	0x0008;	????	
  28:	00 04       	.word	0x0400;	????	
  2a:	0f 00       	.word	0x000f;	????	
  2c:	0b 0b       	.word	0x0b0b;	????	
  2e:	49 13       	.word	0x1349;	????	
  30:	00 00       	.word	0x0000;	????	
  32:	05 26       	jz	$-1012   	;abs 0xfc3e
  34:	00 49       	br	r9		
  36:	13 00       	.word	0x0013;	????	
  38:	00 06       	.word	0x0600;	????	
  3a:	16 00       	.word	0x0016;	????	
  3c:	03 0e       	.word	0x0e03;	????	
  3e:	3a 0b       	.word	0x0b3a;	????	
  40:	3b 0b       	.word	0x0b3b;	????	
  42:	49 13       	.word	0x1349;	????	
  44:	00 00       	.word	0x0000;	????	
  46:	07 0f       	.word	0x0f07;	????	
  48:	00 0b       	.word	0x0b00;	????	
  4a:	0b 03       	.word	0x030b;	????	
  4c:	0e 00       	.word	0x000e;	????	
  4e:	00 08       	.word	0x0800;	????	
  50:	2e 01       	.word	0x012e;	????	
  52:	3f 0c       	.word	0x0c3f;	????	
  54:	03 0e       	.word	0x0e03;	????	
  56:	3a 0b       	.word	0x0b3a;	????	
  58:	3b 0b       	.word	0x0b3b;	????	
  5a:	27 0c       	.word	0x0c27;	????	
  5c:	49 13       	.word	0x1349;	????	
  5e:	11 01       	.word	0x0111;	????	
  60:	12 01       	.word	0x0112;	????	
  62:	40 0a       	.word	0x0a40;	????	
  64:	01 13       	reti			;return from interupt
  66:	00 00       	.word	0x0000;	????	
  68:	09 05       	.word	0x0509;	????	
  6a:	00 03       	.word	0x0300;	????	
  6c:	08 3a       	jl	$-1006   	;abs 0xfc7e
  6e:	0b 3b       	jl	$-488    	;abs 0xfe86
  70:	0b 49       	mov	r9,	r11	
  72:	13 02       	.word	0x0213;	????	
  74:	0a 00       	.word	0x000a;	????	
  76:	00 0a       	.word	0x0a00;	????	
  78:	18 00       	.word	0x0018;	????	
  7a:	00 00       	.word	0x0000;	????	
  7c:	0b 34       	jge	$+24     	;abs 0x94
  7e:	00 03       	.word	0x0300;	????	
  80:	0e 3a       	jl	$-994    	;abs 0xfc9e
  82:	0b 3b       	jl	$-488    	;abs 0xfe9a
  84:	0b 49       	mov	r9,	r11	
  86:	13 02       	.word	0x0213;	????	
  88:	06 00       	.word	0x0006;	????	
  8a:	00 0c       	.word	0x0c00;	????	
  8c:	34 00       	.word	0x0034;	????	
  8e:	03 08       	.word	0x0803;	????	
  90:	3a 0b       	.word	0x0b3a;	????	
  92:	3b 0b       	.word	0x0b3b;	????	
  94:	49 13       	.word	0x1349;	????	
  96:	02 0a       	.word	0x0a02;	????	
  98:	00 00       	.word	0x0000;	????	
  9a:	0d 2e       	jc	$-996    	;abs 0xfcb6
  9c:	01 3f       	jmp	$-508    	;abs 0xfea0
  9e:	0c 03       	.word	0x030c;	????	
  a0:	0e 3a       	jl	$-994    	;abs 0xfcbe
  a2:	0b 3b       	jl	$-488    	;abs 0xfeba
  a4:	0b 27       	jz	$-488    	;abs 0xfebc
  a6:	0c 49       	mov	r9,	r12	
  a8:	13 11       	rra	#1		;r3 As==01
  aa:	01 12       	push	r1		
  ac:	01 40       	mov	r0,	r1	
  ae:	0a 00       	.word	0x000a;	????	
  b0:	00 0e       	.word	0x0e00;	????	
  b2:	05 00       	.word	0x0005;	????	
  b4:	03 08       	.word	0x0803;	????	
  b6:	3a 0b       	.word	0x0b3a;	????	
  b8:	3b 0b       	.word	0x0b3b;	????	
  ba:	49 13       	.word	0x1349;	????	
  bc:	02 06       	.word	0x0602;	????	
  be:	00 00       	.word	0x0000;	????	
  c0:	0f 05       	.word	0x050f;	????	
  c2:	00 03       	.word	0x0300;	????	
  c4:	0e 3a       	jl	$-994    	;abs 0xfce2
  c6:	0b 3b       	jl	$-488    	;abs 0xfede
  c8:	0b 49       	mov	r9,	r11	
  ca:	13 02       	.word	0x0213;	????	
  cc:	06 00       	.word	0x0006;	????	
  ce:	00 00       	.word	0x0000;	????	
  d0:	01 11       	rra	r1		
  d2:	01 25       	jz	$+516    	;abs 0x2d6
  d4:	0e 13       	reti			;return from interupt
  d6:	0b 03       	.word	0x030b;	????	
  d8:	0e 1b       	.word	0x1b0e;	????	
  da:	0e 11       	rra	r14		
  dc:	01 12       	push	r1		
  de:	01 10       	rrc	r1		
  e0:	06 00       	.word	0x0006;	????	
  e2:	00 02       	.word	0x0200;	????	
  e4:	24 00       	.word	0x0024;	????	
  e6:	0b 0b       	.word	0x0b0b;	????	
  e8:	3e 0b       	.word	0x0b3e;	????	
  ea:	03 0e       	.word	0x0e03;	????	
  ec:	00 00       	.word	0x0000;	????	
  ee:	03 24       	jz	$+8      	;abs 0xf6
  f0:	00 0b       	.word	0x0b00;	????	
  f2:	0b 3e       	jmp	$-1000   	;abs 0xfd0a
  f4:	0b 03       	.word	0x030b;	????	
  f6:	08 00       	.word	0x0008;	????	
  f8:	00 04       	.word	0x0400;	????	
  fa:	16 00       	.word	0x0016;	????	
  fc:	03 0e       	.word	0x0e03;	????	
  fe:	3a 0b       	.word	0x0b3a;	????	
 100:	3b 0b       	.word	0x0b3b;	????	
 102:	49 13       	.word	0x1349;	????	
 104:	00 00       	.word	0x0000;	????	
 106:	05 0f       	.word	0x0f05;	????	
 108:	00 0b       	.word	0x0b00;	????	
 10a:	0b 49       	mov	r9,	r11	
 10c:	13 00       	.word	0x0013;	????	
 10e:	00 06       	.word	0x0600;	????	
 110:	26 00       	.word	0x0026;	????	
 112:	49 13       	.word	0x1349;	????	
 114:	00 00       	.word	0x0000;	????	
 116:	07 0f       	.word	0x0f07;	????	
 118:	00 0b       	.word	0x0b00;	????	
 11a:	0b 03       	.word	0x030b;	????	
 11c:	0e 00       	.word	0x000e;	????	
 11e:	00 08       	.word	0x0800;	????	
 120:	13 01       	.word	0x0113;	????	
 122:	0b 0b       	.word	0x0b0b;	????	
 124:	3a 0b       	.word	0x0b3a;	????	
 126:	3b 0b       	.word	0x0b3b;	????	
 128:	01 13       	reti			;return from interupt
 12a:	00 00       	.word	0x0000;	????	
 12c:	09 0d       	.word	0x0d09;	????	
 12e:	00 03       	.word	0x0300;	????	
 130:	0e 3a       	jl	$-994    	;abs 0xfd4e
 132:	0b 3b       	jl	$-488    	;abs 0xff4a
 134:	0b 49       	mov	r9,	r11	
 136:	13 0b       	.word	0x0b13;	????	
 138:	0b 0d       	.word	0x0d0b;	????	
 13a:	0b 0c       	.word	0x0c0b;	????	
 13c:	0b 38       	jl	$+24     	;abs 0x154
 13e:	0a 00       	.word	0x000a;	????	
 140:	00 0a       	.word	0x0a00;	????	
 142:	0d 00       	.word	0x000d;	????	
 144:	03 0e       	.word	0x0e03;	????	
 146:	3a 0b       	.word	0x0b3a;	????	
 148:	3b 0b       	.word	0x0b3b;	????	
 14a:	49 13       	.word	0x1349;	????	
 14c:	38 0a       	.word	0x0a38;	????	
 14e:	00 00       	.word	0x0000;	????	
 150:	0b 2e       	jc	$-1000   	;abs 0xfd68
 152:	01 03       	.word	0x0301;	????	
 154:	0e 3a       	jl	$-994    	;abs 0xfd72
 156:	0b 3b       	jl	$-488    	;abs 0xff6e
 158:	0b 27       	jz	$-488    	;abs 0xff70
 15a:	0c 49       	mov	r9,	r12	
 15c:	13 20       	jnz	$+40     	;abs 0x184
 15e:	0b 01       	.word	0x010b;	????	
 160:	13 00       	.word	0x0013;	????	
 162:	00 0c       	.word	0x0c00;	????	
 164:	05 00       	.word	0x0005;	????	
 166:	03 0e       	.word	0x0e03;	????	
 168:	3a 0b       	.word	0x0b3a;	????	
 16a:	3b 0b       	.word	0x0b3b;	????	
 16c:	49 13       	.word	0x1349;	????	
 16e:	00 00       	.word	0x0000;	????	
 170:	0d 34       	jge	$+28     	;abs 0x18c
 172:	00 03       	.word	0x0300;	????	
 174:	08 3a       	jl	$-1006   	;abs 0xfd86
 176:	0b 3b       	jl	$-488    	;abs 0xff8e
 178:	0b 49       	mov	r9,	r11	
 17a:	13 00       	.word	0x0013;	????	
 17c:	00 0e       	.word	0x0e00;	????	
 17e:	2e 01       	.word	0x012e;	????	
 180:	03 0e       	.word	0x0e03;	????	
 182:	3a 0b       	.word	0x0b3a;	????	
 184:	3b 0b       	.word	0x0b3b;	????	
 186:	27 0c       	.word	0x0c27;	????	
 188:	49 13       	.word	0x1349;	????	
 18a:	11 01       	.word	0x0111;	????	
 18c:	12 01       	.word	0x0112;	????	
 18e:	40 06       	.word	0x0640;	????	
 190:	01 13       	reti			;return from interupt
 192:	00 00       	.word	0x0000;	????	
 194:	0f 05       	.word	0x050f;	????	
 196:	00 03       	.word	0x0300;	????	
 198:	0e 3a       	jl	$-994    	;abs 0xfdb6
 19a:	0b 3b       	jl	$-488    	;abs 0xffb2
 19c:	0b 49       	mov	r9,	r11	
 19e:	13 02       	.word	0x0213;	????	
 1a0:	06 00       	.word	0x0006;	????	
 1a2:	00 10       	rrc	r0		
 1a4:	34 00       	.word	0x0034;	????	
 1a6:	03 0e       	.word	0x0e03;	????	
 1a8:	3a 0b       	.word	0x0b3a;	????	
 1aa:	3b 0b       	.word	0x0b3b;	????	
 1ac:	49 13       	.word	0x1349;	????	
 1ae:	02 06       	.word	0x0602;	????	
 1b0:	00 00       	.word	0x0000;	????	
 1b2:	11 34       	jge	$+36     	;abs 0x1d6
 1b4:	00 03       	.word	0x0300;	????	
 1b6:	0e 3a       	jl	$-994    	;abs 0xfdd4
 1b8:	0b 3b       	jl	$-488    	;abs 0xffd0
 1ba:	0b 49       	mov	r9,	r11	
 1bc:	13 02       	.word	0x0213;	????	
 1be:	0a 00       	.word	0x000a;	????	
 1c0:	00 12       	push	r0		
 1c2:	1d 01       	.word	0x011d;	????	
 1c4:	31 13       	reti			;return from interupt
 1c6:	11 01       	.word	0x0111;	????	
 1c8:	12 01       	.word	0x0112;	????	
 1ca:	58 0b       	.word	0x0b58;	????	
 1cc:	59 0b       	.word	0x0b59;	????	
 1ce:	01 13       	reti			;return from interupt
 1d0:	00 00       	.word	0x0000;	????	
 1d2:	13 05       	.word	0x0513;	????	
 1d4:	00 31       	jn	$+514    	;abs 0x3d6
 1d6:	13 02       	.word	0x0213;	????	
 1d8:	06 00       	.word	0x0006;	????	
 1da:	00 14       	.word	0x1400;	????	
 1dc:	0b 01       	.word	0x010b;	????	
 1de:	11 01       	.word	0x0111;	????	
 1e0:	12 01       	.word	0x0112;	????	
 1e2:	00 00       	.word	0x0000;	????	
 1e4:	15 34       	jge	$+44     	;abs 0x210
 1e6:	00 31       	jn	$+514    	;abs 0x3e8
 1e8:	13 02       	.word	0x0213;	????	
 1ea:	06 00       	.word	0x0006;	????	
 1ec:	00 16       	.word	0x1600;	????	
 1ee:	34 00       	.word	0x0034;	????	
 1f0:	03 08       	.word	0x0803;	????	
 1f2:	3a 0b       	.word	0x0b3a;	????	
 1f4:	3b 0b       	.word	0x0b3b;	????	
 1f6:	49 13       	.word	0x1349;	????	
 1f8:	02 06       	.word	0x0602;	????	
 1fa:	00 00       	.word	0x0000;	????	
 1fc:	17 15       	.word	0x1517;	????	
 1fe:	01 27       	jz	$-508    	;abs 0x2
 200:	0c 49       	mov	r9,	r12	
 202:	13 01       	.word	0x0113;	????	
 204:	13 00       	.word	0x0013;	????	
 206:	00 18       	.word	0x1800;	????	
 208:	05 00       	.word	0x0005;	????	
 20a:	49 13       	.word	0x1349;	????	
 20c:	00 00       	.word	0x0000;	????	
 20e:	19 01       	.word	0x0119;	????	
 210:	01 49       	mov	r9,	r1	
 212:	13 01       	.word	0x0113;	????	
 214:	13 00       	.word	0x0013;	????	
 216:	00 1a       	.word	0x1a00;	????	
 218:	21 00       	.word	0x0021;	????	
 21a:	49 13       	.word	0x1349;	????	
 21c:	2f 0b       	.word	0x0b2f;	????	
 21e:	00 00       	.word	0x0000;	????	
 220:	1b 2e       	jc	$-968    	;abs 0xfe58
 222:	01 3f       	jmp	$-508    	;abs 0x26
 224:	0c 03       	.word	0x030c;	????	
 226:	0e 3a       	jl	$-994    	;abs 0xfe44
 228:	0b 3b       	jl	$-488    	;abs 0x40
 22a:	0b 27       	jz	$-488    	;abs 0x42
 22c:	0c 49       	mov	r9,	r12	
 22e:	13 11       	rra	#1		;r3 As==01
 230:	01 12       	push	r1		
 232:	01 40       	mov	r0,	r1	
 234:	06 01       	.word	0x0106;	????	
 236:	13 00       	.word	0x0013;	????	
 238:	00 1c       	.word	0x1c00;	????	
 23a:	04 01       	.word	0x0104;	????	
 23c:	0b 0b       	.word	0x0b0b;	????	
 23e:	3a 0b       	.word	0x0b3a;	????	
 240:	3b 0b       	.word	0x0b3b;	????	
 242:	01 13       	reti			;return from interupt
 244:	00 00       	.word	0x0000;	????	
 246:	1d 28       	jnc	$+60     	;abs 0x282
 248:	00 03       	.word	0x0300;	????	
 24a:	0e 1c       	.word	0x1c0e;	????	
 24c:	0d 00       	.word	0x000d;	????	
 24e:	00 1e       	.word	0x1e00;	????	
 250:	34 00       	.word	0x0034;	????	
 252:	03 0e       	.word	0x0e03;	????	
 254:	3a 0b       	.word	0x0b3a;	????	
 256:	3b 05       	.word	0x053b;	????	
 258:	49 13       	.word	0x1349;	????	
 25a:	02 0a       	.word	0x0a02;	????	
 25c:	00 00       	.word	0x0000;	????	
 25e:	1f 34       	jge	$+64     	;abs 0x29e
 260:	00 03       	.word	0x0300;	????	
 262:	0e 3a       	jl	$-994    	;abs 0xfe80
 264:	0b 3b       	jl	$-488    	;abs 0x7c
 266:	05 49       	mov	r9,	r5	
 268:	13 02       	.word	0x0213;	????	
 26a:	06 00       	.word	0x0006;	????	
 26c:	00 20       	jnz	$+2      	;abs 0x26e
 26e:	17 01       	.word	0x0117;	????	
 270:	0b 0b       	.word	0x0b0b;	????	
 272:	3a 0b       	.word	0x0b3a;	????	
 274:	3b 05       	.word	0x053b;	????	
 276:	01 13       	reti			;return from interupt
 278:	00 00       	.word	0x0000;	????	
 27a:	21 0d       	.word	0x0d21;	????	
 27c:	00 03       	.word	0x0300;	????	
 27e:	08 3a       	jl	$-1006   	;abs 0xfe90
 280:	0b 3b       	jl	$-488    	;abs 0x98
 282:	05 49       	mov	r9,	r5	
 284:	13 00       	.word	0x0013;	????	
 286:	00 22       	jnz	$-1022   	;abs 0xfe88
 288:	0a 00       	.word	0x000a;	????	
 28a:	03 0e       	.word	0x0e03;	????	
 28c:	3a 0b       	.word	0x0b3a;	????	
 28e:	3b 05       	.word	0x053b;	????	
 290:	11 01       	.word	0x0111;	????	
 292:	00 00       	.word	0x0000;	????	
 294:	23 0b       	.word	0x0b23;	????	
 296:	01 55       	add	r5,	r1	
 298:	06 01       	.word	0x0106;	????	
 29a:	13 00       	.word	0x0013;	????	
 29c:	00 24       	jz	$+2      	;abs 0x29e
 29e:	34 00       	.word	0x0034;	????	
 2a0:	03 08       	.word	0x0803;	????	
 2a2:	3a 0b       	.word	0x0b3a;	????	
 2a4:	3b 05       	.word	0x053b;	????	
 2a6:	49 13       	.word	0x1349;	????	
 2a8:	02 06       	.word	0x0602;	????	
 2aa:	00 00       	.word	0x0000;	????	
 2ac:	25 0b       	.word	0x0b25;	????	
 2ae:	01 11       	rra	r1		
 2b0:	01 12       	push	r1		
 2b2:	01 01       	.word	0x0101;	????	
 2b4:	13 00       	.word	0x0013;	????	
 2b6:	00 26       	jz	$-1022   	;abs 0xfeb8
 2b8:	01 01       	.word	0x0101;	????	
 2ba:	49 13       	.word	0x1349;	????	
 2bc:	00 00       	.word	0x0000;	????	
 2be:	00 01       	.word	0x0100;	????	
 2c0:	11 00       	.word	0x0011;	????	
 2c2:	10 06       	.word	0x0610;	????	
 2c4:	11 01       	.word	0x0111;	????	
 2c6:	12 01       	.word	0x0112;	????	
 2c8:	03 08       	.word	0x0803;	????	
 2ca:	1b 08       	.word	0x081b;	????	
 2cc:	25 08       	.word	0x0825;	????	
 2ce:	13 05       	.word	0x0513;	????	
 2d0:	00 00       	.word	0x0000;	????	
 2d2:	00 01       	.word	0x0100;	????	
 2d4:	11 00       	.word	0x0011;	????	
 2d6:	10 06       	.word	0x0610;	????	
 2d8:	11 01       	.word	0x0111;	????	
 2da:	12 01       	.word	0x0112;	????	
 2dc:	03 08       	.word	0x0803;	????	
 2de:	1b 08       	.word	0x081b;	????	
 2e0:	25 08       	.word	0x0825;	????	
 2e2:	13 05       	.word	0x0513;	????	
 2e4:	00 00       	.word	0x0000;	????	
 2e6:	00 01       	.word	0x0100;	????	
 2e8:	11 00       	.word	0x0011;	????	
 2ea:	10 06       	.word	0x0610;	????	
 2ec:	11 01       	.word	0x0111;	????	
 2ee:	12 01       	.word	0x0112;	????	
 2f0:	03 08       	.word	0x0803;	????	
 2f2:	1b 08       	.word	0x081b;	????	
 2f4:	25 08       	.word	0x0825;	????	
 2f6:	13 05       	.word	0x0513;	????	
 2f8:	00 00       	.word	0x0000;	????	
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	6e 00       	.word	0x006e;	????	
   2:	00 00       	.word	0x0000;	????	
   4:	02 00       	.word	0x0002;	????	
   6:	56 00       	.word	0x0056;	????	
   8:	00 00       	.word	0x0000;	????	
   a:	01 01       	.word	0x0101;	????	
   c:	fb 0e       	.word	0x0efb;	????	
   e:	0d 00       	.word	0x000d;	????	
  10:	01 01       	.word	0x0101;	????	
  12:	01 01       	.word	0x0101;	????	
  14:	00 00       	.word	0x0000;	????	
  16:	00 01       	.word	0x0100;	????	
  18:	00 00       	.word	0x0000;	????	
  1a:	01 2e       	jc	$-1020   	;abs 0xfc1e
  1c:	2f 73       	subc	#2,	r15	;r3 As==10
  1e:	74 64       	addc.b	@r4+,	r4	
  20:	6c 69       	addc.b	@r9,	r12	
  22:	62 00       	.word	0x0062;	????	
  24:	2f 75       	subc	@r5,	r15	
  26:	73 72       	.word	0x7273;	????	Illegal as 2-op instr
  28:	2f 6c       	addc	@r12,	r15	
  2a:	69 62       	addc.b	#4,	r9	;r2 As==10
  2c:	2f 67       	addc	@r7,	r15	
  2e:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
  30:	2f 6d       	addc	@r13,	r15	
  32:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
  34:	34 33       	jn	$-406    	;abs 0xfe9e
  36:	30 2f       	jc	$-414    	;abs 0xfe98
  38:	34 2e       	jc	$-918    	;abs 0xfca2
  3a:	36 2e       	jc	$-914    	;abs 0xfca8
  3c:	33 2f       	jc	$-408    	;abs 0xfea4
  3e:	69 6e       	addc.b	@r14,	r9	
  40:	63 6c       	.word	0x6c63;	????	Illegal as 2-op instr
  42:	75 64       	addc.b	@r4+,	r5	
  44:	65 00       	.word	0x0065;	????	
  46:	00 70       	subc	r0,	r0	
  48:	72 69       	addc.b	@r9+,	r2	
  4a:	6e 74       	subc.b	@r4,	r14	
  4c:	66 2e       	jc	$-818    	;abs 0xfd1a
  4e:	63 00       	.word	0x0063;	????	
  50:	01 00       	.word	0x0001;	????	
  52:	00 73       	sbc	r0		
  54:	74 64       	addc.b	@r4+,	r4	
  56:	61 72       	subc.b	#4,	r1	;r2 As==10
  58:	67 2e       	jc	$-816    	;abs 0xfd28
  5a:	68 00       	.word	0x0068;	????	
  5c:	02 00       	.word	0x0002;	????	
  5e:	00 00       	.word	0x0000;	????	
  60:	00 03       	.word	0x0300;	????	
  62:	02 ea       	xor	r10,	r2	
  64:	c0 03       	.word	0x03c0;	????	
  66:	24 01       	.word	0x0124;	????	
  68:	6b 85       	sub.b	@r5,	r11	
  6a:	32 13       	reti			;return from interupt
  6c:	bb 02       	.word	0x02bb;	????	
  6e:	02 00       	.word	0x0002;	????	
  70:	01 01       	.word	0x0101;	????	
  72:	ce 02       	.word	0x02ce;	????	
  74:	00 00       	.word	0x0000;	????	
  76:	02 00       	.word	0x0002;	????	
  78:	71 00       	.word	0x0071;	????	
  7a:	00 00       	.word	0x0000;	????	
  7c:	01 01       	.word	0x0101;	????	
  7e:	fb 0e       	.word	0x0efb;	????	
  80:	0d 00       	.word	0x000d;	????	
  82:	01 01       	.word	0x0101;	????	
  84:	01 01       	.word	0x0101;	????	
  86:	00 00       	.word	0x0000;	????	
  88:	00 01       	.word	0x0100;	????	
  8a:	00 00       	.word	0x0000;	????	
  8c:	01 2e       	jc	$-1020   	;abs 0xfc90
  8e:	2f 73       	subc	#2,	r15	;r3 As==10
  90:	74 64       	addc.b	@r4+,	r4	
  92:	6c 69       	addc.b	@r9,	r12	
  94:	62 00       	.word	0x0062;	????	
  96:	2e 2f       	jc	$-418    	;abs 0xfef4
  98:	2e 2e       	jc	$-930    	;abs 0xfcf6
  9a:	2f 69       	addc	@r9,	r15	
  9c:	6e 63       	addc.b	#2,	r14	;r3 As==10
  9e:	6c 75       	subc.b	@r5,	r12	
  a0:	64 65       	addc.b	@r5,	r4	
  a2:	00 2f       	jc	$-510    	;abs 0xfea4
  a4:	75 73       	subc.b	#-1,	r5	;r3 As==11
  a6:	72 2f       	jc	$-282    	;abs 0xff8c
  a8:	6c 69       	addc.b	@r9,	r12	
  aa:	62 2f       	jc	$-314    	;abs 0xff70
  ac:	67 63       	addc.b	#2,	r7	;r3 As==10
  ae:	63 2f       	jc	$-312    	;abs 0xff76
  b0:	6d 73       	subc.b	#2,	r13	;r3 As==10
  b2:	70 34       	jge	$+226    	;abs 0x194
  b4:	33 30       	jn	$+104    	;abs 0x11c
  b6:	2f 34       	jge	$+96     	;abs 0x116
  b8:	2e 36       	jge	$-930    	;abs 0xfd16
  ba:	2e 33       	jn	$-418    	;abs 0xff18
  bc:	2f 69       	addc	@r9,	r15	
  be:	6e 63       	addc.b	#2,	r14	;r3 As==10
  c0:	6c 75       	subc.b	@r5,	r12	
  c2:	64 65       	addc.b	@r5,	r4	
  c4:	00 00       	.word	0x0000;	????	
  c6:	76 75       	subc.b	@r5+,	r6	
  c8:	70 72       	subc.b	#8,	r0	;r2 As==11
  ca:	69 6e       	addc.b	@r14,	r9	
  cc:	74 66       	addc.b	@r6+,	r4	
  ce:	2e 63       	addc	#2,	r14	;r3 As==10
  d0:	00 01       	.word	0x0100;	????	
  d2:	00 00       	.word	0x0000;	????	
  d4:	73 74       	.word	0x7473;	????	Illegal as 2-op instr
  d6:	64 69       	addc.b	@r9,	r4	
  d8:	6e 74       	subc.b	@r4,	r14	
  da:	2e 68       	addc	@r8,	r14	
  dc:	00 02       	.word	0x0200;	????	
  de:	00 00       	.word	0x0000;	????	
  e0:	73 74       	.word	0x7473;	????	Illegal as 2-op instr
  e2:	64 61       	addc.b	@r1,	r4	
  e4:	72 67       	addc.b	@r7+,	r2	
  e6:	2e 68       	addc	@r8,	r14	
  e8:	00 03       	.word	0x0300;	????	
  ea:	00 00       	.word	0x0000;	????	
  ec:	00 00       	.word	0x0000;	????	
  ee:	03 02       	.word	0x0203;	????	
  f0:	08 c1       	bic	r1,	r8	
  f2:	03 fb       	.word	0xfb03;	????	Illegal as 2-op instr
  f4:	00 01       	.word	0x0100;	????	
  f6:	03 3c       	jmp	$+8      	;abs 0xfe
  f8:	02 22       	jnz	$-1018   	;abs 0xfcfe
  fa:	01 03       	.word	0x0301;	????	
  fc:	48 66       	addc.b	r6,	r8	
  fe:	03 63       	adc	#0		;r3 As==00
 100:	2e 84       	sub	@r4,	r14	
 102:	67 08       	.word	0x0867;	????	
 104:	ae 67 83 4b 	addc	@r7,	19331(r14);0x4b83(r14)
 108:	03 77       	.word	0x7703;	????	Illegal as 2-op instr
 10a:	9e 03       	.word	0x039e;	????	
 10c:	0a 2e       	jc	$-1002   	;abs 0xfd22
 10e:	03 17       	.word	0x1703;	????	
 110:	08 c8       	bic	r8,	r8	
 112:	b7 4e 31 85 	mov	@r14+,	-31439(r7);0x8531(r7)
 116:	08 23       	jnz	$-494    	;abs 0xff28
 118:	4b 4c       	mov.b	r12,	r11	
 11a:	31 68       	addc	@r8+,	r1	
 11c:	4b 4c       	mov.b	r12,	r11	
 11e:	2c 03       	.word	0x032c;	????	
 120:	0a 82       	sub	r2,	r10	
 122:	03 69       	.word	0x6903;	????	Illegal as 2-op instr
 124:	4a 03       	.word	0x034a;	????	
 126:	76 66       	addc.b	@r6+,	r6	
 128:	2c 47       	mov	@r7,	r12	
 12a:	03 2b       	jnc	$-504    	;abs 0xff32
 12c:	4a 99       	cmp.b	r9,	r10	
 12e:	00 02       	.word	0x0200;	????	
 130:	04 01       	.word	0x0104;	????	
 132:	32 06       	.word	0x0632;	????	
 134:	4a 06       	.word	0x064a;	????	
 136:	2c 00       	.word	0x002c;	????	
 138:	02 04       	.word	0x0402;	????	
 13a:	01 03       	.word	0x0301;	????	
 13c:	58 66 03 30 	addc.b	12291(r6),r8	;0x3003(r6)
 140:	4a 83       	sub.b	#0,	r10	;r3 As==00
 142:	00 02       	.word	0x0200;	????	
 144:	04 01       	.word	0x0104;	????	
 146:	2b 03       	.word	0x032b;	????	
 148:	57 9e 2c 03 	cmp.b	812(r14),r7	;0x032c(r14)
 14c:	36 4a       	mov	@r10+,	r6	
 14e:	03 47       	.word	0x4703;	????	Illegal as 2-op instr
 150:	2e 03       	.word	0x032e;	????	
 152:	3a 4a       	mov	@r10+,	r10	
 154:	00 02       	.word	0x0200;	????	
 156:	04 01       	.word	0x0104;	????	
 158:	7f 51       	add.b	@r1+,	r15	
 15a:	00 02       	.word	0x0200;	????	
 15c:	04 01       	.word	0x0104;	????	
 15e:	06 66       	rlc	r6		
 160:	00 02       	.word	0x0200;	????	
 162:	04 01       	.word	0x0104;	????	
 164:	06 03       	.word	0x0306;	????	
 166:	42 4a       	mov.b	r10,	r2	
 168:	03 c2       	.word	0xc203;	????	Illegal as 2-op instr
 16a:	00 82       	sub	r2,	r0	
 16c:	00 02       	.word	0x0200;	????	
 16e:	04 01       	.word	0x0104;	????	
 170:	80 03       	.word	0x0380;	????	
 172:	40 4a       	br	r10		
 174:	03 c0       	.word	0xc003;	????	Illegal as 2-op instr
 176:	00 2e       	jc	$-1022   	;abs 0xfd78
 178:	52 30       	jn	$+166    	;abs 0x21e
 17a:	4c 00       	.word	0x004c;	????	
 17c:	02 04       	.word	0x0402;	????	
 17e:	01 03       	.word	0x0301;	????	
 180:	b4 7f 2e 00 	subc	@r15+,	46(r4)	;0x002e(r4)
 184:	02 04       	.word	0x0402;	????	
 186:	01 03       	.word	0x0301;	????	
 188:	c8 00       	.word	0x00c8;	????	
 18a:	4a 00       	.word	0x004a;	????	
 18c:	02 04       	.word	0x0402;	????	
 18e:	02 06       	.word	0x0602;	????	
 190:	66 06       	.word	0x0666;	????	
 192:	03 09       	.word	0x0903;	????	
 194:	66 67       	addc.b	@r7,	r6	
 196:	00 02       	.word	0x0200;	????	
 198:	04 01       	.word	0x0104;	????	
 19a:	2b 51       	add	@r1,	r11	
 19c:	03 2a       	jnc	$-1016   	;abs 0xfda4
 19e:	08 58       	rla	r8		
 1a0:	08 b3       	bit	#0,	r8	;r3 As==00
 1a2:	51 49 49 49 	mov.b	18761(r9),r1	;0x4949(r9)
 1a6:	03 7a       	.word	0x7a03;	????	Illegal as 2-op instr
 1a8:	4a 49       	mov.b	r9,	r10	
 1aa:	49 2c       	jc	$+148    	;abs 0x23e
 1ac:	03 b8       	.word	0xb803;	????	Illegal as 2-op instr
 1ae:	02 4a       	mov	r10,	r2	
 1b0:	03 e3       	.word	0xe303;	????	Illegal as 2-op instr
 1b2:	7d 9e       	cmp.b	@r14+,	r13	
 1b4:	bc 4e 69 bb 	mov	@r14+,	-17559(r12);0xbb69(r12)
 1b8:	f0 03       	.word	0x03f0;	????	
 1ba:	fd 00       	.word	0x00fd;	????	
 1bc:	82 03       	.word	0x0382;	????	
 1be:	8c 7f 2e 83 	subc	r15,	-31954(r12);0x832e(r12)
 1c2:	89 00       	.word	0x0089;	????	
 1c4:	02 04       	.word	0x0402;	????	
 1c6:	01 06       	.word	0x0601;	????	
 1c8:	02 9a       	cmp	r10,	r2	
 1ca:	01 12       	push	r1		
 1cc:	00 02       	.word	0x0200;	????	
 1ce:	04 01       	.word	0x0104;	????	
 1d0:	06 03       	.word	0x0306;	????	
 1d2:	4a 4a       	mov.b	r10,	r10	
 1d4:	03 d3       	.word	0xd303;	????	Illegal as 2-op instr
 1d6:	01 9e       	cmp	r14,	r1	
 1d8:	03 eb       	.word	0xeb03;	????	Illegal as 2-op instr
 1da:	7e 66       	addc.b	@r6+,	r14	
 1dc:	88 84 4b 51 	sub	r4,	20811(r8);0x514b(r8)
 1e0:	03 0b       	.word	0x0b03;	????	
 1e2:	9e a3 a4 bb 	dadd	#1,	-17500(r14);r3 As==01, 0xbba4(r14)
 1e6:	a3 a4       	dadd	@r4,	#1	;r3 As==01
 1e8:	88 68 4b 67 	addc	r8,	26443(r8);0x674b(r8)
 1ec:	a2 67 03 77 	addc	@r7,	&0x7703	
 1f0:	9e 03       	.word	0x039e;	????	
 1f2:	16 4a 00 02 	mov	512(r10),r6	;0x0200(r10)
 1f6:	04 01       	.word	0x0104;	????	
 1f8:	06 66       	rlc	r6		
 1fa:	06 68       	addc	r8,	r6	
 1fc:	03 0d       	.word	0x0d03;	????	
 1fe:	02 24       	jz	$+6      	;abs 0x204
 200:	01 08       	.word	0x0801;	????	
 202:	21 bb       	bit	@r11,	r1	
 204:	87 67 00 02 	addc	r7,	512(r7)	;0x0200(r7)
 208:	04 01       	.word	0x0104;	????	
 20a:	06 66       	rlc	r6		
 20c:	06 69       	addc	r9,	r6	
 20e:	4b 48       	mov.b	r8,	r11	
 210:	4d 33       	jn	$-356    	;abs 0xac
 212:	6a 68       	addc.b	@r8,	r10	
 214:	4b a0       	dadd.b	r0,	r11	
 216:	bc 00       	.word	0x00bc;	????	
 218:	02 04       	.word	0x0402;	????	
 21a:	03 06       	.word	0x0603;	????	
 21c:	82 00       	.word	0x0082;	????	
 21e:	02 04       	.word	0x0402;	????	
 220:	03 06       	.word	0x0603;	????	
 222:	08 95       	cmp	r5,	r8	
 224:	6c a1       	dadd.b	@r1,	r12	
 226:	08 8d       	sub	r13,	r8	
 228:	30 68       	addc	@r8+,	r0	
 22a:	32 03       	.word	0x0332;	????	
 22c:	0e 66       	addc	r6,	r14	
 22e:	4e 03       	.word	0x034e;	????	
 230:	71 82       	sub.b	#8,	r1	;r2 As==11
 232:	03 13       	reti			;return from interupt
 234:	66 68       	addc.b	@r8,	r6	
 236:	02 22       	jnz	$-1018   	;abs 0xfe3c
 238:	13 08       	.word	0x0813;	????	
 23a:	75 9c       	cmp.b	@r12+,	r5	
 23c:	51 30       	jn	$+164    	;abs 0x2e0
 23e:	2c 30       	jn	$+90     	;abs 0x298
 240:	f3 a4       	dadd.b	@r4+,	#1	;r3 As==01
 242:	83 bb       	bit	r11,	#1	;r3 As==01
 244:	9c 36       	jge	$-710    	;abs 0xff7e
 246:	00 02       	.word	0x0200;	????	
 248:	04 01       	.word	0x0104;	????	
 24a:	06 66       	rlc	r6		
 24c:	06 84       	sub	r4,	r6	
 24e:	83 67       	addc	r7,	#1	;r3 As==01
 250:	67 84       	sub.b	@r4,	r7	
 252:	00 02       	.word	0x0200;	????	
 254:	04 01       	.word	0x0104;	????	
 256:	06 66       	rlc	r6		
 258:	06 69       	addc	r9,	r6	
 25a:	68 4b       	mov.b	@r11,	r8	
 25c:	02 22       	jnz	$-1018   	;abs 0xfe62
 25e:	16 4b 08 cb 	mov	-13560(r11),r6	;0xcb08(r11)
 262:	bf 03       	.word	0x03bf;	????	
 264:	11 4a 00 02 	mov	512(r10),r1	;0x0200(r10)
 268:	04 07       	.word	0x0704;	????	
 26a:	08 c9       	bic	r9,	r8	
 26c:	00 02       	.word	0x0200;	????	
 26e:	04 01       	.word	0x0104;	????	
 270:	06 02       	.word	0x0206;	????	
 272:	46 12       	push.b	r6		
 274:	00 02       	.word	0x0200;	????	
 276:	04 02       	.word	0x0204;	????	
 278:	9e 82 00 02 	sub	&0x0200,1284(r14);0x0504(r14)
 27c:	04 05 
 27e:	9e 00       	.word	0x009e;	????	
 280:	02 04       	.word	0x0402;	????	
 282:	05 06       	.word	0x0605;	????	
 284:	03 d9       	.word	0xd903;	????	Illegal as 2-op instr
 286:	7d 66       	addc.b	@r6+,	r13	
 288:	00 02       	.word	0x0200;	????	
 28a:	04 05       	.word	0x0504;	????	
 28c:	03 a7       	.word	0xa703;	????	Illegal as 2-op instr
 28e:	02 4a       	mov	r10,	r2	
 290:	00 02       	.word	0x0200;	????	
 292:	04 06       	.word	0x0604;	????	
 294:	06 02       	.word	0x0206;	????	
 296:	30 12 ba 06 	push	#1722		;#0x06ba
 29a:	08 24       	jz	$+18     	;abs 0x2ac
 29c:	00 02       	.word	0x0200;	????	
 29e:	04 07       	.word	0x0704;	????	
 2a0:	08 21       	jnz	$+530    	;abs 0x4b2
 2a2:	00 02       	.word	0x0200;	????	
 2a4:	04 01       	.word	0x0104;	????	
 2a6:	06 02       	.word	0x0206;	????	
 2a8:	22 12       	push	#4		;r2 As==10
 2aa:	00 02       	.word	0x0200;	????	
 2ac:	04 02       	.word	0x0204;	????	
 2ae:	9e 82 00 02 	sub	&0x0200,1284(r14);0x0504(r14)
 2b2:	04 05 
 2b4:	9e 00       	.word	0x009e;	????	
 2b6:	02 04       	.word	0x0402;	????	
 2b8:	05 06       	.word	0x0605;	????	
 2ba:	03 d4       	.word	0xd403;	????	Illegal as 2-op instr
 2bc:	7d 66       	addc.b	@r6+,	r13	
 2be:	00 02       	.word	0x0200;	????	
 2c0:	04 05       	.word	0x0504;	????	
 2c2:	03 ac       	.word	0xac03;	????	Illegal as 2-op instr
 2c4:	02 4a       	mov	r10,	r2	
 2c6:	00 02       	.word	0x0200;	????	
 2c8:	04 06       	.word	0x0604;	????	
 2ca:	06 08       	.word	0x0806;	????	
 2cc:	74 4a       	mov.b	@r10+,	r4	
 2ce:	00 02       	.word	0x0200;	????	
 2d0:	04 07       	.word	0x0704;	????	
 2d2:	06 08       	.word	0x0806;	????	
 2d4:	3f 00       	.word	0x003f;	????	
 2d6:	02 04       	.word	0x0402;	????	
 2d8:	01 06       	.word	0x0601;	????	
 2da:	08 20       	jnz	$+18     	;abs 0x2ec
 2dc:	00 02       	.word	0x0200;	????	
 2de:	04 02       	.word	0x0204;	????	
 2e0:	9e 82 00 02 	sub	&0x0200,1284(r14);0x0504(r14)
 2e4:	04 05 
 2e6:	9e 00       	.word	0x009e;	????	
 2e8:	02 04       	.word	0x0402;	????	
 2ea:	05 06       	.word	0x0605;	????	
 2ec:	03 d1       	.word	0xd103;	????	Illegal as 2-op instr
 2ee:	7d 66       	addc.b	@r6+,	r13	
 2f0:	00 02       	.word	0x0200;	????	
 2f2:	04 05       	.word	0x0504;	????	
 2f4:	03 af       	.word	0xaf03;	????	Illegal as 2-op instr
 2f6:	02 4a       	mov	r10,	r2	
 2f8:	06 08       	.word	0x0806;	????	
 2fa:	20 06       	.word	0x0620;	????	
 2fc:	4f 83       	sub.b	#0,	r15	;r3 As==00
 2fe:	4d 68       	addc.b	r8,	r13	
 300:	02 3e       	jmp	$-1018   	;abs 0xff06
 302:	13 68       	.word	0x6813;	????	Illegal as 2-op instr
 304:	4b bd       	bit.b	r13,	r11	
 306:	bc 03       	.word	0x03bc;	????	
 308:	09 08       	.word	0x0809;	????	
 30a:	e4 00       	.word	0x00e4;	????	
 30c:	02 04       	.word	0x0402;	????	
 30e:	01 03       	.word	0x0301;	????	
 310:	b4 7d 82 00 	subc	@r13+,	130(r4)	;0x0082(r4)
 314:	02 04       	.word	0x0402;	????	
 316:	01 03       	.word	0x0301;	????	
 318:	ca 02       	.word	0x02ca;	????	
 31a:	4a 06       	.word	0x064a;	????	
 31c:	66 06       	.word	0x0666;	????	
 31e:	87 03       	.word	0x0387;	????	
 320:	9b 7e 4a 6c 	subc	27722(r14),28232(r11);0x6c4a(r14), 0x6e48(r11)
 324:	48 6e 
 326:	03 0b       	.word	0x0b03;	????	
 328:	2e 03       	.word	0x032e;	????	
 32a:	7a 4a       	mov.b	@r10+,	r10	
 32c:	49 00       	.word	0x0049;	????	
 32e:	02 04       	.word	0x0402;	????	
 330:	01 03       	.word	0x0301;	????	
 332:	54 2e       	jc	$-854    	;abs 0xffdc
 334:	00 02       	.word	0x0200;	????	
 336:	04 01       	.word	0x0104;	????	
 338:	03 4f       	.word	0x4f03;	????	Illegal as 2-op instr
 33a:	4a 03       	.word	0x034a;	????	
 33c:	b8 02       	.word	0x02b8;	????	
 33e:	9e 02       	.word	0x029e;	????	
 340:	1a 00       	.word	0x001a;	????	
 342:	01 01       	.word	0x0101;	????	
 344:	a3 00       	.word	0x00a3;	????	
 346:	00 00       	.word	0x0000;	????	
 348:	02 00       	.word	0x0002;	????	
 34a:	81 00       	.word	0x0081;	????	
 34c:	00 00       	.word	0x0000;	????	
 34e:	01 01       	.word	0x0101;	????	
 350:	fb 0e       	.word	0x0efb;	????	
 352:	0d 00       	.word	0x000d;	????	
 354:	01 01       	.word	0x0101;	????	
 356:	01 01       	.word	0x0101;	????	
 358:	00 00       	.word	0x0000;	????	
 35a:	00 01       	.word	0x0100;	????	
 35c:	00 00       	.word	0x0000;	????	
 35e:	01 2f       	jc	$-508    	;abs 0x162
 360:	62 75       	subc.b	@r5,	r2	
 362:	69 6c       	addc.b	@r12,	r9	
 364:	64 2f       	jc	$-310    	;abs 0x22e
 366:	67 63       	addc.b	#2,	r7	;r3 As==10
 368:	63 2d       	jc	$+712    	;abs 0x630
 36a:	6d 73       	subc.b	#2,	r13	;r3 As==10
 36c:	70 34       	jge	$+226    	;abs 0x44e
 36e:	33 30       	jn	$+104    	;abs 0x3d6
 370:	2d 67       	addc	@r7,	r13	
 372:	52 42 52 52 	mov.b	&0x5252,r2	
 376:	6f 2f       	jc	$-288    	;abs 0x256
 378:	67 63       	addc.b	#2,	r7	;r3 As==10
 37a:	63 2d       	jc	$+712    	;abs 0x642
 37c:	6d 73       	subc.b	#2,	r13	;r3 As==10
 37e:	70 34       	jge	$+226    	;abs 0x460
 380:	33 30       	jn	$+104    	;abs 0x3e8
 382:	2d 34       	jge	$+92     	;abs 0x3de
 384:	2e 36       	jge	$-930    	;abs 0xffe2
 386:	2e 33       	jn	$-418    	;abs 0x1e4
 388:	7e 6d       	addc.b	@r13+,	r14	
 38a:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 38c:	67 63       	addc.b	#2,	r7	;r3 As==10
 38e:	63 2d       	jc	$+712    	;abs 0x656
 390:	32 30       	jn	$+102    	;abs 0x3f6
 392:	31 32       	jn	$-924    	;abs 0xfff6
 394:	30 34       	jge	$+98     	;abs 0x3f6
 396:	30 36       	jge	$-926    	;abs 0xfff8
 398:	2f 2e       	jc	$-928    	;abs 0xfff8
 39a:	2f 67       	addc	@r7,	r15	
 39c:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 39e:	2d 34       	jge	$+92     	;abs 0x3fa
 3a0:	2e 36       	jge	$-930    	;abs 0xfffe
 3a2:	2e 33       	jn	$-418    	;abs 0x200
 3a4:	2f 6c       	addc	@r12,	r15	
 3a6:	69 62       	addc.b	#4,	r9	;r2 As==10
 3a8:	67 63       	addc.b	#2,	r7	;r3 As==10
 3aa:	63 2f       	jc	$-312    	;abs 0x272
 3ac:	2e 2e       	jc	$-930    	;abs 0xa
 3ae:	2f 67       	addc	@r7,	r15	
 3b0:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 3b2:	2f 63       	addc	#2,	r15	;r3 As==10
 3b4:	6f 6e       	addc.b	@r14,	r15	
 3b6:	66 69       	addc.b	@r9,	r6	
 3b8:	67 2f       	jc	$-304    	;abs 0x288
 3ba:	6d 73       	subc.b	#2,	r13	;r3 As==10
 3bc:	70 34       	jge	$+226    	;abs 0x49e
 3be:	33 30       	jn	$+104    	;abs 0x426
 3c0:	00 00       	.word	0x0000;	????	
 3c2:	6c 69       	addc.b	@r9,	r12	
 3c4:	62 67       	addc.b	@r7,	r2	
 3c6:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 3c8:	2e 53       	incd	r14		
 3ca:	00 01       	.word	0x0100;	????	
 3cc:	00 00       	.word	0x0000;	????	
 3ce:	00 00       	.word	0x0000;	????	
 3d0:	03 02       	.word	0x0203;	????	
 3d2:	3e c9       	bic	@r9+,	r14	
 3d4:	03 a4       	.word	0xa403;	????	Illegal as 2-op instr
 3d6:	04 01       	.word	0x0104;	????	
 3d8:	4b 2f       	jc	$-360    	;abs 0x270
 3da:	2f 2f       	jc	$-416    	;abs 0x23a
 3dc:	2f 2f       	jc	$-416    	;abs 0x23c
 3de:	2f 2f       	jc	$-416    	;abs 0x23e
 3e0:	2f 2f       	jc	$-416    	;abs 0x240
 3e2:	2f 34       	jge	$+96     	;abs 0x442
 3e4:	4b 2f       	jc	$-360    	;abs 0x27c
 3e6:	02 02       	.word	0x0202;	????	
 3e8:	00 01       	.word	0x0100;	????	
 3ea:	01 b2       	bit	r2,	r1	
 3ec:	00 00       	.word	0x0000;	????	
 3ee:	00 02       	.word	0x0200;	????	
 3f0:	00 81       	sub	r1,	r0	
 3f2:	00 00       	.word	0x0000;	????	
 3f4:	00 01       	.word	0x0100;	????	
 3f6:	01 fb       	and	r11,	r1	
 3f8:	0e 0d       	.word	0x0d0e;	????	
 3fa:	00 01       	.word	0x0100;	????	
 3fc:	01 01       	.word	0x0101;	????	
 3fe:	01 00       	.word	0x0001;	????	
 400:	00 00       	.word	0x0000;	????	
 402:	01 00       	.word	0x0001;	????	
 404:	00 01       	.word	0x0100;	????	
 406:	2f 62       	addc	#4,	r15	;r2 As==10
 408:	75 69       	addc.b	@r9+,	r5	
 40a:	6c 64       	addc.b	@r4,	r12	
 40c:	2f 67       	addc	@r7,	r15	
 40e:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 410:	2d 6d       	addc	@r13,	r13	
 412:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 414:	34 33       	jn	$-406    	;abs 0x27e
 416:	30 2d       	jc	$+610    	;abs 0x678
 418:	67 52       	add.b	#4,	r7	;r2 As==10
 41a:	42 52       	rla.b	r2		
 41c:	52 6f 2f 67 	addc.b	26415(r15),r2	;0x672f(r15)
 420:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 422:	2d 6d       	addc	@r13,	r13	
 424:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 426:	34 33       	jn	$-406    	;abs 0x290
 428:	30 2d       	jc	$+610    	;abs 0x68a
 42a:	34 2e       	jc	$-918    	;abs 0x94
 42c:	36 2e       	jc	$-914    	;abs 0x9a
 42e:	33 7e       	.word	0x7e33;	????	Illegal as 2-op instr
 430:	6d 73       	subc.b	#2,	r13	;r3 As==10
 432:	70 67       	addc.b	@r7+,	r0	
 434:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 436:	2d 32       	jn	$-932    	;abs 0x92
 438:	30 31       	jn	$+610    	;abs 0x69a
 43a:	32 30       	jn	$+102    	;abs 0x4a0
 43c:	34 30       	jn	$+106    	;abs 0x4a6
 43e:	36 2f       	jc	$-402    	;abs 0x2ac
 440:	2e 2f       	jc	$-418    	;abs 0x29e
 442:	67 63       	addc.b	#2,	r7	;r3 As==10
 444:	63 2d       	jc	$+712    	;abs 0x70c
 446:	34 2e       	jc	$-918    	;abs 0xb0
 448:	36 2e       	jc	$-914    	;abs 0xb6
 44a:	33 2f       	jc	$-408    	;abs 0x2b2
 44c:	6c 69       	addc.b	@r9,	r12	
 44e:	62 67       	addc.b	@r7,	r2	
 450:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 452:	2f 2e       	jc	$-928    	;abs 0xb2
 454:	2e 2f       	jc	$-418    	;abs 0x2b2
 456:	67 63       	addc.b	#2,	r7	;r3 As==10
 458:	63 2f       	jc	$-312    	;abs 0x320
 45a:	63 6f       	.word	0x6f63;	????	Illegal as 2-op instr
 45c:	6e 66       	addc.b	@r6,	r14	
 45e:	69 67       	addc.b	@r7,	r9	
 460:	2f 6d       	addc	@r13,	r15	
 462:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 464:	34 33       	jn	$-406    	;abs 0x2ce
 466:	30 00       	.word	0x0030;	????	
 468:	00 6c       	addc	r12,	r0	
 46a:	69 62       	addc.b	#4,	r9	;r2 As==10
 46c:	67 63       	addc.b	#2,	r7	;r3 As==10
 46e:	63 2e       	jc	$-824    	;abs 0x136
 470:	53 00       	.word	0x0053;	????	
 472:	01 00       	.word	0x0001;	????	
 474:	00 00       	.word	0x0000;	????	
 476:	00 03       	.word	0x0300;	????	
 478:	02 60       	addc	r0,	r2	
 47a:	c9 03       	.word	0x03c9;	????	
 47c:	f8 04       	.word	0x04f8;	????	
 47e:	01 2f       	jc	$-508    	;abs 0x282
 480:	2f 30       	jn	$+96     	;abs 0x4e0
 482:	4b 2f       	jc	$-360    	;abs 0x31a
 484:	2f 2f       	jc	$-416    	;abs 0x2e4
 486:	2f 2f       	jc	$-416    	;abs 0x2e6
 488:	2f 2f       	jc	$-416    	;abs 0x2e8
 48a:	2f 2f       	jc	$-416    	;abs 0x2ea
 48c:	2f 2f       	jc	$-416    	;abs 0x2ec
 48e:	2f 2f       	jc	$-416    	;abs 0x2ee
 490:	2f 2f       	jc	$-416    	;abs 0x2f0
 492:	2f 2f       	jc	$-416    	;abs 0x2f2
 494:	32 2f       	jc	$-410    	;abs 0x2fa
 496:	2f 30       	jn	$+96     	;abs 0x4f6
 498:	34 4b       	mov	@r11+,	r4	
 49a:	2f 2f       	jc	$-416    	;abs 0x2fa
 49c:	02 02       	.word	0x0202;	????	
 49e:	00 01       	.word	0x0100;	????	
 4a0:	01 f8       	and	r8,	r1	
 4a2:	00 00       	.word	0x0000;	????	
 4a4:	00 02       	.word	0x0200;	????	
 4a6:	00 81       	sub	r1,	r0	
 4a8:	00 00       	.word	0x0000;	????	
 4aa:	00 01       	.word	0x0100;	????	
 4ac:	01 fb       	and	r11,	r1	
 4ae:	0e 0d       	.word	0x0d0e;	????	
 4b0:	00 01       	.word	0x0100;	????	
 4b2:	01 01       	.word	0x0101;	????	
 4b4:	01 00       	.word	0x0001;	????	
 4b6:	00 00       	.word	0x0000;	????	
 4b8:	01 00       	.word	0x0001;	????	
 4ba:	00 01       	.word	0x0100;	????	
 4bc:	2f 62       	addc	#4,	r15	;r2 As==10
 4be:	75 69       	addc.b	@r9+,	r5	
 4c0:	6c 64       	addc.b	@r4,	r12	
 4c2:	2f 67       	addc	@r7,	r15	
 4c4:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 4c6:	2d 6d       	addc	@r13,	r13	
 4c8:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 4ca:	34 33       	jn	$-406    	;abs 0x334
 4cc:	30 2d       	jc	$+610    	;abs 0x72e
 4ce:	67 52       	add.b	#4,	r7	;r2 As==10
 4d0:	42 52       	rla.b	r2		
 4d2:	52 6f 2f 67 	addc.b	26415(r15),r2	;0x672f(r15)
 4d6:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 4d8:	2d 6d       	addc	@r13,	r13	
 4da:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 4dc:	34 33       	jn	$-406    	;abs 0x346
 4de:	30 2d       	jc	$+610    	;abs 0x740
 4e0:	34 2e       	jc	$-918    	;abs 0x14a
 4e2:	36 2e       	jc	$-914    	;abs 0x150
 4e4:	33 7e       	.word	0x7e33;	????	Illegal as 2-op instr
 4e6:	6d 73       	subc.b	#2,	r13	;r3 As==10
 4e8:	70 67       	addc.b	@r7+,	r0	
 4ea:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 4ec:	2d 32       	jn	$-932    	;abs 0x148
 4ee:	30 31       	jn	$+610    	;abs 0x750
 4f0:	32 30       	jn	$+102    	;abs 0x556
 4f2:	34 30       	jn	$+106    	;abs 0x55c
 4f4:	36 2f       	jc	$-402    	;abs 0x362
 4f6:	2e 2f       	jc	$-418    	;abs 0x354
 4f8:	67 63       	addc.b	#2,	r7	;r3 As==10
 4fa:	63 2d       	jc	$+712    	;abs 0x7c2
 4fc:	34 2e       	jc	$-918    	;abs 0x166
 4fe:	36 2e       	jc	$-914    	;abs 0x16c
 500:	33 2f       	jc	$-408    	;abs 0x368
 502:	6c 69       	addc.b	@r9,	r12	
 504:	62 67       	addc.b	@r7,	r2	
 506:	63 63       	.word	0x6363;	????	Illegal as 2-op instr
 508:	2f 2e       	jc	$-928    	;abs 0x168
 50a:	2e 2f       	jc	$-418    	;abs 0x368
 50c:	67 63       	addc.b	#2,	r7	;r3 As==10
 50e:	63 2f       	jc	$-312    	;abs 0x3d6
 510:	63 6f       	.word	0x6f63;	????	Illegal as 2-op instr
 512:	6e 66       	addc.b	@r6,	r14	
 514:	69 67       	addc.b	@r7,	r9	
 516:	2f 6d       	addc	@r13,	r15	
 518:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
 51a:	34 33       	jn	$-406    	;abs 0x384
 51c:	30 00       	.word	0x0030;	????	
 51e:	00 6c       	addc	r12,	r0	
 520:	69 62       	addc.b	#4,	r9	;r2 As==10
 522:	67 63       	addc.b	#2,	r7	;r3 As==10
 524:	63 2e       	jc	$-824    	;abs 0x1ec
 526:	53 00       	.word	0x0053;	????	
 528:	01 00       	.word	0x0001;	????	
 52a:	00 00       	.word	0x0000;	????	
 52c:	00 03       	.word	0x0300;	????	
 52e:	02 a0       	dadd	r0,	r2	
 530:	c9 03       	.word	0x03c9;	????	
 532:	e6 05       	.word	0x05e6;	????	
 534:	01 2f       	jc	$-508    	;abs 0x338
 536:	2f 2f       	jc	$-416    	;abs 0x396
 538:	30 4b       	br	@r11+		
 53a:	2f 2f       	jc	$-416    	;abs 0x39a
 53c:	2f 2f       	jc	$-416    	;abs 0x39c
 53e:	2f 2f       	jc	$-416    	;abs 0x39e
 540:	2f 2f       	jc	$-416    	;abs 0x3a0
 542:	2f 2f       	jc	$-416    	;abs 0x3a2
 544:	2f 2f       	jc	$-416    	;abs 0x3a4
 546:	2f 2f       	jc	$-416    	;abs 0x3a6
 548:	2f 2f       	jc	$-416    	;abs 0x3a8
 54a:	2f 2f       	jc	$-416    	;abs 0x3aa
 54c:	2f 2f       	jc	$-416    	;abs 0x3ac
 54e:	2f 2f       	jc	$-416    	;abs 0x3ae
 550:	2f 2f       	jc	$-416    	;abs 0x3b0
 552:	2f 2f       	jc	$-416    	;abs 0x3b2
 554:	2f 2f       	jc	$-416    	;abs 0x3b4
 556:	2f 2f       	jc	$-416    	;abs 0x3b6
 558:	2f 2f       	jc	$-416    	;abs 0x3b8
 55a:	4b 2f       	jc	$-360    	;abs 0x3f2
 55c:	32 2f       	jc	$-410    	;abs 0x3c2
 55e:	2f 2f       	jc	$-416    	;abs 0x3be
 560:	30 03       	.word	0x0330;	????	
 562:	09 2e       	jc	$-1004   	;abs 0x176
 564:	2f 2f       	jc	$-416    	;abs 0x3c4
 566:	2f 30       	jn	$+96     	;abs 0x5c6
 568:	4b 4b       	mov.b	r11,	r11	
 56a:	4b 4c       	mov.b	r12,	r11	
 56c:	4e 2f       	jc	$-354    	;abs 0x40a
 56e:	2f 2f       	jc	$-416    	;abs 0x3ce
 570:	30 36       	jge	$-926    	;abs 0x1d2
 572:	2f 2f       	jc	$-416    	;abs 0x3d2
 574:	2f 30       	jn	$+96     	;abs 0x5d4
 576:	4b 4b       	mov.b	r11,	r11	
 578:	4b 4c       	mov.b	r12,	r11	
 57a:	4b 2f       	jc	$-360    	;abs 0x412
 57c:	2f 2f       	jc	$-416    	;abs 0x3dc
 57e:	32 2f       	jc	$-410    	;abs 0x3e4
 580:	2f 2f       	jc	$-416    	;abs 0x3e0
 582:	30 36       	jge	$-926    	;abs 0x1e4
 584:	2f 2f       	jc	$-416    	;abs 0x3e4
 586:	2f 2f       	jc	$-416    	;abs 0x3e6
 588:	30 4b       	br	@r11+		
 58a:	4b 4b       	mov.b	r11,	r11	
 58c:	4c 4c       	mov.b	r12,	r12	
 58e:	4b 4b       	mov.b	r11,	r11	
 590:	4b 4b       	mov.b	r11,	r11	
 592:	4f 2f       	jc	$-352    	;abs 0x432
 594:	2f 2f       	jc	$-416    	;abs 0x3f4
 596:	2f 30       	jn	$+96     	;abs 0x5f6
 598:	02 02       	.word	0x0202;	????	
 59a:	00 01       	.word	0x0100;	????	
 59c:	01 63       	Address 0x000000000000059c is out of bounds.
Address 0x000000000000059e is out of bounds.
and.b	@r15+,	-1(r15)	;0xffff(r15)

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0e 00       	.word	0x000e;	????	
   2:	00 00       	.word	0x0000;	????	
   4:	ff ff ff ff 	and.b	@r15+,	-1(r15)	;0xffff(r15)
   8:	01 00       	.word	0x0001;	????	
   a:	01 7e       	subc	r14,	r1	
   c:	00 0c       	.word	0x0c00;	????	
   e:	01 02       	.word	0x0201;	????	
  10:	80 01       	.word	0x0180;	????	
  12:	08 00       	.word	0x0008;	????	
  14:	00 00       	.word	0x0000;	????	
  16:	00 00       	.word	0x0000;	????	
  18:	00 00       	.word	0x0000;	????	
  1a:	ea c0 10 00 	bic.b	@r0,	16(r10)	;0x0010(r10)
  1e:	08 00       	.word	0x0008;	????	
  20:	00 00       	.word	0x0000;	????	
  22:	00 00       	.word	0x0000;	????	
  24:	00 00       	.word	0x0000;	????	
  26:	fa c0 0e 00 	bic.b	#14,	14(r10)	;#0x000e, 0x000e(r10)
  2a:	0e 00 
  2c:	00 00       	.word	0x0000;	????	
  2e:	ff ff ff ff 	and.b	@r15+,	-1(r15)	;0xffff(r15)
  32:	01 00       	.word	0x0001;	????	
  34:	01 7e       	subc	r14,	r1	
  36:	00 0c       	.word	0x0c00;	????	
  38:	01 02       	.word	0x0201;	????	
  3a:	80 01       	.word	0x0180;	????	
  3c:	34 00       	.word	0x0034;	????	
  3e:	00 00       	.word	0x0000;	????	
  40:	2a 00       	.word	0x002a;	????	
  42:	00 00       	.word	0x0000;	????	
  44:	08 c1       	bic	r1,	r8	
  46:	98 01       	.word	0x0198;	????	
  48:	42 0e       	.word	0x0e42;	????	
  4a:	04 8b       	sub	r11,	r4	
  4c:	02 42       	mov	r2,	r2	
  4e:	0e 06       	.word	0x060e;	????	
  50:	8a 03       	.word	0x038a;	????	
  52:	42 0e       	.word	0x0e42;	????	
  54:	08 89       	sub	r9,	r8	
  56:	04 42       	mov	r2,	r4	
  58:	0e 0a       	.word	0x0a0e;	????	
  5a:	88 05       	.word	0x0588;	????	
  5c:	42 0e       	.word	0x0e42;	????	
  5e:	0c 87       	sub	r7,	r12	
  60:	06 42       	mov	r2,	r6	
  62:	0e 0e       	.word	0x0e0e;	????	
  64:	86 07       	.word	0x0786;	????	
  66:	42 0e       	.word	0x0e42;	????	
  68:	10 85 08 42 	sub	16904(r5),r0	;0x4208(r5)
  6c:	0e 12       	push	r14		
  6e:	84 09       	.word	0x0984;	????	
  70:	42 0e       	.word	0x0e42;	????	
  72:	1a 00       	.word	0x001a;	????	
  74:	62 00       	.word	0x0062;	????	
  76:	00 00       	.word	0x0000;	????	
  78:	2a 00       	.word	0x002a;	????	
  7a:	00 00       	.word	0x0000;	????	
  7c:	a0 c2 9e 06 	bic	#4,	1694(r0);r2 As==10, PC rel. 0x071c
  80:	42 0e       	.word	0x0e42;	????	
  82:	04 8b       	sub	r11,	r4	
  84:	02 42       	mov	r2,	r2	
  86:	0e 06       	.word	0x060e;	????	
  88:	8a 03       	.word	0x038a;	????	
  8a:	42 0e       	.word	0x0e42;	????	
  8c:	08 89       	sub	r9,	r8	
  8e:	04 42       	mov	r2,	r4	
  90:	0e 0a       	.word	0x0a0e;	????	
  92:	88 05       	.word	0x0588;	????	
  94:	42 0e       	.word	0x0e42;	????	
  96:	0c 87       	sub	r7,	r12	
  98:	06 42       	mov	r2,	r6	
  9a:	0e 0e       	.word	0x0e0e;	????	
  9c:	86 07       	.word	0x0786;	????	
  9e:	42 0e       	.word	0x0e42;	????	
  a0:	10 85 08 42 	sub	16904(r5),r0	;0x4208(r5)
  a4:	0e 12       	push	r14		
  a6:	84 09       	.word	0x0984;	????	
  a8:	44 0e       	.word	0x0e44;	????	
  aa:	5c 03       	.word	0x035c;	????	
  ac:	66 02       	.word	0x0266;	????	
  ae:	0e 60       	addc	r0,	r14	
  b0:	48 2e       	jc	$-878    	;abs 0xfd42
  b2:	04 46       	mov	r6,	r4	
  b4:	0e 5c       	add	r12,	r14	
  b6:	03 be       	.word	0xbe03;	????	Illegal as 2-op instr
  b8:	01 0e       	.word	0x0e01;	????	
  ba:	64 4a       	mov.b	@r10,	r4	
  bc:	2e 08       	.word	0x082e;	????	
  be:	46 0e       	.word	0x0e46;	????	
  c0:	5c 7e 0e 64 	subc.b	25614(r14),r12	;0x640e(r14)
  c4:	50 0e       	.word	0x0e50;	????	
  c6:	5c 02       	.word	0x025c;	????	
  c8:	56 2e       	jc	$-850    	;abs 0xfd76
  ca:	00 03       	.word	0x0300;	????	
  cc:	2a 01       	.word	0x012a;	????	
  ce:	0e 60       	addc	r0,	r14	
  d0:	4c 2e       	jc	$-870    	;abs 0xfd6a
  d2:	04 46       	mov	r6,	r4	
  d4:	0e 5c       	add	r12,	r14	
  d6:	4a 2e       	jc	$-874    	;abs 0xfd6c
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f 5f 62 75 	add.b	30050(r15),r15	;0x7562(r15)
   4:	69 6c       	addc.b	@r12,	r9	
   6:	74 69       	addc.b	@r9+,	r4	
   8:	6e 5f       	add.b	@r15,	r14	
   a:	76 61       	addc.b	@r1+,	r6	
   c:	5f 6c 69 73 	addc.b	29545(r12),r15	;0x7369(r12)
  10:	74 00       	.word	0x0074;	????	
  12:	76 70 72 69 	subc.b	#26994,	r6	;#0x6972
  16:	6e 74       	subc.b	@r4,	r14	
  18:	66 00       	.word	0x0066;	????	
  1a:	2e 2f       	jc	$-418    	;abs 0xfe78
  1c:	73 74       	.word	0x7473;	????	Illegal as 2-op instr
  1e:	64 6c       	addc.b	@r12,	r4	
  20:	69 62       	addc.b	#4,	r9	;r2 As==10
  22:	2f 70       	subc	@r0,	r15	
  24:	72 69       	addc.b	@r9+,	r2	
  26:	6e 74       	subc.b	@r4,	r14	
  28:	66 2e       	jc	$-818    	;abs 0xfcf6
  2a:	63 00       	.word	0x0063;	????	
  2c:	5f 5f 67 6e 	add.b	28263(r15),r15	;0x6e67(r15)
  30:	75 63       	addc.b	#-1,	r5	;r3 As==11
  32:	5f 76 61 5f 	subc.b	24417(r6),r15	;0x5f61(r6)
  36:	6c 69       	addc.b	@r9,	r12	
  38:	73 74       	.word	0x7473;	????	Illegal as 2-op instr
  3a:	00 75       	subc	r5,	r0	
  3c:	6e 73       	subc.b	#2,	r14	;r3 As==10
  3e:	69 67       	addc.b	@r7,	r9	
  40:	6e 65       	addc.b	@r5,	r14	
  42:	64 20       	jnz	$+202    	;abs 0x10c
  44:	63 68       	.word	0x6863;	????	Illegal as 2-op instr
  46:	61 72       	subc.b	#4,	r1	;r2 As==10
  48:	00 73       	sbc	r0		
  4a:	68 6f       	addc.b	@r15,	r8	
  4c:	72 74       	subc.b	@r4+,	r2	
  4e:	20 75       	subc	@r5,	r0	
  50:	6e 73       	subc.b	#2,	r14	;r3 As==10
  52:	69 67       	addc.b	@r7,	r9	
  54:	6e 65       	addc.b	@r5,	r14	
  56:	64 20       	jnz	$+202    	;abs 0x120
  58:	69 6e       	addc.b	@r14,	r9	
  5a:	74 00       	.word	0x0074;	????	
  5c:	6c 6f       	addc.b	@r15,	r12	
  5e:	6e 67       	addc.b	@r7,	r14	
  60:	20 6c       	addc	@r12,	r0	
  62:	6f 6e       	addc.b	@r14,	r15	
  64:	67 20       	jnz	$+208    	;abs 0x134
  66:	75 6e       	addc.b	@r14+,	r5	
  68:	73 69       	.word	0x6973;	????	Illegal as 2-op instr
  6a:	67 6e       	addc.b	@r14,	r7	
  6c:	65 64       	addc.b	@r4,	r5	
  6e:	20 69       	addc	@r9,	r0	
  70:	6e 74       	subc.b	@r4,	r14	
  72:	00 6c       	addc	r12,	r0	
  74:	6f 6e       	addc.b	@r14,	r15	
  76:	67 20       	jnz	$+208    	;abs 0x146
  78:	6c 6f       	addc.b	@r15,	r12	
  7a:	6e 67       	addc.b	@r7,	r14	
  7c:	20 69       	addc	@r9,	r0	
  7e:	6e 74       	subc.b	@r4,	r14	
  80:	00 47       	br	r7		
  82:	4e 55       	add.b	r5,	r14	
  84:	20 43       	br	#2		;r3 As==10
  86:	20 34       	jge	$+66     	;abs 0xc8
  88:	2e 36       	jge	$-930    	;abs 0xfce6
  8a:	2e 33       	jn	$-418    	;abs 0xfee8
  8c:	20 32       	jn	$-958    	;abs 0xfcce
  8e:	30 31       	jn	$+610    	;abs 0x2f0
  90:	32 30       	jn	$+102    	;abs 0xf6
  92:	33 30       	jn	$+104    	;abs 0xfa
  94:	31 20       	jnz	$+100    	;abs 0xf8
  96:	28 6d       	addc	@r13,	r8	
  98:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
  9a:	67 63       	addc.b	#2,	r7	;r3 As==10
  9c:	63 20       	jnz	$+200    	;abs 0x164
  9e:	4c 54       	add.b	r4,	r12	
  a0:	53 20       	jnz	$+168    	;abs 0x148
  a2:	32 30       	jn	$+102    	;abs 0x108
  a4:	31 32       	jn	$-924    	;abs 0xfd08
  a6:	30 34       	jge	$+98     	;abs 0x108
  a8:	30 36       	jge	$-926    	;abs 0xfd0a
  aa:	20 75       	subc	@r5,	r0	
  ac:	6e 70       	subc.b	@r0,	r14	
  ae:	61 74       	subc.b	@r4,	r1	
  b0:	63 68       	.word	0x6863;	????	Illegal as 2-op instr
  b2:	65 64       	addc.b	@r4,	r5	
  b4:	29 00       	.word	0x0029;	????	
  b6:	2f 62       	addc	#4,	r15	;r2 As==10
  b8:	75 69       	addc.b	@r9+,	r5	
  ba:	6c 64       	addc.b	@r4,	r12	
  bc:	2f 6d       	addc	@r13,	r15	
  be:	73 70       	.word	0x7073;	????	Illegal as 2-op instr
  c0:	34 33       	jn	$-406    	;abs 0xff2a
  c2:	30 2d       	jc	$+610    	;abs 0x324
  c4:	6c 69       	addc.b	@r9,	r12	
  c6:	62 63       	addc.b	#2,	r2	;r3 As==10
  c8:	2d 4f       	mov	@r15,	r13	
  ca:	6b 6d       	addc.b	@r13,	r11	
  cc:	30 51       	add	@r1+,	r0	
  ce:	58 2f       	jc	$-334    	;abs 0xff80
  d0:	6d 73       	subc.b	#2,	r13	;r3 As==10
  d2:	70 34       	jge	$+226    	;abs 0x1b4
  d4:	33 30       	jn	$+104    	;abs 0x13c
  d6:	2d 6c       	addc	@r12,	r13	
  d8:	69 62       	addc.b	#4,	r9	;r2 As==10
  da:	63 2d       	jc	$+712    	;abs 0x3a2
  dc:	32 30       	jn	$+102    	;abs 0x142
  de:	31 32       	jn	$-924    	;abs 0xfd42
  e0:	30 32       	jn	$-926    	;abs 0xfd42
  e2:	32 34       	jge	$+102    	;abs 0x148
  e4:	2f 73       	subc	#2,	r15	;r3 As==10
  e6:	72 63       	addc.b	#-1,	r2	;r3 As==11
  e8:	00 61       	addc	r1,	r0	
  ea:	72 67       	addc.b	@r7+,	r2	
  ec:	70 00       	.word	0x0070;	????	
  ee:	62 61       	addc.b	@r1,	r2	
  f0:	64 5f       	add.b	@r15,	r4	
  f2:	66 6f       	addc.b	@r15,	r6	
  f4:	72 6d       	addc.b	@r13+,	r2	
  f6:	61 74       	subc.b	@r4,	r1	
  f8:	00 75       	subc	r5,	r0	
  fa:	69 6e       	addc.b	@r14,	r9	
  fc:	74 36       	jge	$-790    	;abs 0xfde6
  fe:	34 5f       	add	@r15+,	r4	
 100:	74 00       	.word	0x0074;	????	
 102:	69 6e       	addc.b	@r14,	r9	
 104:	74 70 74 72 	subc.b	#29300,	r4	;#0x7274
 108:	5f 74 00 6d 	subc.b	27904(r4),r15	;0x6d00(r4)
 10c:	6f 64       	addc.b	@r4,	r15	
 10e:	65 00       	.word	0x0065;	????	
 110:	65 6d       	addc.b	@r13,	r5	
 112:	69 74       	subc.b	@r4,	r9	
 114:	5f 6f 63 74 	addc.b	29795(r15),r15	;0x7463(r15)
 118:	61 6c       	addc.b	@r12,	r1	
 11a:	5f 70 72 65 	subc.b	25970(r0),r15	;PC rel. 0x668e
 11e:	66 69       	addc.b	@r9,	r6	
 120:	78 00       	.word	0x0078;	????	
 122:	6c 65       	addc.b	@r5,	r12	
 124:	61 64       	addc.b	@r4,	r1	
 126:	69 6e       	addc.b	@r14,	r9	
 128:	67 5f       	add.b	@r15,	r7	
 12a:	66 69       	addc.b	@r9,	r6	
 12c:	6c 6c       	addc.b	@r12,	r12	
 12e:	00 77       	subc	r7,	r0	
 130:	72 69       	addc.b	@r9+,	r2	
 132:	74 65       	addc.b	@r5+,	r4	
 134:	5f 63       	addc.b	#1,	r15	;r3 As==01
 136:	68 61       	addc.b	@r1,	r8	
 138:	72 00       	.word	0x0072;	????	
 13a:	75 69       	addc.b	@r9+,	r5	
 13c:	6e 74       	subc.b	@r4,	r14	
 13e:	38 5f       	add	@r15+,	r8	
 140:	74 00       	.word	0x0074;	????	
 142:	65 6d       	addc.b	@r13,	r5	
 144:	69 74       	subc.b	@r4,	r9	
 146:	5f 68 65 78 	addc.b	30821(r8),r15	;0x7865(r8)
 14a:	5f 70 72 65 	subc.b	25970(r0),r15	;PC rel. 0x66be
 14e:	66 69       	addc.b	@r9,	r6	
 150:	78 00       	.word	0x0078;	????	
 152:	70 72       	subc.b	#8,	r0	;r2 As==11
 154:	65 66       	addc.b	@r6,	r5	
 156:	69 78       	subc.b	@r8,	r9	
 158:	5f 6c 65 6e 	addc.b	28261(r12),r15	;0x6e65(r12)
 15c:	00 63       	adc	r0		
 15e:	68 61       	addc.b	@r1,	r8	
 160:	72 5f       	add.b	@r15+,	r2	
 162:	70 00       	.word	0x0070;	????	
 164:	44 49       	mov.b	r9,	r4	
 166:	52 45 43 54 	mov.b	21571(r5),r2	;0x5443(r5)
 16a:	00 69       	addc	r9,	r0	
 16c:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 16e:	7a 65       	addc.b	@r5+,	r10	
 170:	72 6f       	addc.b	@r15+,	r2	
 172:	00 69       	addc	r9,	r0	
 174:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 176:	61 6c       	addc.b	@r12,	r1	
 178:	74 65       	addc.b	@r5+,	r4	
 17a:	72 6e       	addc.b	@r14+,	r2	
 17c:	61 74       	subc.b	@r4,	r1	
 17e:	65 5f       	add.b	@r15,	r5	
 180:	66 6f       	addc.b	@r15,	r6	
 182:	72 6d       	addc.b	@r13+,	r2	
 184:	00 69       	addc	r9,	r0	
 186:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 188:	6e 65       	addc.b	@r5,	r14	
 18a:	67 61       	addc.b	@r1,	r7	
 18c:	74 69       	addc.b	@r9+,	r4	
 18e:	76 65       	addc.b	@r5+,	r6	
 190:	00 69       	addc	r9,	r0	
 192:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 194:	6c 6f       	addc.b	@r15,	r12	
 196:	6e 67       	addc.b	@r7,	r14	
 198:	36 34       	jge	$+110    	;abs 0x206
 19a:	00 73       	sbc	r0		
 19c:	70 65       	addc.b	@r5+,	r0	
 19e:	63 69       	.word	0x6963;	????	Illegal as 2-op instr
 1a0:	66 69       	addc.b	@r9,	r6	
 1a2:	65 72       	subc.b	#4,	r5	;r2 As==10
 1a4:	00 75       	subc	r5,	r0	
 1a6:	70 70 65 72 	subc.b	#29285,	r0	;#0x7265
 1aa:	63 61       	.word	0x6163;	????	Illegal as 2-op instr
 1ac:	73 65       	.word	0x6573;	????	Illegal as 2-op instr
 1ae:	00 7a       	subc	r10,	r0	
 1b0:	65 72       	subc.b	#4,	r5	;r2 As==10
 1b2:	6f 5f       	add.b	@r15,	r15	
 1b4:	70 61       	addc.b	@r1+,	r0	
 1b6:	64 5f       	add.b	@r15,	r4	
 1b8:	70 72       	subc.b	#8,	r0	;r2 As==11
 1ba:	65 63       	addc.b	#2,	r5	;r3 As==10
 1bc:	69 73       	subc.b	#2,	r9	;r3 As==10
 1be:	69 6f       	addc.b	@r15,	r9	
 1c0:	6e 00       	.word	0x006e;	????	
 1c2:	68 61       	addc.b	@r1,	r8	
 1c4:	76 65       	addc.b	@r5+,	r6	
 1c6:	5f 77 70 5f 	subc.b	24432(r7),r15	;0x5f70(r7)
 1ca:	76 61       	addc.b	@r1+,	r6	
 1cc:	6c 75       	subc.b	@r5,	r12	
 1ce:	65 00       	.word	0x0065;	????	
 1d0:	46 4f       	mov.b	r15,	r6	
 1d2:	52 4d 41 54 	mov.b	21569(r13),r2	;0x5441(r13)
 1d6:	49 4e       	mov.b	r14,	r9	
 1d8:	47 00       	.word	0x0047;	????	
 1da:	70 72       	subc.b	#8,	r0	;r2 As==11
 1dc:	69 6e       	addc.b	@r14,	r9	
 1de:	74 5f       	add.b	@r15+,	r4	
 1e0:	66 69       	addc.b	@r9,	r6	
 1e2:	65 6c       	addc.b	@r12,	r5	
 1e4:	64 00       	.word	0x0064;	????	
 1e6:	66 65       	addc.b	@r5,	r6	
 1e8:	74 63       	addc.b	#-1,	r4	;r3 As==11
 1ea:	68 5f       	add.b	@r15,	r8	
 1ec:	6e 75       	subc.b	@r5,	r14	
 1ee:	6d 62       	addc.b	#4,	r13	;r2 As==10
 1f0:	65 72       	subc.b	#4,	r5	;r2 As==10
 1f2:	00 70       	subc	r0,	r0	
 1f4:	72 65       	addc.b	@r5+,	r2	
 1f6:	66 69       	addc.b	@r9,	r6	
 1f8:	78 5f       	add.b	@r15+,	r8	
 1fa:	69 64       	addc.b	@r4,	r9	
 1fc:	78 00       	.word	0x0078;	????	
 1fe:	66 6c       	addc.b	@r12,	r6	
 200:	61 67       	addc.b	@r7,	r1	
 202:	73 00       	.word	0x0073;	????	
 204:	75 69       	addc.b	@r9+,	r5	
 206:	6e 74       	subc.b	@r4,	r14	
 208:	33 32       	jn	$-920    	;abs 0xfe70
 20a:	5f 74 00 69 	subc.b	26880(r4),r15	;0x6900(r4)
 20e:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 210:	6c 6f       	addc.b	@r15,	r12	
 212:	6e 67       	addc.b	@r7,	r14	
 214:	33 32       	jn	$-920    	;abs 0xfe7c
 216:	00 75       	subc	r5,	r0	
 218:	69 6e       	addc.b	@r14,	r9	
 21a:	74 31       	jn	$+746    	;abs 0x504
 21c:	36 5f       	add	@r15+,	r6	
 21e:	74 00       	.word	0x0074;	????	
 220:	61 72       	subc.b	#4,	r1	;r2 As==10
 222:	67 73       	subc.b	#2,	r7	;r3 As==10
 224:	00 70       	subc	r0,	r0	
 226:	72 65       	addc.b	@r5+,	r2	
 228:	66 69       	addc.b	@r9,	r6	
 22a:	78 5f       	add.b	@r15+,	r8	
 22c:	62 75       	subc.b	@r5,	r2	
 22e:	66 66       	addc.b	@r6,	r6	
 230:	65 72       	subc.b	#4,	r5	;r2 As==10
 232:	00 72       	subc	r2,	r0	
 234:	61 64       	addc.b	@r4,	r1	
 236:	69 78       	subc.b	@r8,	r9	
 238:	00 68       	addc	r8,	r0	
 23a:	61 76       	subc.b	@r6,	r1	
 23c:	65 5f       	add.b	@r15,	r5	
 23e:	70 72       	subc.b	#8,	r0	;r2 As==11
 240:	65 63       	addc.b	#2,	r5	;r3 As==10
 242:	69 73       	subc.b	#2,	r9	;r3 As==10
 244:	69 6f       	addc.b	@r15,	r9	
 246:	6e 00       	.word	0x006e;	????	
 248:	5f 42 6f 6f 	mov.b	&0x6f6f,r15	
 24c:	6c 00       	.word	0x006c;	????	
 24e:	6e 75       	subc.b	@r5,	r14	
 250:	6d 62       	addc.b	#4,	r13	;r2 As==10
 252:	65 72       	subc.b	#4,	r5	;r2 As==10
 254:	5f 77 69 64 	subc.b	25705(r7),r15	;0x6469(r7)
 258:	74 68       	addc.b	@r8+,	r4	
 25a:	00 77       	subc	r7,	r0	
 25c:	72 69       	addc.b	@r9+,	r2	
 25e:	74 65       	addc.b	@r5+,	r4	
 260:	5f 63       	addc.b	#1,	r15	;r3 As==01
 262:	68 61       	addc.b	@r1,	r8	
 264:	72 61       	addc.b	@r1+,	r2	
 266:	63 74       	.word	0x7463;	????	Illegal as 2-op instr
 268:	65 72       	subc.b	#4,	r5	;r2 As==10
 26a:	00 73       	sbc	r0		
 26c:	69 67       	addc.b	@r7,	r9	
 26e:	6e 5f       	add.b	@r15,	r14	
 270:	63 68       	.word	0x6863;	????	Illegal as 2-op instr
 272:	61 72       	subc.b	#4,	r1	;r2 As==10
 274:	00 76       	subc	r6,	r0	
 276:	75 70 72 69 	subc.b	#26994,	r5	;#0x6972
 27a:	6e 74       	subc.b	@r4,	r14	
 27c:	66 00       	.word	0x0066;	????	
 27e:	74 72       	subc.b	#8,	r4	;r2 As==11
 280:	75 6e       	addc.b	@r14+,	r5	
 282:	63 61       	.word	0x6163;	????	Illegal as 2-op instr
 284:	74 65       	addc.b	@r5+,	r4	
 286:	5f 70 72 65 	subc.b	25970(r0),r15	;PC rel. 0x67fa
 28a:	63 69       	.word	0x6963;	????	Illegal as 2-op instr
 28c:	73 69       	.word	0x6973;	????	Illegal as 2-op instr
 28e:	6f 6e       	addc.b	@r14,	r15	
 290:	00 69       	addc	r9,	r0	
 292:	73 5f       	.word	0x5f73;	????	Illegal as 2-op instr
 294:	73 69       	.word	0x6973;	????	Illegal as 2-op instr
 296:	67 6e       	addc.b	@r14,	r7	
 298:	65 64       	addc.b	@r4,	r5	
 29a:	00 66       	addc	r6,	r0	
 29c:	6c 61       	addc.b	@r1,	r12	
 29e:	67 73       	subc.b	#2,	r7	;r3 As==10
 2a0:	5f 74 00 66 	subc.b	26112(r4),r15	;0x6600(r4)
 2a4:	69 6c       	addc.b	@r12,	r9	
 2a6:	6c 5f       	add.b	@r15,	r12	
 2a8:	7a 65       	addc.b	@r5+,	r10	
 2aa:	72 6f       	addc.b	@r15+,	r2	
 2ac:	00 2e       	jc	$-1022   	;abs 0xfeae
 2ae:	2f 73       	subc	#2,	r15	;r3 As==10
 2b0:	74 64       	addc.b	@r4+,	r4	
 2b2:	6c 69       	addc.b	@r9,	r12	
 2b4:	62 2f       	jc	$-314    	;abs 0x17a
 2b6:	76 75       	subc.b	@r5+,	r6	
 2b8:	70 72       	subc.b	#8,	r0	;r2 As==11
 2ba:	69 6e       	addc.b	@r14,	r9	
 2bc:	74 66       	addc.b	@r6+,	r4	
 2be:	2e 63       	addc	#2,	r14	;r3 As==10
 2c0:	00 64       	addc	r4,	r0	
 2c2:	69 67       	addc.b	@r7,	r9	
 2c4:	69 74       	subc.b	@r4,	r9	
 2c6:	00 63       	adc	r0		
 2c8:	68 61       	addc.b	@r1,	r8	
 2ca:	72 61       	addc.b	@r1+,	r2	
 2cc:	63 74       	.word	0x7463;	????	Illegal as 2-op instr
 2ce:	65 72       	subc.b	#4,	r5	;r2 As==10
 2d0:	5f 63       	addc.b	#1,	r15	;r3 As==01
 2d2:	6f 75       	subc.b	@r5,	r15	
 2d4:	6e 74       	subc.b	@r4,	r14	
 2d6:	00 65       	addc	r5,	r0	
 2d8:	6d 69       	addc.b	@r9,	r13	
 2da:	74 5f       	add.b	@r15+,	r4	
 2dc:	73 74       	.word	0x7473;	????	Illegal as 2-op instr
 2de:	72 69       	addc.b	@r9+,	r2	
 2e0:	6e 67       	addc.b	@r7,	r14	
 2e2:	00 6c       	addc	r12,	r0	
 2e4:	65 66       	addc.b	@r6,	r5	
 2e6:	74 5f       	add.b	@r15+,	r4	
 2e8:	61 6c       	addc.b	@r12,	r1	
 2ea:	69 67       	addc.b	@r7,	r9	
 2ec:	6e 00       	.word	0x006e;	????	
 2ee:	65 6d       	addc.b	@r13,	r5	
 2f0:	69 74       	subc.b	@r4,	r9	
 2f2:	5f 6e 75 6d 	addc.b	28021(r14),r15	;0x6d75(r14)
 2f6:	62 65       	addc.b	@r5,	r2	
 2f8:	72 00       	.word	0x0072;	????	
 2fa:	62 75       	subc.b	@r5,	r2	
 2fc:	69 6c       	addc.b	@r12,	r9	
 2fe:	64 5f       	add.b	@r15,	r4	
 300:	6e 75       	subc.b	@r5,	r14	
 302:	6d 65       	addc.b	@r5,	r13	
 304:	72 69       	addc.b	@r9+,	r2	
 306:	63 5f       	.word	0x5f63;	????	Illegal as 2-op instr
 308:	70 72       	subc.b	#8,	r0	;r2 As==11
 30a:	65 66       	addc.b	@r6,	r5	
 30c:	69 78       	subc.b	@r8,	r9	
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	06 00       	.word	0x0006;	????	
   2:	0d 00       	.word	0x000d;	????	
   4:	01 00       	.word	0x0001;	????	
   6:	5d 0d       	.word	0x0d5d;	????	
   8:	00 10       	rrc	r0		
   a:	00 03       	.word	0x0300;	????	
   c:	00 91       	cmp	r1,	r0	
   e:	02 9f       	cmp	r15,	r2	
  10:	00 00       	.word	0x0000;	????	
  12:	00 00       	.word	0x0000;	????	
  14:	10 00       	.word	0x0010;	????	
  16:	18 00       	.word	0x0018;	????	
  18:	01 00       	.word	0x0001;	????	
  1a:	5f 18       	.word	0x185f;	????	
  1c:	00 1b       	.word	0x1b00;	????	
  1e:	00 01       	.word	0x0100;	????	
  20:	00 5e       	add	r14,	r0	
  22:	00 00       	.word	0x0000;	????	
  24:	00 00       	.word	0x0000;	????	
  26:	10 00       	.word	0x0010;	????	
  28:	14 00       	.word	0x0014;	????	
  2a:	01 00       	.word	0x0001;	????	
  2c:	5e 14       	.word	0x145e;	????	
  2e:	00 1b       	.word	0x1b00;	????	
  30:	00 01       	.word	0x0100;	????	
  32:	00 5d       	add	r13,	r0	
  34:	00 00       	.word	0x0000;	????	
  36:	00 00       	.word	0x0000;	????	
  38:	00 00       	.word	0x0000;	????	
  3a:	02 00       	.word	0x0002;	????	
  3c:	02 00       	.word	0x0002;	????	
  3e:	71 02       	.word	0x0271;	????	
  40:	02 00       	.word	0x0002;	????	
  42:	04 00       	.word	0x0004;	????	
  44:	02 00       	.word	0x0002;	????	
  46:	71 04       	.word	0x0471;	????	
  48:	04 00       	.word	0x0004;	????	
  4a:	06 00       	.word	0x0006;	????	
  4c:	02 00       	.word	0x0002;	????	
  4e:	71 06       	.word	0x0671;	????	
  50:	06 00       	.word	0x0006;	????	
  52:	08 00       	.word	0x0008;	????	
  54:	02 00       	.word	0x0002;	????	
  56:	71 08       	.word	0x0871;	????	
  58:	08 00       	.word	0x0008;	????	
  5a:	0a 00       	.word	0x000a;	????	
  5c:	02 00       	.word	0x0002;	????	
  5e:	71 0a       	.word	0x0a71;	????	
  60:	0a 00       	.word	0x000a;	????	
  62:	0c 00       	.word	0x000c;	????	
  64:	02 00       	.word	0x0002;	????	
  66:	71 0c       	.word	0x0c71;	????	
  68:	0c 00       	.word	0x000c;	????	
  6a:	0e 00       	.word	0x000e;	????	
  6c:	02 00       	.word	0x0002;	????	
  6e:	71 0e       	.word	0x0e71;	????	
  70:	0e 00       	.word	0x000e;	????	
  72:	10 00       	.word	0x0010;	????	
  74:	02 00       	.word	0x0002;	????	
  76:	71 10       	rrc.b	@r1+		
  78:	10 00       	.word	0x0010;	????	
  7a:	12 00       	.word	0x0012;	????	
  7c:	02 00       	.word	0x0002;	????	
  7e:	71 12       	push.b	@r1+		
  80:	12 00       	.word	0x0012;	????	
  82:	98 01       	.word	0x0198;	????	
  84:	02 00       	.word	0x0002;	????	
  86:	71 1a       	.word	0x1a71;	????	
  88:	00 00       	.word	0x0000;	????	
  8a:	00 00       	.word	0x0000;	????	
  8c:	00 00       	.word	0x0000;	????	
  8e:	1e 00       	.word	0x001e;	????	
  90:	01 00       	.word	0x0001;	????	
  92:	5f 1e       	.word	0x1e5f;	????	
  94:	00 90       	cmp	r0,	r0	
  96:	01 01       	.word	0x0101;	????	
  98:	00 58       	add	r8,	r0	
  9a:	00 00       	.word	0x0000;	????	
  9c:	00 00       	.word	0x0000;	????	
  9e:	00 00       	.word	0x0000;	????	
  a0:	2c 00       	.word	0x002c;	????	
  a2:	01 00       	.word	0x0001;	????	
  a4:	5e 2c       	jc	$+190    	;abs 0x162
  a6:	00 5e       	add	r14,	r0	
  a8:	01 02       	.word	0x0201;	????	
  aa:	00 91       	cmp	r1,	r0	
  ac:	6a 00       	.word	0x006a;	????	
  ae:	00 00       	.word	0x0000;	????	
  b0:	00 00       	.word	0x0000;	????	
  b2:	00 22       	jnz	$-1022   	;abs 0xfcb4
  b4:	00 01       	.word	0x0100;	????	
  b6:	00 5d       	add	r13,	r0	
  b8:	22 00       	.word	0x0022;	????	
  ba:	92 01       	.word	0x0192;	????	
  bc:	01 00       	.word	0x0001;	????	
  be:	59 00       	.word	0x0059;	????	
  c0:	00 00       	.word	0x0000;	????	
  c2:	00 00       	.word	0x0000;	????	
  c4:	00 24       	jz	$+2      	;abs 0xc6
  c6:	00 02       	.word	0x0200;	????	
  c8:	00 91       	cmp	r1,	r0	
  ca:	00 24       	jz	$+2      	;abs 0xcc
  cc:	00 28       	jnc	$+2      	;abs 0xce
  ce:	00 07       	.word	0x0700;	????	
  d0:	00 93       	tst	r0		
  d2:	02 5c       	add	r12,	r2	
  d4:	93 01       	.word	0x0193;	????	
  d6:	93 01       	.word	0x0193;	????	
  d8:	28 00       	.word	0x0028;	????	
  da:	50 00       	.word	0x0050;	????	
  dc:	08 00       	.word	0x0008;	????	
  de:	93 02       	.word	0x0293;	????	
  e0:	5c 93       	cmp.b	#1,	r12	;r3 As==01
  e2:	01 54       	add	r4,	r1	
  e4:	93 01       	.word	0x0193;	????	
  e6:	50 00       	.word	0x0050;	????	
  e8:	54 00       	.word	0x0054;	????	
  ea:	05 00       	.word	0x0005;	????	
  ec:	93 03       	.word	0x0393;	????	
  ee:	54 93       	cmp.b	#1,	r4	;r3 As==01
  f0:	01 54       	add	r4,	r1	
  f2:	00 6c       	addc	r12,	r0	
  f4:	00 08       	.word	0x0800;	????	
  f6:	00 93       	tst	r0		
  f8:	02 5c       	add	r12,	r2	
  fa:	93 01       	.word	0x0193;	????	
  fc:	54 93       	cmp.b	#1,	r4	;r3 As==01
  fe:	01 6c       	addc	r12,	r1	
 100:	00 70       	subc	r0,	r0	
 102:	00 05       	.word	0x0500;	????	
 104:	00 93       	tst	r0		
 106:	03 54       	.word	0x5403;	????	Illegal as 2-op instr
 108:	93 01       	.word	0x0193;	????	
 10a:	70 00       	.word	0x0070;	????	
 10c:	72 00       	.word	0x0072;	????	
 10e:	08 00       	.word	0x0008;	????	
 110:	93 02       	.word	0x0293;	????	
 112:	5c 93       	cmp.b	#1,	r12	;r3 As==01
 114:	01 54       	add	r4,	r1	
 116:	93 01       	.word	0x0193;	????	
 118:	72 00       	.word	0x0072;	????	
 11a:	44 01       	.word	0x0144;	????	
 11c:	05 00       	.word	0x0005;	????	
 11e:	93 03       	.word	0x0393;	????	
 120:	54 93       	cmp.b	#1,	r4	;r3 As==01
 122:	01 4c       	mov	r12,	r1	
 124:	01 5e       	add	r14,	r1	
 126:	01 05       	.word	0x0501;	????	
 128:	00 93       	tst	r0		
 12a:	03 54       	.word	0x5403;	????	Illegal as 2-op instr
 12c:	93 01       	.word	0x0193;	????	
 12e:	00 00       	.word	0x0000;	????	
 130:	00 00       	.word	0x0000;	????	
 132:	28 00       	.word	0x0028;	????	
 134:	0e 01       	.word	0x010e;	????	
 136:	02 00       	.word	0x0002;	????	
 138:	30 9f       	cmp	@r15+,	r0	
 13a:	0e 01       	.word	0x010e;	????	
 13c:	22 01       	.word	0x0122;	????	
 13e:	01 00       	.word	0x0001;	????	
 140:	5b 22       	jnz	$-840    	;abs 0xfdf8
 142:	01 28       	jnc	$+4      	;abs 0x146
 144:	01 02       	.word	0x0201;	????	
 146:	00 30       	jn	$+2      	;abs 0x148
 148:	9f 28       	jnc	$+320    	;abs 0x288
 14a:	01 44       	mov	r4,	r1	
 14c:	01 01       	.word	0x0101;	????	
 14e:	00 5b       	add	r11,	r0	
 150:	5e 01       	.word	0x015e;	????	
 152:	96 01       	.word	0x0196;	????	
 154:	01 00       	.word	0x0001;	????	
 156:	5b 96 01 98 	cmp.b	-26623(r6),r11	;0x9801(r6)
 15a:	01 01       	.word	0x0101;	????	
 15c:	00 5f       	add	r15,	r0	
 15e:	00 00       	.word	0x0000;	????	
 160:	00 00       	.word	0x0000;	????	
 162:	28 00       	.word	0x0028;	????	
 164:	ee 00       	.word	0x00ee;	????	
 166:	02 00       	.word	0x0002;	????	
 168:	30 9f       	cmp	@r15+,	r0	
 16a:	ee 00       	.word	0x00ee;	????	
 16c:	fc 00       	.word	0x00fc;	????	
 16e:	01 00       	.word	0x0001;	????	
 170:	56 fc 00 fe 	and.b	-512(r12),r6	;0xfe00(r12)
 174:	00 02       	.word	0x0200;	????	
 176:	00 30       	jn	$+2      	;abs 0x178
 178:	9f fe 00 0a 	and	2560(r14),257(r15);0x0a00(r14), 0x0101(r15)
 17c:	01 01 
 17e:	00 56       	add	r6,	r0	
 180:	0e 01       	.word	0x010e;	????	
 182:	22 01       	.word	0x0122;	????	
 184:	01 00       	.word	0x0001;	????	
 186:	56 22       	jnz	$-850    	;abs 0xfe34
 188:	01 28       	jnc	$+4      	;abs 0x18c
 18a:	01 02       	.word	0x0201;	????	
 18c:	00 30       	jn	$+2      	;abs 0x18e
 18e:	9f 28       	jnc	$+320    	;abs 0x2ce
 190:	01 8c       	sub	r12,	r1	
 192:	01 01       	.word	0x0101;	????	
 194:	00 56       	add	r6,	r0	
 196:	00 00       	.word	0x0000;	????	
 198:	00 00       	.word	0x0000;	????	
 19a:	2a 00       	.word	0x002a;	????	
 19c:	a2 00       	.word	0x00a2;	????	
 19e:	01 00       	.word	0x0001;	????	
 1a0:	55 a2 00 5e 	dadd.b	&0x5e00,r5	
 1a4:	01 01       	.word	0x0101;	????	
 1a6:	00 57       	add	r7,	r0	
 1a8:	5e 01       	.word	0x015e;	????	
 1aa:	60 01       	.word	0x0160;	????	
 1ac:	03 00       	.word	0x0003;	????	
 1ae:	77 7f       	subc.b	@r15+,	r7	
 1b0:	9f 60 01 70 	addc	28673(r0),257(r15);PC rel. 0x71b3, 0x0101(r15)
 1b4:	01 01 
 1b6:	00 57       	add	r7,	r0	
 1b8:	70 01       	.word	0x0170;	????	
 1ba:	76 01       	.word	0x0176;	????	
 1bc:	03 00       	.word	0x0003;	????	
 1be:	77 7f       	subc.b	@r15+,	r7	
 1c0:	9f 00       	.word	0x009f;	????	
 1c2:	00 00       	.word	0x0000;	????	
 1c4:	00 2a       	jnc	$-1022   	;abs 0xfdc6
 1c6:	00 3a       	jl	$-1022   	;abs 0xfdc8
 1c8:	00 08       	.word	0x0800;	????	
 1ca:	00 93       	tst	r0		
 1cc:	02 5c       	add	r12,	r2	
 1ce:	93 01       	.word	0x0193;	????	
 1d0:	54 93       	cmp.b	#1,	r4	;r3 As==01
 1d2:	01 54       	add	r4,	r1	
 1d4:	00 6c       	addc	r12,	r0	
 1d6:	00 07       	.word	0x0700;	????	
 1d8:	00 93       	tst	r0		
 1da:	02 5c       	add	r12,	r2	
 1dc:	93 01       	.word	0x0193;	????	
 1de:	93 01       	.word	0x0193;	????	
 1e0:	70 00       	.word	0x0070;	????	
 1e2:	72 00       	.word	0x0072;	????	
 1e4:	07 00       	.word	0x0007;	????	
 1e6:	93 02       	.word	0x0293;	????	
 1e8:	5c 93       	cmp.b	#1,	r12	;r3 As==01
 1ea:	01 93       	tst	r1		
 1ec:	01 4c       	mov	r12,	r1	
 1ee:	01 5e       	add	r14,	r1	
 1f0:	01 05       	.word	0x0501;	????	
 1f2:	00 93       	tst	r0		
 1f4:	03 54       	.word	0x5403;	????	Illegal as 2-op instr
 1f6:	93 01       	.word	0x0193;	????	
 1f8:	00 00       	.word	0x0000;	????	
 1fa:	00 00       	.word	0x0000;	????	
 1fc:	2a 00       	.word	0x002a;	????	
 1fe:	86 01       	.word	0x0186;	????	
 200:	01 00       	.word	0x0001;	????	
 202:	51 86 01 98 	sub.b	-26623(r6),r1	;0x9801(r6)
 206:	01 03       	.word	0x0301;	????	
 208:	00 91       	cmp	r1,	r0	
 20a:	66 9f       	cmp.b	@r15,	r6	
 20c:	00 00       	.word	0x0000;	????	
 20e:	00 00       	.word	0x0000;	????	
 210:	2a 00       	.word	0x002a;	????	
 212:	38 00       	.word	0x0038;	????	
 214:	01 00       	.word	0x0001;	????	
 216:	51 38       	jl	$+164    	;abs 0x2ba
 218:	00 4e       	br	r14		
 21a:	00 03       	.word	0x0300;	????	
 21c:	00 91       	cmp	r1,	r0	
 21e:	67 9f       	cmp.b	@r15,	r7	
 220:	4e 00       	.word	0x004e;	????	
 222:	54 00       	.word	0x0054;	????	
 224:	03 00       	.word	0x0003;	????	
 226:	91 68 9f 54 	addc	21663(r8),24576(r1);0x549f(r8), 0x6000(r1)
 22a:	00 60 
 22c:	00 01       	.word	0x0100;	????	
 22e:	00 51       	add	r1,	r0	
 230:	60 00       	.word	0x0060;	????	
 232:	62 00       	.word	0x0062;	????	
 234:	03 00       	.word	0x0003;	????	
 236:	91 67 9f 62 	addc	25247(r7),27136(r1);0x629f(r7), 0x6a00(r1)
 23a:	00 6a 
 23c:	00 01       	.word	0x0100;	????	
 23e:	00 51       	add	r1,	r0	
 240:	6a 00       	.word	0x006a;	????	
 242:	70 00       	.word	0x0070;	????	
 244:	03 00       	.word	0x0003;	????	
 246:	91 67 9f 70 	addc	28831(r7),29184(r1);0x709f(r7), 0x7200(r1)
 24a:	00 72 
 24c:	00 01       	.word	0x0100;	????	
 24e:	00 51       	add	r1,	r0	
 250:	72 00       	.word	0x0072;	????	
 252:	76 00       	.word	0x0076;	????	
 254:	01 00       	.word	0x0001;	????	
 256:	5c 76 00 90 	subc.b	-28672(r6),r12	;0x9000(r6)
 25a:	00 01       	.word	0x0100;	????	
 25c:	00 5a       	add	r10,	r0	
 25e:	00 00       	.word	0x0000;	????	
 260:	00 00       	.word	0x0000;	????	
 262:	aa 00       	.word	0x00aa;	????	
 264:	0e 01       	.word	0x010e;	????	
 266:	03 00       	.word	0x0003;	????	
 268:	08 20       	jnz	$+18     	;abs 0x27a
 26a:	9f 0e       	.word	0x0e9f;	????	
 26c:	01 22       	jnz	$-1020   	;abs 0xfe70
 26e:	01 02       	.word	0x0201;	????	
 270:	00 91       	cmp	r1,	r0	
 272:	6c 00       	.word	0x006c;	????	
 274:	00 00       	.word	0x0000;	????	
 276:	00 bc       	bit	r12,	r0	
 278:	00 de       	bis	r14,	r0	
 27a:	00 01       	.word	0x0100;	????	
 27c:	00 5d       	add	r13,	r0	
 27e:	de 00       	.word	0x00de;	????	
 280:	0c 01       	.word	0x010c;	????	
 282:	01 00       	.word	0x0001;	????	
 284:	55 00       	.word	0x0055;	????	
 286:	00 00       	.word	0x0000;	????	
 288:	00 98       	cmp	r8,	r0	
 28a:	01 9a       	cmp	r10,	r1	
 28c:	01 02       	.word	0x0201;	????	
 28e:	00 71       	subc	r1,	r0	
 290:	02 9a       	cmp	r10,	r2	
 292:	01 9c       	cmp	r12,	r1	
 294:	01 02       	.word	0x0201;	????	
 296:	00 71       	subc	r1,	r0	
 298:	04 9c       	cmp	r12,	r4	
 29a:	01 9e       	cmp	r14,	r1	
 29c:	01 02       	.word	0x0201;	????	
 29e:	00 71       	subc	r1,	r0	
 2a0:	06 9e       	cmp	r14,	r6	
 2a2:	01 a0       	dadd	r0,	r1	
 2a4:	01 02       	.word	0x0201;	????	
 2a6:	00 71       	subc	r1,	r0	
 2a8:	08 a0       	dadd	r0,	r8	
 2aa:	01 a2       	dadd	r2,	r1	
 2ac:	01 02       	.word	0x0201;	????	
 2ae:	00 71       	subc	r1,	r0	
 2b0:	0a a2       	dadd	r2,	r10	
 2b2:	01 a4       	dadd	r4,	r1	
 2b4:	01 02       	.word	0x0201;	????	
 2b6:	00 71       	subc	r1,	r0	
 2b8:	0c a4       	dadd	r4,	r12	
 2ba:	01 a6       	dadd	r6,	r1	
 2bc:	01 02       	.word	0x0201;	????	
 2be:	00 71       	subc	r1,	r0	
 2c0:	0e a6       	dadd	r6,	r14	
 2c2:	01 a8       	dadd	r8,	r1	
 2c4:	01 02       	.word	0x0201;	????	
 2c6:	00 71       	subc	r1,	r0	
 2c8:	10 a8 01 ac 	dadd	-21503(r8),r0	;0xac01(r8)
 2cc:	01 02       	.word	0x0201;	????	
 2ce:	00 71       	subc	r1,	r0	
 2d0:	12 ac 01 12 	dadd	4609(r12),r2	;0x1201(r12)
 2d4:	04 03       	.word	0x0304;	????	
 2d6:	00 71       	subc	r1,	r0	
 2d8:	dc 00       	.word	0x00dc;	????	
 2da:	12 04       	.word	0x0412;	????	
 2dc:	20 04       	.word	0x0420;	????	
 2de:	03 00       	.word	0x0003;	????	
 2e0:	71 e0 00 20 	xor.b	#8192,	r1	;#0x2000
 2e4:	04 de       	bis	r14,	r4	
 2e6:	05 03       	.word	0x0305;	????	
 2e8:	00 71       	subc	r1,	r0	
 2ea:	dc 00       	.word	0x00dc;	????	
 2ec:	de 05       	.word	0x05de;	????	
 2ee:	ee 05       	.word	0x05ee;	????	
 2f0:	03 00       	.word	0x0003;	????	
 2f2:	71 e4       	xor.b	@r4+,	r1	
 2f4:	00 ee       	xor	r14,	r0	
 2f6:	05 2c       	jc	$+12     	;abs 0x302
 2f8:	06 03       	.word	0x0306;	????	
 2fa:	00 71       	subc	r1,	r0	
 2fc:	dc 00       	.word	0x00dc;	????	
 2fe:	2c 06       	.word	0x062c;	????	
 300:	3c 06       	.word	0x063c;	????	
 302:	03 00       	.word	0x0003;	????	
 304:	71 e4       	xor.b	@r4+,	r1	
 306:	00 3c       	jmp	$+2      	;abs 0x308
 308:	06 bc       	bit	r12,	r6	
 30a:	07 03       	.word	0x0307;	????	
 30c:	00 71       	subc	r1,	r0	
 30e:	dc 00       	.word	0x00dc;	????	
 310:	bc 07       	.word	0x07bc;	????	
 312:	ce 07       	.word	0x07ce;	????	
 314:	03 00       	.word	0x0003;	????	
 316:	71 e0 00 ce 	xor.b	#-12800,r1	;#0xce00
 31a:	07 36       	jge	$-1008   	;abs 0xff2a
 31c:	08 03       	.word	0x0308;	????	
 31e:	00 71       	subc	r1,	r0	
 320:	dc 00       	.word	0x00dc;	????	
 322:	00 00       	.word	0x0000;	????	
 324:	00 00       	.word	0x0000;	????	
 326:	98 01       	.word	0x0198;	????	
 328:	e4 01       	.word	0x01e4;	????	
 32a:	01 00       	.word	0x0001;	????	
 32c:	5f e4 01 36 	xor.b	13825(r4),r15	;0x3601(r4)
 330:	08 02       	.word	0x0208;	????	
 332:	00 91       	cmp	r1,	r0	
 334:	5e 00       	.word	0x005e;	????	
 336:	00 00       	.word	0x0000;	????	
 338:	00 98       	cmp	r8,	r0	
 33a:	01 d8       	bis	r8,	r1	
 33c:	01 01       	.word	0x0101;	????	
 33e:	00 5e       	add	r14,	r0	
 340:	e4 01       	.word	0x01e4;	????	
 342:	84 04       	.word	0x0484;	????	
 344:	03 00       	.word	0x0003;	????	
 346:	76 01       	.word	0x0176;	????	
 348:	9f 84 04 12 	sub	4612(r4),520(r15);0x1204(r4), 0x0208(r15)
 34c:	08 02 
 34e:	00 91       	cmp	r1,	r0	
 350:	64 12       	push.b	@r4		
 352:	08 14       	.word	0x1408;	????	
 354:	08 01       	.word	0x0108;	????	
 356:	00 56       	add	r6,	r0	
 358:	14 08       	.word	0x0814;	????	
 35a:	2a 08       	.word	0x082a;	????	
 35c:	03 00       	.word	0x0003;	????	
 35e:	76 01       	.word	0x0176;	????	
 360:	9f 00       	.word	0x009f;	????	
 362:	00 00       	.word	0x0000;	????	
 364:	00 98       	cmp	r8,	r0	
 366:	01 e4       	xor	r4,	r1	
 368:	01 01       	.word	0x0101;	????	
 36a:	00 5d       	add	r13,	r0	
 36c:	e4 01       	.word	0x01e4;	????	
 36e:	1a 02       	.word	0x021a;	????	
 370:	01 00       	.word	0x0001;	????	
 372:	55 1a       	.word	0x1a55;	????	
 374:	02 1c       	.word	0x1c02;	????	
 376:	02 01       	.word	0x0102;	????	
 378:	00 57       	add	r7,	r0	
 37a:	1c 02       	.word	0x021c;	????	
 37c:	3c 03       	.word	0x033c;	????	
 37e:	01 00       	.word	0x0001;	????	
 380:	55 3c       	jmp	$+172    	;abs 0x42c
 382:	03 66       	.word	0x6603;	????	Illegal as 2-op instr
 384:	03 01       	.word	0x0103;	????	
 386:	00 5e       	add	r14,	r0	
 388:	66 03       	.word	0x0366;	????	
 38a:	c0 03       	.word	0x03c0;	????	
 38c:	01 00       	.word	0x0001;	????	
 38e:	55 c0 03 dc 	bic.b	-9213(r0),r5	;PC rel. 0xdf93
 392:	03 01       	.word	0x0103;	????	
 394:	00 57       	add	r7,	r0	
 396:	dc 03       	.word	0x03dc;	????	
 398:	e0 03       	.word	0x03e0;	????	
 39a:	01 00       	.word	0x0001;	????	
 39c:	55 e0 03 2a 	xor.b	10755(r0),r5	;PC rel. 0x2da1
 3a0:	04 01       	.word	0x0104;	????	
 3a2:	00 57       	add	r7,	r0	
 3a4:	2a 04       	.word	0x042a;	????	
 3a6:	2e 04       	.word	0x042e;	????	
 3a8:	01 00       	.word	0x0001;	????	
 3aa:	55 2e       	jc	$-852    	;abs 0x56
 3ac:	04 58       	add	r8,	r4	
 3ae:	04 01       	.word	0x0104;	????	
 3b0:	00 57       	add	r7,	r0	
 3b2:	58 04       	.word	0x0458;	????	
 3b4:	7a 04       	.word	0x047a;	????	
 3b6:	01 00       	.word	0x0001;	????	
 3b8:	55 7a 04 be 	subc.b	-16892(r10),r5	;0xbe04(r10)
 3bc:	04 01       	.word	0x0104;	????	
 3be:	00 5c       	add	r12,	r0	
 3c0:	be 04       	.word	0x04be;	????	
 3c2:	c6 04       	.word	0x04c6;	????	
 3c4:	01 00       	.word	0x0001;	????	
 3c6:	55 c6 04 de 	bic.b	-8700(r6),r5	;0xde04(r6)
 3ca:	04 01       	.word	0x0104;	????	
 3cc:	00 57       	add	r7,	r0	
 3ce:	de 04       	.word	0x04de;	????	
 3d0:	e0 04       	.word	0x04e0;	????	
 3d2:	01 00       	.word	0x0001;	????	
 3d4:	55 e0 04 fe 	xor.b	-508(r0),r5	;PC rel. 0x01da
 3d8:	04 01       	.word	0x0104;	????	
 3da:	00 57       	add	r7,	r0	
 3dc:	fe 04       	.word	0x04fe;	????	
 3de:	02 08       	.word	0x0802;	????	
 3e0:	01 00       	.word	0x0001;	????	
 3e2:	55 02       	.word	0x0255;	????	
 3e4:	08 08       	.word	0x0808;	????	
 3e6:	08 01       	.word	0x0108;	????	
 3e8:	00 5e       	add	r14,	r0	
 3ea:	08 08       	.word	0x0808;	????	
 3ec:	28 08       	.word	0x0828;	????	
 3ee:	01 00       	.word	0x0001;	????	
 3f0:	55 00       	.word	0x0055;	????	
 3f2:	00 00       	.word	0x0000;	????	
 3f4:	00 b4       	bit	r4,	r0	
 3f6:	01 e4       	xor	r4,	r1	
 3f8:	01 02       	.word	0x0201;	????	
 3fa:	00 30       	jn	$+2      	;abs 0x3fc
 3fc:	9f e4 01 d4 	xor	-11263(r4),519(r15);0xd401(r4), 0x0207(r15)
 400:	07 02 
 402:	00 91       	cmp	r1,	r0	
 404:	50 d4 07 db 	bis.b	-9465(r4),r0	;0xdb07(r4)
 408:	07 01       	.word	0x0107;	????	
 40a:	00 5e       	add	r14,	r0	
 40c:	e0 07       	.word	0x07e0;	????	
 40e:	ee 07       	.word	0x07ee;	????	
 410:	01 00       	.word	0x0001;	????	
 412:	5e ee 07 36 	xor.b	13831(r14),r14	;0x3607(r14)
 416:	08 02       	.word	0x0208;	????	
 418:	00 91       	cmp	r1,	r0	
 41a:	50 00       	.word	0x0050;	????	
 41c:	00 00       	.word	0x0000;	????	
 41e:	00 b4       	bit	r4,	r0	
 420:	01 e4       	xor	r4,	r1	
 422:	01 02       	.word	0x0201;	????	
 424:	00 30       	jn	$+2      	;abs 0x426
 426:	9f e4 01 fe 	xor	-511(r4),257(r15);0xfe01(r4), 0x0101(r15)
 42a:	01 01 
 42c:	00 57       	add	r7,	r0	
 42e:	fe 01       	.word	0x01fe;	????	
 430:	1a 02       	.word	0x021a;	????	
 432:	02 00       	.word	0x0002;	????	
 434:	31 9f       	cmp	@r15+,	r1	
 436:	28 02       	.word	0x0228;	????	
 438:	2c 02       	.word	0x022c;	????	
 43a:	02 00       	.word	0x0002;	????	
 43c:	30 9f       	cmp	@r15+,	r0	
 43e:	2c 02       	.word	0x022c;	????	
 440:	be 03       	.word	0x03be;	????	
 442:	01 00       	.word	0x0001;	????	
 444:	57 dc 03 de 	bis.b	-8701(r12),r7	;0xde03(r12)
 448:	03 01       	.word	0x0103;	????	
 44a:	00 57       	add	r7,	r0	
 44c:	24 04       	.word	0x0424;	????	
 44e:	2a 04       	.word	0x042a;	????	
 450:	02 00       	.word	0x0002;	????	
 452:	30 9f       	cmp	@r15+,	r0	
 454:	2a 04       	.word	0x042a;	????	
 456:	2c 04       	.word	0x042c;	????	
 458:	01 00       	.word	0x0001;	????	
 45a:	57 58 04 80 	add.b	-32764(r8),r7	;0x8004(r8)
 45e:	04 01       	.word	0x0104;	????	
 460:	00 57       	add	r7,	r0	
 462:	be 04       	.word	0x04be;	????	
 464:	c2 04       	.word	0x04c2;	????	
 466:	01 00       	.word	0x0001;	????	
 468:	57 d2 07 d4 	bis.b	&0xd407,r7	
 46c:	07 02       	.word	0x0207;	????	
 46e:	00 30       	jn	$+2      	;abs 0x470
 470:	9f d4 07 ee 	bis	-4601(r4),263(r15);0xee07(r4), 0x0107(r15)
 474:	07 01 
 476:	00 57       	add	r7,	r0	
 478:	f2 07       	.word	0x07f2;	????	
 47a:	08 08       	.word	0x0808;	????	
 47c:	01 00       	.word	0x0001;	????	
 47e:	57 12 08 2c 	push.b	11272(r7)	;0x2c08(r7)
 482:	08 01       	.word	0x0108;	????	
 484:	00 57       	add	r7,	r0	
 486:	00 00       	.word	0x0000;	????	
 488:	00 00       	.word	0x0000;	????	
 48a:	b4 01       	.word	0x01b4;	????	
 48c:	e4 01       	.word	0x01e4;	????	
 48e:	02 00       	.word	0x0002;	????	
 490:	30 9f       	cmp	@r15+,	r0	
 492:	e4 01       	.word	0x01e4;	????	
 494:	f6 01       	.word	0x01f6;	????	
 496:	02 00       	.word	0x0002;	????	
 498:	91 4a f6 01 	mov	502(r10),538(r1)	;0x01f6(r10), 0x021a(r1)
 49c:	1a 02 
 49e:	02 00       	.word	0x0002;	????	
 4a0:	30 9f       	cmp	@r15+,	r0	
 4a2:	1a 02       	.word	0x021a;	????	
 4a4:	46 03       	.word	0x0346;	????	
 4a6:	02 00       	.word	0x0002;	????	
 4a8:	91 4a 46 03 	mov	838(r10),840(r1)	;0x0346(r10), 0x0348(r1)
 4ac:	48 03 
 4ae:	02 00       	.word	0x0002;	????	
 4b0:	75 00       	.word	0x0075;	????	
 4b2:	48 03       	.word	0x0348;	????	
 4b4:	96 03       	.word	0x0396;	????	
 4b6:	02 00       	.word	0x0002;	????	
 4b8:	91 4a 96 03 	mov	918(r10),948(r1)	;0x0396(r10), 0x03b4(r1)
 4bc:	b4 03 
 4be:	06 00       	.word	0x0006;	????	
 4c0:	91 4a 06 3a 	mov	14854(r10),-24802(r1);0x3a06(r10), 0x9f1e(r1)
 4c4:	1e 9f 
 4c6:	b4 03       	.word	0x03b4;	????	
 4c8:	08 08       	.word	0x0808;	????	
 4ca:	02 00       	.word	0x0002;	????	
 4cc:	91 4a 12 08 	mov	2066(r10),2102(r1);0x0812(r10), 0x0836(r1)
 4d0:	36 08 
 4d2:	02 00       	.word	0x0002;	????	
 4d4:	91 4a 00 00 	mov	0(r10),	0(r1)	;0x0000(r10), 0x0000(r1)
 4d8:	00 00 
 4da:	b4 01       	.word	0x01b4;	????	
 4dc:	e4 01       	.word	0x01e4;	????	
 4de:	02 00       	.word	0x0002;	????	
 4e0:	30 9f       	cmp	@r15+,	r0	
 4e2:	e4 01       	.word	0x01e4;	????	
 4e4:	f6 01       	.word	0x01f6;	????	
 4e6:	02 00       	.word	0x0002;	????	
 4e8:	91 54 f6 01 	add	502(r4),538(r1)	;0x01f6(r4), 0x021a(r1)
 4ec:	1a 02 
 4ee:	02 00       	.word	0x0002;	????	
 4f0:	30 9f       	cmp	@r15+,	r0	
 4f2:	1a 02       	.word	0x021a;	????	
 4f4:	08 08       	.word	0x0808;	????	
 4f6:	02 00       	.word	0x0002;	????	
 4f8:	91 54 12 08 	add	2066(r4),2102(r1);0x0812(r4), 0x0836(r1)
 4fc:	36 08 
 4fe:	02 00       	.word	0x0002;	????	
 500:	91 54 00 00 	add	0(r4),	0(r1)	;0x0000(r4), 0x0000(r1)
 504:	00 00 
 506:	b4 01       	.word	0x01b4;	????	
 508:	d8 01       	.word	0x01d8;	????	
 50a:	01 00       	.word	0x0001;	????	
 50c:	5e d8 01 e4 	bis.b	-7167(r8),r14	;0xe401(r8)
 510:	01 01       	.word	0x0101;	????	
 512:	00 56       	add	r6,	r0	
 514:	e4 01       	.word	0x01e4;	????	
 516:	fe 01       	.word	0x01fe;	????	
 518:	02 00       	.word	0x0002;	????	
 51a:	91 62 fe 01 	addc	&0x01fe,538(r1)	;0x021a(r1)
 51e:	1a 02 
 520:	01 00       	.word	0x0001;	????	
 522:	56 1a       	.word	0x1a56;	????	
 524:	02 d4       	bis	r4,	r2	
 526:	07 02       	.word	0x0207;	????	
 528:	00 91       	cmp	r1,	r0	
 52a:	62 d4       	bis.b	@r4,	r2	
 52c:	07 d6       	bis	r6,	r7	
 52e:	07 01       	.word	0x0107;	????	
 530:	00 59       	add	r9,	r0	
 532:	d6 07       	.word	0x07d6;	????	
 534:	d8 07       	.word	0x07d8;	????	
 536:	03 00       	.word	0x0003;	????	
 538:	79 7f       	subc.b	@r15+,	r9	
 53a:	9f d8 07 dc 	bis	-9209(r8),263(r15);0xdc07(r8), 0x0107(r15)
 53e:	07 01 
 540:	00 59       	add	r9,	r0	
 542:	e0 07       	.word	0x07e0;	????	
 544:	ee 07       	.word	0x07ee;	????	
 546:	01 00       	.word	0x0001;	????	
 548:	59 ee 07 36 	xor.b	13831(r14),r9	;0x3607(r14)
 54c:	08 02       	.word	0x0208;	????	
 54e:	00 91       	cmp	r1,	r0	
 550:	62 00       	.word	0x0062;	????	
 552:	00 00       	.word	0x0000;	????	
 554:	00 ce       	bic	r14,	r0	
 556:	03 dc       	.word	0xdc03;	????	Illegal as 2-op instr
 558:	03 04       	.word	0x0403;	????	
 55a:	00 91       	cmp	r1,	r0	
 55c:	a8 7f 9f e2 	subc	@r15,	-7521(r8);0xe29f(r8)
 560:	03 0a       	.word	0x0a03;	????	
 562:	04 01       	.word	0x0104;	????	
 564:	00 5e       	add	r14,	r0	
 566:	8e 05       	.word	0x058e;	????	
 568:	92 05       	.word	0x0592;	????	
 56a:	04 00       	.word	0x0004;	????	
 56c:	91 bf 7f 9f 	bit	-24705(r15),1426(r1);0x9f7f(r15), 0x0592(r1)
 570:	92 05 
 572:	b0 05       	.word	0x05b0;	????	
 574:	04 00       	.word	0x0004;	????	
 576:	91 be 7f 9f 	bit	-24705(r14),1564(r1);0x9f7f(r14), 0x061c(r1)
 57a:	1c 06 
 57c:	6a 06       	.word	0x066a;	????	
 57e:	01 00       	.word	0x0001;	????	
 580:	56 6a 06 7c 	addc.b	31750(r10),r6	;0x7c06(r10)
 584:	06 04       	.word	0x0406;	????	
 586:	00 91       	cmp	r1,	r0	
 588:	be 7f 9f c4 	subc	@r15+,	-15201(r14);0xc49f(r14)
 58c:	06 ea       	xor	r10,	r6	
 58e:	06 01       	.word	0x0106;	????	
 590:	00 56       	add	r6,	r0	
 592:	ea 06       	.word	0x06ea;	????	
 594:	f4 06       	.word	0x06f4;	????	
 596:	04 00       	.word	0x0004;	????	
 598:	91 be 7f 9f 	bit	-24705(r14),1836(r1);0x9f7f(r14), 0x072c(r1)
 59c:	2c 07 
 59e:	d4 07       	.word	0x07d4;	????	
 5a0:	01 00       	.word	0x0001;	????	
 5a2:	56 00       	.word	0x0056;	????	
 5a4:	00 00       	.word	0x0000;	????	
 5a6:	00 e4       	xor	r4,	r0	
 5a8:	01 1e       	.word	0x1e01;	????	
 5aa:	02 01       	.word	0x0102;	????	
 5ac:	00 5e       	add	r14,	r0	
 5ae:	2c 02       	.word	0x022c;	????	
 5b0:	e8 02       	.word	0x02e8;	????	
 5b2:	01 00       	.word	0x0001;	????	
 5b4:	5e e8 02 c2 	xor.b	-15870(r8),r14	;0xc202(r8)
 5b8:	03 02       	.word	0x0203;	????	
 5ba:	00 76       	subc	r6,	r0	
 5bc:	00 c2       	bic	r2,	r0	
 5be:	03 dc       	.word	0xdc03;	????	Illegal as 2-op instr
 5c0:	03 02       	.word	0x0203;	????	
 5c2:	00 75       	subc	r5,	r0	
 5c4:	00 dc       	bis	r12,	r0	
 5c6:	03 e2       	.word	0xe203;	????	Illegal as 2-op instr
 5c8:	03 02       	.word	0x0203;	????	
 5ca:	00 76       	subc	r6,	r0	
 5cc:	00 2a       	jnc	$-1022   	;abs 0x1ce
 5ce:	04 36       	jge	$-1014   	;abs 0x1d8
 5d0:	04 01       	.word	0x0104;	????	
 5d2:	00 5e       	add	r14,	r0	
 5d4:	36 04       	.word	0x0436;	????	
 5d6:	84 04       	.word	0x0484;	????	
 5d8:	02 00       	.word	0x0002;	????	
 5da:	76 00       	.word	0x0076;	????	
 5dc:	84 04       	.word	0x0484;	????	
 5de:	b0 05       	.word	0x05b0;	????	
 5e0:	05 00       	.word	0x0005;	????	
 5e2:	91 64 06 31 	addc	12550(r4),27164(r1);0x3106(r4), 0x6a1c(r1)
 5e6:	1c 6a 
 5e8:	06 7c       	subc	r12,	r6	
 5ea:	06 05       	.word	0x0506;	????	
 5ec:	00 91       	cmp	r1,	r0	
 5ee:	64 06       	.word	0x0664;	????	
 5f0:	31 1c       	.word	0x1c31;	????	
 5f2:	ea 06       	.word	0x06ea;	????	
 5f4:	f4 06       	.word	0x06f4;	????	
 5f6:	05 00       	.word	0x0005;	????	
 5f8:	91 64 06 31 	addc	12550(r4),-3556(r1);0x3106(r4), 0xf21c(r1)
 5fc:	1c f2 
 5fe:	07 02       	.word	0x0207;	????	
 600:	08 01       	.word	0x0108;	????	
 602:	00 5e       	add	r14,	r0	
 604:	02 08       	.word	0x0802;	????	
 606:	0e 08       	.word	0x080e;	????	
 608:	05 00       	.word	0x0005;	????	
 60a:	91 64 06 31 	addc	12550(r4),5148(r1);0x3106(r4), 0x141c(r1)
 60e:	1c 14 
 610:	08 2a       	jnc	$-1006   	;abs 0x222
 612:	08 02       	.word	0x0208;	????	
 614:	00 76       	subc	r6,	r0	
 616:	00 2a       	jnc	$-1022   	;abs 0x218
 618:	08 36       	jge	$-1006   	;abs 0x22a
 61a:	08 01       	.word	0x0108;	????	
 61c:	00 5e       	add	r14,	r0	
 61e:	00 00       	.word	0x0000;	????	
 620:	00 00       	.word	0x0000;	????	
 622:	34 04       	.word	0x0434;	????	
 624:	58 04       	.word	0x0458;	????	
 626:	02 00       	.word	0x0002;	????	
 628:	40 9f       	cmp.b	r15,	r0	
 62a:	70 04       	.word	0x0470;	????	
 62c:	d4 07       	.word	0x07d4;	????	
 62e:	02 00       	.word	0x0002;	????	
 630:	91 4c 00 00 	mov	0(r12),	0(r1)	;0x0000(r12), 0x0000(r1)
 634:	00 00 
 636:	b4 01       	.word	0x01b4;	????	
 638:	e4 01       	.word	0x01e4;	????	
 63a:	02 00       	.word	0x0002;	????	
 63c:	30 9f       	cmp	@r15+,	r0	
 63e:	e4 01       	.word	0x01e4;	????	
 640:	fe 01       	.word	0x01fe;	????	
 642:	02 00       	.word	0x0002;	????	
 644:	91 4e fe 01 	mov	510(r14),538(r1)	;0x01fe(r14), 0x021a(r1)
 648:	1a 02 
 64a:	02 00       	.word	0x0002;	????	
 64c:	30 9f       	cmp	@r15+,	r0	
 64e:	1a 02       	.word	0x021a;	????	
 650:	b4 03       	.word	0x03b4;	????	
 652:	02 00       	.word	0x0002;	????	
 654:	91 4e b4 03 	mov	948(r14),956(r1)	;0x03b4(r14), 0x03bc(r1)
 658:	bc 03 
 65a:	02 00       	.word	0x0002;	????	
 65c:	31 9f       	cmp	@r15+,	r1	
 65e:	bc 03       	.word	0x03bc;	????	
 660:	08 08       	.word	0x0808;	????	
 662:	02 00       	.word	0x0002;	????	
 664:	91 4e 12 08 	mov	2066(r14),2102(r1);0x0812(r14), 0x0836(r1)
 668:	36 08 
 66a:	02 00       	.word	0x0002;	????	
 66c:	91 4e 00 00 	mov	0(r14),	0(r1)	;0x0000(r14), 0x0000(r1)
 670:	00 00 
 672:	b4 01       	.word	0x01b4;	????	
 674:	e4 01       	.word	0x01e4;	????	
 676:	02 00       	.word	0x0002;	????	
 678:	30 9f       	cmp	@r15+,	r0	
 67a:	e4 01       	.word	0x01e4;	????	
 67c:	fe 01       	.word	0x01fe;	????	
 67e:	02 00       	.word	0x0002;	????	
 680:	91 52 fe 01 	add	&0x01fe,538(r1)	;0x021a(r1)
 684:	1a 02 
 686:	02 00       	.word	0x0002;	????	
 688:	30 9f       	cmp	@r15+,	r0	
 68a:	1a 02       	.word	0x021a;	????	
 68c:	08 08       	.word	0x0808;	????	
 68e:	02 00       	.word	0x0002;	????	
 690:	91 52 12 08 	add	&0x0812,2102(r1);0x0836(r1)
 694:	36 08 
 696:	02 00       	.word	0x0002;	????	
 698:	91 52 00 00 	add	&0x0000,0(r1)	;0x0000(r1)
 69c:	00 00 
 69e:	b4 01       	.word	0x01b4;	????	
 6a0:	e4 01       	.word	0x01e4;	????	
 6a2:	02 00       	.word	0x0002;	????	
 6a4:	30 9f       	cmp	@r15+,	r0	
 6a6:	e4 01       	.word	0x01e4;	????	
 6a8:	fe 01       	.word	0x01fe;	????	
 6aa:	02 00       	.word	0x0002;	????	
 6ac:	91 4f fe 01 	mov	510(r15),538(r1)	;0x01fe(r15), 0x021a(r1)
 6b0:	1a 02 
 6b2:	02 00       	.word	0x0002;	????	
 6b4:	30 9f       	cmp	@r15+,	r0	
 6b6:	1a 02       	.word	0x021a;	????	
 6b8:	08 08       	.word	0x0808;	????	
 6ba:	02 00       	.word	0x0002;	????	
 6bc:	91 4f 12 08 	mov	2066(r15),2102(r1);0x0812(r15), 0x0836(r1)
 6c0:	36 08 
 6c2:	02 00       	.word	0x0002;	????	
 6c4:	91 4f 00 00 	mov	0(r15),	0(r1)	;0x0000(r15), 0x0000(r1)
 6c8:	00 00 
 6ca:	b4 01       	.word	0x01b4;	????	
 6cc:	e4 01       	.word	0x01e4;	????	
 6ce:	02 00       	.word	0x0002;	????	
 6d0:	30 9f       	cmp	@r15+,	r0	
 6d2:	e4 01       	.word	0x01e4;	????	
 6d4:	fe 01       	.word	0x01fe;	????	
 6d6:	02 00       	.word	0x0002;	????	
 6d8:	91 53 fe 01 	inc	510(r1)	;0x01fe(r1)
 6dc:	1a 02       	.word	0x021a;	????	
 6de:	02 00       	.word	0x0002;	????	
 6e0:	30 9f       	cmp	@r15+,	r0	
 6e2:	1a 02       	.word	0x021a;	????	
 6e4:	08 08       	.word	0x0808;	????	
 6e6:	02 00       	.word	0x0002;	????	
 6e8:	91 53 12 08 	inc	2066(r1)	;0x0812(r1)
 6ec:	36 08       	.word	0x0836;	????	
 6ee:	02 00       	.word	0x0002;	????	
 6f0:	91 53 00 00 	inc	0(r1)		;0x0000(r1)
 6f4:	00 00       	.word	0x0000;	????	
 6f6:	92 07       	.word	0x0792;	????	
 6f8:	a8 07       	.word	0x07a8;	????	
 6fa:	01 00       	.word	0x0001;	????	
 6fc:	5c 00       	.word	0x005c;	????	
 6fe:	00 00       	.word	0x0000;	????	
 700:	00 3e       	jmp	$-1022   	;abs 0x302
 702:	03 64       	.word	0x6403;	????	Illegal as 2-op instr
 704:	03 02       	.word	0x0203;	????	
 706:	00 75       	subc	r5,	r0	
 708:	00 64       	addc	r4,	r0	
 70a:	03 66       	.word	0x6603;	????	Illegal as 2-op instr
 70c:	03 02       	.word	0x0203;	????	
 70e:	00 7e       	subc	r14,	r0	
 710:	7e 02       	.word	0x027e;	????	
 712:	08 08       	.word	0x0808;	????	
 714:	08 01       	.word	0x0108;	????	
 716:	00 5a       	add	r10,	r0	
 718:	00 00       	.word	0x0000;	????	
 71a:	00 00       	.word	0x0000;	????	
 71c:	f0 05       	.word	0x05f0;	????	
 71e:	2e 06       	.word	0x062e;	????	
 720:	01 00       	.word	0x0001;	????	
 722:	5c 00       	.word	0x005c;	????	
 724:	00 00       	.word	0x0000;	????	
 726:	00 98       	cmp	r8,	r0	
 728:	06 cc       	bic	r12,	r6	
 72a:	06 01       	.word	0x0106;	????	
 72c:	00 5e       	add	r14,	r0	
 72e:	00 00       	.word	0x0000;	????	
 730:	00 00       	.word	0x0000;	????	
 732:	00 07       	.word	0x0700;	????	
 734:	32 07       	.word	0x0732;	????	
 736:	01 00       	.word	0x0001;	????	
 738:	5f 00       	.word	0x005f;	????	
 73a:	00 00       	.word	0x0000;	????	
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	d6 01       	.word	0x01d6;	????	
   2:	e0 01       	.word	0x01e0;	????	
   4:	54 07       	.word	0x0754;	????	
   6:	a8 07       	.word	0x07a8;	????	
   8:	00 00       	.word	0x0000;	????	
   a:	00 00       	.word	0x0000;	????	
   c:	38 03       	.word	0x0338;	????	
   e:	66 03       	.word	0x0366;	????	
  10:	02 08       	.word	0x0802;	????	
  12:	0e 08       	.word	0x080e;	????	
  14:	00 00       	.word	0x0000;	????	
	...
