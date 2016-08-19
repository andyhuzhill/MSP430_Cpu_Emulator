/*
 * MSP430Cpu.cpp
 *
 *  Created on: Jul 26, 2016
 *      Author: andy
 */

//#include <stdlib.h>
#include <iostream>
#include <cstring>

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
		std::cout << "Program Finished !" << std::endl;
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
		std::cout << "Undefined Instruction! address=0x"
				<< std::hex << pc
				<< " instruction=0x" << code << endl;
	}
}

void MSP430Cpu::run(void)
{
	for (;;) {
		uint16_t code = loadInstruction();
		std::cout << "code = 0x" << std::hex <<  code << std::endl;
		translateCode(code);
	}
}

void MSP430Cpu::jne(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (!sr->Z) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jeq(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (sr->Z) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jnc(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (!sr->C) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jc(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (sr->C) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jn(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (sr->N) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jge(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if (!(sr->N ^ sr->V)) {
		pc += (offset << 1);
	}
}

void MSP430Cpu::jl(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	if ((sr->N ^ sr->V)) {
		pc +=  (offset << 1);
	}
}

void MSP430Cpu::mov(uint16_t code)
{

}

void MSP430Cpu::jmp(uint16_t code)
{
	std::cout << __FUNCTION__ << std::endl;
	uint16_t offset = code & 0x3ff;
	pc += (offset << 1);
}
