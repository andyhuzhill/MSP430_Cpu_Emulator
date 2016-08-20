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

using namespace std;

#pragma packed(0)

typedef struct {
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
} StatusRegister;

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

	void setStepRun(bool stepRun = false) {
		step_run = stepRun;
	}

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

	// Double-Operand(Format I) Instructions
	void MOV(uint16_t code);
	void ADD(uint16_t code);
	void ADDC(uint16_t code);
	void SUB(uint16_t code);
	void SUBC(uint16_t code);
	void CMP(uint16_t code);
	void DADD(uint16_t code);
	void BIT(uint16_t code);
	void BIC(uint16_t code);
	void BIS(uint16_t code);
	void XOR(uint16_t code);
	void AND(uint16_t code);

	// Single-Operand(Format II) Instructions
	void RRC(uint16_t code);
	void RRA(uint16_t code);
	void PUSH(uint16_t code);
	void SWPB(uint16_t code);
	void CALL(uint16_t code);
	void RETI(uint16_t code);
	void SXT(uint16_t code);

	// Jumps
	void JNE(uint16_t code);
	void JEQ(uint16_t code);
	void JNC(uint16_t code);
	void JC(uint16_t code);
	void JN(uint16_t code);
	void JGE(uint16_t code);
	void JL(uint16_t code);
	void JMP(uint16_t code);
};

#endif /* MSP430CPU_H_ */
