/*
 * MSP430Cpu.cpp
 *
 *  Created on: Jul 26, 2016
 *      Author: andy
 */

#include <iostream>
#include <cstring>

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

uint16_t MSP430Cpu::loadInstruction()
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
	if ((code & 0xff00) == 0x2000) {
		jne(code);
	} else if ((code & 0xff00) == 0x2400) {
		jeq(code);
	} else if ((code & 0xff00) == 0x2800) {
		jnc(code);
	} else if ((code & 0xff00) == 0x2c00) {
		jc(code);
	} else if ((code & 0xff00) == 0x3000) {
		jn(code);
	} else if ((code & 0xff00) == 0x3400) {
		jge(code);
	} else if ((code & 0xff00) == 0x3800) {
		jl(code);
	} else if ((code & 0xff00) == 0x3c00) {
		jmp(code);
	} else if ((code & 0xff00) == 0x4000) {
		mov(code);
	} else {
		cout << "Undefined Instruction! address=0x"
				<< std::hex << pc
				<< " instruction=0x" << code << endl;
	}
}

void MSP430Cpu::run(void)
{
	for (;;) {
		uint16_t code = loadInstruction();
		cout << "code = 0x" << std::hex <<  code << endl;
		translateCode(code);
	}
}

void MSP430Cpu::jne(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (!sr->Z) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jeq(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (sr->Z) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jnc(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (!sr->C) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jc(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (sr->C) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jn(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (sr->N) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jge(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if (!(sr->N ^ sr->V)) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jl(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	if ((sr->N ^ sr->V)) {
		pc +=  (offset << 1);
	}
}

void MSP430Cpu::mov(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint8_t src_reg = (code & 0x0f00) >> 8;
	uint8_t dst_reg = (code & 0x000f);
	uint8_t ad = (code & 0x0080) >> 7;
	uint8_t as = (code & 0x0030) >> 4;
	uint8_t b_w = (code & 0x0040) >> 6;

	if ((as == 0x00) && (ad == 0x0)) {  // Register mode
		if (b_w) {
			reg[dst_reg] = (reg[dst_reg] & 0xff00) + (reg[src_reg] & 0xff);
		} else {
			reg[dst_reg] = reg[src_reg];
		}
	} else if ((as == 0x01) && (ad == 0x1)) { // Indexed Mode && Symbolic mode && Absolute mode
		uint16_t x = *(reinterpret_cast<const uint16_t*>(&m_rom[pc]));
		uint16_t y = *(reinterpret_cast<const uint16_t*>(&m_rom[pc + 2]));

		uint16_t src_base_addr = reg[src_reg];
		uint16_t dst_base_addr = reg[dst_reg];

		uint16_t src_addr = src_base_addr + x;
		uint16_t dst_addr = dst_base_addr + y;

		if (b_w) {
			m_ram.get()[dst_addr] = (m_ram.get()[dst_addr] & 0xff00) + (m_ram.get()[src_addr] & 0xff);
		} else {
			m_ram.get()[dst_addr] = m_ram.get()[src_addr];
		}
		pc += 2;
	} else if (as == 0x10) { //　Indirect register mode && Indrect autoincrement

	} else if (as == 0x11) { // Immediate mode

	}
}

void MSP430Cpu::printRegister(void)
{
	for (int i = 0; i < 16; ++i) {
		cout << "r" << i << " = 0x" << hex << reg[i] << endl;
	}

}

void MSP430Cpu::jmp(uint16_t code)
{
	cout << __FUNCTION__ << endl;
	uint16_t offset = code & 0x3ff;
	pc += (offset << 1);
}
