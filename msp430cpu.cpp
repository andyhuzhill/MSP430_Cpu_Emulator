/*
 * MSP430Cpu.cpp
 *
 *  Created on: Jul 26, 2016
 *      Author: andy
 */

#include <iostream>
#include <cstring>
#include <string>

using namespace std;

#include "msp430cpu.h"

MSP430Cpu::MSP430Cpu()
{
	m_ram = shared_ptr<uint8_t>(new uint8_t[0xffff]);
	memset(m_ram.get(), 0, 0xffff);
}

void MSP430Cpu::loadBinRom(const char* const rom_data, long data_size)
{
	m_rom = rom_data;
	program_size = data_size;
}

uint16_t MSP430Cpu::loadNextInstruction()
{
	const uint16_t code = *reinterpret_cast<const uint16_t*>(&m_rom[pc]);
	pc += 2;
	if (pc > program_size) {
		cout << "Program Finished !" << endl;
		exit(0);
	}
	return code;
}

void MSP430Cpu::translateCode(uint16_t code)
{
	if ((code >= 0x1000) && (code < 0x1080)) {
		RRC(code);
	} else if ((code >= 0x1080) && (code < 0x10c0)) {
		SWPB(code);
	} else if ((code >= 0x1100) && (code < 0x1180)) {
		RRA(code);
	} else if ((code >= 0x1180) && (code < 0x11c0)) {
		SXT(code);
	} else if ((code >= 0x1200) && (code < 0x1280)) {
		PUSH(code);
	} else if ((code >= 0x1280) && (code < 0x12c0)) {
		CALL(code);
	} else if ((code >= 0x1300) && (code < 0x1340)) {
		RETI(code);
	} else if ((code >= 0x2000) && (code < 0x2400)) {
		JNE(code);
	} else if ((code >= 0x2400) && (code < 0x2800)) {
		JEQ(code);
	} else if ((code >= 0x2800) && (code < 0x2c00)) {
		JNC(code);
	} else if ((code >= 0x2c00) && (code < 0x3000)) {
		JC(code);
	} else if ((code >= 0x3000) && (code < 0x3400)) {
		JN(code);
	} else if ((code >= 0x3400) && (code < 0x3800)) {
		JGE(code);
	} else if ((code >= 0x3800) && (code < 0x3c00)) {
		JL(code);
	} else if ((code >= 0x3c00) && (code < 0x4000)) {
		JMP(code);
	} else if ((code >= 0x4000) && (code < 0x5000)) {
		MOV(code);
	} else if ((code >= 0x5000) && (code < 0x6000)) {
		ADD(code);
	} else if ((code >= 0x6000) && (code < 0x7000)) {
		ADDC(code);
	} else if ((code >= 0x7000) && (code < 0x8000)) {
		SUB(code);
	} else if ((code >= 0x8000) && (code < 0x9000)) {
		SUBC(code);
	} else if ((code >= 0x9000) && (code < 0xa000)) {
		CMP(code);
	} else if ((code >= 0xa000) && (code < 0xb000)) {
		DADD(code);
	} else if ((code >= 0xb000) && (code < 0xc000)) {
		BIT(code);
	} else if ((code >= 0xc000) && (code < 0xd000)) {
		BIC(code);
	} else if ((code >= 0xd000) && (code < 0xe000)) {
		BIS(code);
	} else if ((code >= 0xe000) && (code < 0xf000)) {
		XOR(code);
	} else if ((code >= 0xf000) && (code <= 0xffff)) {
		AND(code);
	} else {
		cout << "Undefined Instruction! address=0x"
				<< std::hex << pc
				<< " instruction=0x" << code << endl;
	}
}

void MSP430Cpu::run(void)
{
	for (;;) {
		uint16_t code = loadNextInstruction();
		translateCode(code);
		if (step_run) {
			printRegister();
			getchar();
		}
	}
}

void MSP430Cpu::printRegister(void)
{
	cout << "--------------------------" << endl;
	for (int i = 0; i < 16; ++i) {
		cout << "r" << dec << i << " = 0x" << hex << reg[i] << endl;
	}
	cout << "--------------------------" << endl << endl << endl;
}

void MSP430Cpu::RRC(uint16_t code)
{
	cout << "rrc " << endl;
}

void MSP430Cpu::SWPB(uint16_t code)
{
	cout << "swpb " << endl;
}

