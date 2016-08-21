/*
 * MSP430Cpu.h
 *
 *  Created on: Jul 26, 2016
 *      Author: andy
 */

#ifndef MSP430CPU_H_
#define MSP430CPU_H_

#include <cstdint>
#include <memory>
#include <unordered_map>

using namespace std;

class MSP430Cpu;

#pragma packed(0)

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
	uint8_t C		: 1;
	uint8_t Z		: 1;
	uint8_t N		: 1;
	uint8_t GIE		: 1;
	uint8_t CPU_OFF	: 1;
	uint8_t OSC_OFF	: 1;
	uint8_t SCG0	: 1;
	uint8_t SCG1	: 1;
	uint8_t V		: 1;
	uint8_t reserved: 7;
#else
	uint8_t reserved: 7;
	uint8_t V		: 1;
	uint8_t SCG1	: 1;
	uint8_t SCG0	: 1;
	uint8_t OSC_OFF	: 1;
	uint8_t CPU_OFF	: 1;
	uint8_t GIE		: 1;
	uint8_t N		: 1;
	uint8_t Z		: 1;
	uint8_t C		: 1;
#endif
} StatusRegister;

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
	uint8_t d_reg  : 4;
	uint8_t As     : 2;
	uint8_t b_w    : 1;
	uint8_t Ad	   : 1;
	uint8_t s_reg  : 4;
	uint8_t opcode : 4;
#else
	uint8_t opcode : 4;
	uint8_t s_reg  : 4;
	uint8_t Ad	   : 1;
	uint8_t b_w    : 1;
	uint8_t As     : 2;
	uint8_t d_reg  : 4;
#endif
} DoubleOperandInstruction;
typedef void (MSP430Cpu::*DoubleOperandFunc)(DoubleOperandInstruction);

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
	uint8_t  s_d_reg: 4;
	uint8_t  Ad     : 2;
	uint8_t  b_w	: 1;
	uint16_t opcode : 9;
#else
	uint16_t opcode : 9;
	uint8_t b_w		: 1;
	uint8_t Ad      : 2;
	uint8_t s_d_reg : 4;
#endif
} SingleOperandInstruction;
typedef void (MSP430Cpu::*SingleOperandFunc)(SingleOperandInstruction);

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
	uint16_t offset : 10;
	uint8_t  opcode : 6;
#else
	uint8_t  opcode : 6;
	uint16_t offset : 10;
#endif
} JumpsInstruction;
typedef void (MSP430Cpu::*JumpsFunc)(JumpsInstruction);

#pragma packed()

class MSP430Cpu {
public:
	MSP430Cpu();
	virtual ~MSP430Cpu() = default;

	void loadBinRom(const char* const rom_data, long data_size);

	void run(void);

	uint16_t loadNextInstruction();

	void translateCode(uint16_t code);

	void printRegister(void);

	void setStepRun(bool stepRun);

private:
	uint16_t reg[16] = {0};

	uint16_t &pc = reg[0];
	uint16_t &sp = reg[1];
	StatusRegister *sr = reinterpret_cast<StatusRegister*>(&reg[2]);
	uint16_t &cg2 = reg[3];
	uint16_t &r4 = reg[4];
	uint16_t &r5 = reg[5];
	uint16_t &r6 = reg[6];
	uint16_t &r7 = reg[7];
	uint16_t &r8 = reg[8];
	uint16_t &r9 = reg[9];
	uint16_t &r10 = reg[10];
	uint16_t &r11 = reg[11];
	uint16_t &r12 = reg[12];
	uint16_t &r13 = reg[13];
	uint16_t &r14 = reg[14];
	uint16_t &r15 = reg[15];

	shared_ptr<uint8_t> m_ram;
	const char * m_rom = nullptr;
	long  program_size = 0;
	bool  step_run = false;

	void setPC(uint16_t pc_val);
	void addPC(uint16_t add_val);
	void setSP(uint16_t sp_val);
	void addSP(uint16_t add_val);

	// Double-Operand(Format I) Instructions
	void MOV(DoubleOperandInstruction code);
	void ADD(DoubleOperandInstruction code);  // TODO
	void ADDC(DoubleOperandInstruction code); // TODO
	void SUB(DoubleOperandInstruction code);  // TODO
	void SUBC(DoubleOperandInstruction code); // TODO
	void CMP(DoubleOperandInstruction code);  // TODO
	void DADD(DoubleOperandInstruction code); // TODO
	void BIT(DoubleOperandInstruction code);  // TODO
	void BIC(DoubleOperandInstruction code);  // TODO
	void BIS(DoubleOperandInstruction code);  // TODO
	void XOR(DoubleOperandInstruction code);  // TODO
	void AND(DoubleOperandInstruction code);  // TODO

	unordered_map<int, DoubleOperandFunc> doubleOperandFunctions = {
			{0x4, &MSP430Cpu::MOV},
			{0x5, &MSP430Cpu::ADD},
			{0x6, &MSP430Cpu::ADDC},
			{0x7, &MSP430Cpu::SUB},
			{0x8, &MSP430Cpu::SUBC},
			{0x9, &MSP430Cpu::CMP},
			{0xa, &MSP430Cpu::DADD},
			{0xb, &MSP430Cpu::BIT},
			{0xc, &MSP430Cpu::BIC},
			{0xd, &MSP430Cpu::BIS},
			{0xe, &MSP430Cpu::XOR},
			{0Xf, &MSP430Cpu::AND},
	};

	// Single-Operand(Format II) Instructions
	void RRC(SingleOperandInstruction code); // TODO
	void RRA(SingleOperandInstruction code);  // TODO
	void PUSH(SingleOperandInstruction code);
	void SWPB(SingleOperandInstruction code);
	void CALL(SingleOperandInstruction code);
	void RETI(SingleOperandInstruction code);
	void SXT(SingleOperandInstruction code);

	unordered_map<int, SingleOperandFunc> singleOperandFunctions = {
			{0x20, &MSP430Cpu::RRC},
			{0x21, &MSP430Cpu::SWPB},
			{0x22, &MSP430Cpu::RRA},
			{0x23, &MSP430Cpu::SXT},
			{0x24, &MSP430Cpu::PUSH},
			{0x25, &MSP430Cpu::CALL},
			{0x26, &MSP430Cpu::RETI},
	};

	// Jumps
	void JNE(JumpsInstruction code);
	void JEQ(JumpsInstruction code);
	void JNC(JumpsInstruction code);
	void JC(JumpsInstruction code);
	void JN(JumpsInstruction code);
	void JGE(JumpsInstruction code);
	void JL(JumpsInstruction code);
	void JMP(JumpsInstruction code);

	unordered_map<int, JumpsFunc> jumpsFunctions = {
			{0x8, &MSP430Cpu::JNE},
			{0x9, &MSP430Cpu::JEQ},
			{0xa, &MSP430Cpu::JNC},
			{0xb, &MSP430Cpu::JC},
			{0xc, &MSP430Cpu::JN},
			{0xd, &MSP430Cpu::JGE},
			{0xe, &MSP430Cpu::JL},
			{0xf, &MSP430Cpu::JMP},
	};
};

#endif /* MSP430CPU_H_ */
