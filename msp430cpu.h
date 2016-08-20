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

	uint16_t loadInstruction();

	void translateCode(uint16_t code);

	void printRegister(void);

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

	// Double-Operand(Format I) Instructions
	void mov(uint16_t code);

	// Single-Operand(Format II) Instructions

	// Jumps
	void jne(uint16_t code);
	void jeq(uint16_t code);
	void jnc(uint16_t code);
	void jc(uint16_t code);
	void jn(uint16_t code);
	void jge(uint16_t code);
	void jl(uint16_t code);
	void jmp(uint16_t code);
};

#endif /* MSP430CPU_H_ */