void MSP430Cpu::RRA(uint16_t code)
{
	cout << "rra " << endl;
}
void MSP430Cpu::SXT(uint16_t code)
{
	cout << "sxt " << endl;
}
void MSP430Cpu::PUSH(uint16_t code)
{
	cout << "push " << endl;
}
void MSP430Cpu::CALL(uint16_t code)
{
	cout << "call " << endl;
}
void MSP430Cpu::RETI(uint16_t code)
{
	cout << "reti " << endl;
}

void MSP430Cpu::JNE(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!sr->Z) {
		pc += (offset << 1);
	}

	cout << "jne $" + to_string(offset)  << endl;
}

void MSP430Cpu::JEQ(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->Z) {
		pc += (offset << 1);
	}

	cout << "jeq $" + to_string(offset)  << endl;
}

void MSP430Cpu::JNC(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!sr->C) {
		pc += (offset << 1);
	}

	cout << "jnc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JC(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->C) {
		pc += (offset << 1);
	}

	cout << "jc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JN(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->N) {
		pc += (offset << 1);
	}

	cout << "jn $" + to_string(offset)  << endl;
}

void MSP430Cpu::JGE(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!(sr->N ^ sr->V)) {
		pc += (offset << 1);
	}

	cout << "jge $" + to_string(offset)  << endl;
}

void MSP430Cpu::JL(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if ((sr->N ^ sr->V)) {
		pc +=  (offset << 1);
	}

	cout << "jl $" + to_string(offset)  << endl;
}

void MSP430Cpu::JMP(uint16_t code)
{
	int16_t offset = code & 0x3ff;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	pc += (offset << 1);
	cout << "jmp $" + to_string(offset)  << endl;
}

void MSP430Cpu::MOV(uint16_t code)
{
	string disasm = "mov";
	uint8_t src_reg = (code & 0x0f00) >> 8;
	uint8_t dst_reg = (code & 0x000f);
	uint8_t ad = (code & 0x0080) >> 7;
	uint8_t as = (code & 0x0030) >> 4;
	uint8_t b_w = (code & 0x0040) >> 6;

	if (b_w) {
		disasm += ".b ";
	} else {
		disasm += " ";
	}

	int16_t src_data = 0;
	if (as == 0) { // Register mode
		if (src_reg != 3) {
			src_data = reg[src_reg];
			disasm += "r" + to_string(src_reg) + ", ";
		} else {  // when as == 0, r3 is constant 0
			src_data = 0;
			disasm += "#0, ";
		}
	} else if (as == 1) { // Index mode or Symbolic mode or Absolute mode
		int16_t src_data_offset = *(reinterpret_cast<const int16_t*>(&m_rom[pc]));

		uint16_t src_base_addr = 0;
		uint16_t src_data_addr = 0;
		if ((src_reg != 2) && (src_reg != 3)) {
			src_base_addr = reg[src_reg];

			src_data_addr = src_base_addr + src_data_offset;

			if (src_reg != 0) {
				disasm += to_string(src_data_offset) + "(r" + to_string(src_reg) + "), ";
			} else {   // offset(PC)
				disasm += to_string(src_data_addr) + ", ";
			}
		} else if (src_reg == 2) { 		// when as == 1, r2 is constant 0
			src_base_addr = 0;

			src_data_addr = src_base_addr + src_data_offset;

			disasm += "&" + to_string(src_data_addr) + ", ";

		} else if (src_reg == 3) {		// when as == 1, r3 is  constant 1
			src_base_addr = 1;

			src_data_addr = src_base_addr + src_data_offset;

			disasm += "&" + to_string(src_data_addr) + ", ";
		}
		src_data = m_ram.get()[src_data_addr];
		pc += 2;
	} else if (as == 2) { // Indirect register mode
		uint16_t src_data_addr = 0;
		if ((src_reg != 2) && (src_reg != 3)) {
			src_data_addr = reg[src_reg];
		} else if (src_reg == 2) {	// when as == 2, r2 is constant 0x0004
			src_data_addr = 0x0004;
		} else if (src_reg == 3) {  // when as == 2, r3 is constant 0x0002
			src_data_addr = 0x0002;
		}

		src_data = m_ram.get()[src_data_addr];

		disasm += "@r" + to_string(src_reg) + ", ";
	} else if (as == 3) { // Indirect autoincrement mode or Immediate mode
		if (src_reg != 0) { // Indirect autoincrement mode
			uint16_t src_data_addr = 0;
			if ((src_reg != 2) && (src_reg != 3)) {
				src_data_addr = reg[src_reg];
				reg[src_reg] += (b_w ? 1 : 2);
			} else if (src_reg == 2) {	// when as == 3, r2 is constant 0x0008
				src_data_addr = 0x0008;
			} else if (src_reg == 3) {	// when as == 3, r3 is constant 0xffff
				src_data_addr = 0xffff;
			}
			src_data = m_ram.get()[src_data_addr];

			disasm += "@r" + to_string(src_reg) + "+, ";
		} else {			// Immediate mode
			src_data = *(reinterpret_cast<const int16_t*>(&m_rom[pc]));
			disasm += "#" + to_string(src_data) + ", ";
		}
		pc += 2;
	}

	// Destination Opt Addressing Mode
	if (ad == 0) { // Register mode
		if (b_w) {
			reg[dst_reg] = src_data & 0xff;
		} else {
			reg[dst_reg] = src_data;
		}
		disasm += "r" + to_string(dst_reg);
	} else if (ad == 1) { // Index mode or Symbolic mode or Absolute mode
		int16_t dst_data_offset = *(reinterpret_cast<const int16_t*>(&m_rom[pc]));

		uint16_t  dst_base_addr = 0;

		if ((dst_reg != 2) && (dst_reg != 3)) {
			dst_base_addr = reg[dst_reg];
		} else {
			if ((dst_reg == 2) && (as == 0)) {
				dst_base_addr = reg[dst_reg];
			} else if ((dst_reg == 2) && (as == 1)) {  // Absolute Mode
				dst_base_addr = 0x0000;
			} else if ((dst_reg == 2) && (as == 2)) {
				dst_base_addr = 0x0004;
			} else if ((dst_reg == 2) && (as == 3)) {
				dst_base_addr = 0x0008;
			} else if ((dst_reg == 3) && (as == 0)) {
				dst_base_addr = 0x0000;
			} else if ((dst_reg == 3) && (as == 1)) {
				dst_base_addr = 0x0001;
			} else if ((dst_reg == 3) && (as == 2)) {
				dst_base_addr = 0x0002;
			} else if ((dst_reg == 3) && (as == 3)) {
				dst_base_addr = 0xffff;
			}
		}

		uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

		pc += 2;

		if (b_w) {
			m_ram.get()[dst_data_addr] = src_data & 0xff;
		} else {
			m_ram.get()[dst_data_addr] = src_data;
		}

		if ((dst_reg == 2) && (as == 1)) { // Absolute Mode
			disasm += "&" + to_string(dst_data_addr);
		} else {
			if (dst_reg != 0) { // Indexed Mode
				disasm += to_string(dst_data_offset) + "(r" + to_string(dst_reg) + ")";
			} else { 		// Y(PC) Symbolic Mode
				disasm += to_string(dst_data_addr);
			}
		}
	}

	cout << disasm << endl;
}

void MSP430Cpu::ADD(uint16_t code)
{
	cout << "add " << endl;
}

void MSP430Cpu::ADDC(uint16_t code)
{
	cout << "addc " << endl;
}

void MSP430Cpu::SUB(uint16_t code)
{
	cout << "sub " << endl;
}

void MSP430Cpu::SUBC(uint16_t code)
{
	cout << "subc " << endl;
}

void MSP430Cpu::CMP(uint16_t code)
{
	cout << "cmp " << endl;
}

void MSP430Cpu::DADD(uint16_t code)
{
	cout << "dadd " << endl;
}

void MSP430Cpu::BIT(uint16_t code)
{
	cout << "bit " << endl;
}

void MSP430Cpu::BIC(uint16_t code)
{
	cout << "bic " << endl;
}

void MSP430Cpu::BIS(uint16_t code)
{
	cout << "bis　" << endl;
}

void MSP430Cpu::XOR(uint16_t code)
{
	cout << "xor " << endl;
}

void MSP430Cpu::AND(uint16_t code)
{
	cout << "and " << endl;
}

void MSP430Cpu::setStepRun(bool stepRun)
{
	step_run = stepRun;
}

