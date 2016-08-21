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
	addPC(2);
	if (pc > program_size) {
		cout << "Program Finished !" << endl;
		exit(0);
	}
	return code;
}

void MSP430Cpu::translateCode(uint16_t val)
{
	uint16_t code = ((val & 0xff) << 8) + ((val & 0xff00) >> 8);
	if ((val >= 0x1000) && (val < 0x3400)) {
		SingleOperandInstruction singleInstruction = *reinterpret_cast<SingleOperandInstruction*>(&code);
		auto function = singleOperandFunctions[singleInstruction.opcode];
		(this->*function)(singleInstruction);
	} else if ((val >= 0x2000) && (val < 0x4000)) {
		JumpsInstruction jumpsInstruction = *reinterpret_cast<JumpsInstruction*>(&code);
		auto function = jumpsFunctions[jumpsInstruction.opcode];
		(this->*function)(jumpsInstruction);
	} else if ((val >= 0x4000) && (val < 0xffff)) {
		DoubleOperandInstruction doubleInstruction = *reinterpret_cast<DoubleOperandInstruction*>(&code);
		auto function = doubleOperandFunctions[doubleInstruction.opcode];
		(this->*function)(doubleInstruction);
	} else {
		cout << "Undefined Instruction! address=0x"
				<< std::hex << pc
				<< " instruction=0x" << val << endl;
	}

//	if ((code >= 0x1000) && (code < 0x1080)) {
//		RRC(code);
//	} else if ((code >= 0x1080) && (code < 0x10c0)) {
//		SWPB(code);
//	} else if ((code >= 0x1100) && (code < 0x1180)) {
//		RRA(code);
//	} else if ((code >= 0x1180) && (code < 0x11c0)) {
//		SXT(code);
//	} else if ((code >= 0x1200) && (code < 0x1280)) {
//		PUSH(code);
//	} else if ((code >= 0x1280) && (code < 0x12c0)) {
//		CALL(code);
//	} else if ((code >= 0x1300) && (code < 0x1340)) {
//		RETI(code);
//	} else if ((code >= 0x2000) && (code < 0x2400)) {
//		JNE(code);
//	} else if ((code >= 0x2400) && (code < 0x2800)) {
//		JEQ(code);
//	} else if ((code >= 0x2800) && (code < 0x2c00)) {
//		JNC(code);
//	} else if ((code >= 0x2c00) && (code < 0x3000)) {
//		JC(code);
//	} else if ((code >= 0x3000) && (code < 0x3400)) {
//		JN(code);
//	} else if ((code >= 0x3400) && (code < 0x3800)) {
//		JGE(code);
//	} else if ((code >= 0x3800) && (code < 0x3c00)) {
//		JL(code);
//	} else if ((code >= 0x3c00) && (code < 0x4000)) {
//		JMP(code);
//	} else if ((code >= 0x4000) && (code < 0x5000)) {
//		MOV(code);
//	} else if ((code >= 0x5000) && (code < 0x6000)) {
//		ADD(code);
//	} else if ((code >= 0x6000) && (code < 0x7000)) {
//		ADDC(code);
//	} else if ((code >= 0x7000) && (code < 0x8000)) {
//		SUB(code);
//	} else if ((code >= 0x8000) && (code < 0x9000)) {
//		SUBC(code);
//	} else if ((code >= 0x9000) && (code < 0xa000)) {
//		CMP(code);
//	} else if ((code >= 0xa000) && (code < 0xb000)) {
//		DADD(code);
//	} else if ((code >= 0xb000) && (code < 0xc000)) {
//		BIT(code);
//	} else if ((code >= 0xc000) && (code < 0xd000)) {
//		BIC(code);
//	} else if ((code >= 0xd000) && (code < 0xe000)) {
//		BIS(code);
//	} else if ((code >= 0xe000) && (code < 0xf000)) {
//		XOR(code);
//	} else if ((code >= 0xf000) && (code <= 0xffff)) {
//		AND(code);
//	} else {
//		cout << "Undefined Instruction! address=0x"
//				<< std::hex << pc
//				<< " instruction=0x" << code << endl;
//	}
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

void MSP430Cpu::RRC(SingleOperandInstruction code)
{
	cout << "rrc " << endl;
}

void MSP430Cpu::SWPB(SingleOperandInstruction code)
{
	uint8_t dst_reg = code.s_d_reg;
	uint8_t ad = code.Ad;

	if (ad == 0) { // Register Mode
		uint16_t dst_data = reg[dst_reg];
		uint16_t low_byte = dst_data & 0xff;
		uint16_t high_byte = (dst_data >> 8) & 0xff;
		reg[dst_reg] = (low_byte << 8) + high_byte;

		cout << "swpb r" + to_string(dst_reg) << endl;
	} else if (ad == 1) {
		uint16_t dst_data_base = reg[dst_reg];
		uint16_t dst_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
		addPC(2);
		uint16_t dst_data_address = dst_data_base + dst_data_offset;

		uint16_t dst_data = m_ram.get()[dst_data_address];
		uint16_t low_byte = dst_data & 0xff;
		uint16_t high_byte = (dst_data >> 8) & 0xff;
		m_ram.get()[dst_data_address] = (low_byte << 8) + high_byte;

		cout << "swpb " + to_string(dst_data_offset) +
				"(r" + to_string(dst_reg) + ")" << endl;
	} else if (ad == 2) {
		uint16_t dst_data_address = reg[dst_reg];
		uint16_t dst_data = m_ram.get()[dst_data_address];
		uint16_t low_byte = dst_data & 0xff;
		uint16_t high_byte = (dst_data >> 8) & 0xff;
		m_ram.get()[dst_data_address] = (low_byte << 8) + high_byte;

		cout << "swpb @r" + to_string(dst_reg) << endl;
	}
	cout << "swpb " << endl;
}

void MSP430Cpu::RRA(SingleOperandInstruction code)
{
	cout << "rra " << endl;
}
void MSP430Cpu::SXT(SingleOperandInstruction code)
{
	uint8_t dst_reg = code.s_d_reg;
	uint8_t ad = code.Ad;

	if (ad == 0) { // Register Mode
		if (reg[dst_reg] & 0x80) {
			reg[dst_reg] |= 0xff00;
			sr->N = 1;
		} else {
			reg[dst_reg] |= 0x0000;
			sr->N = 0;
		}
		sr->Z = !reg[dst_reg];

		cout << "sxt r" + to_string(dst_reg) << endl;
	} else if (ad == 1) { // Indexed mode Symbolic Mode Absolute Mode
		uint16_t dst_data_base = reg[dst_reg];
		uint16_t dst_data_offset = *reinterpret_cast<const uint16_t*>(&m_rom[pc]);
		addPC(2);

		uint16_t dst_data_address = dst_data_base + dst_data_offset;

		uint16_t dst_data = m_ram.get()[dst_data_address];
		if (dst_data & 0x80) {
			dst_data |= 0xff00;
			sr->N = 1;
		} else {
			dst_data |= 0x0000;
			sr->N = 0;
		}
		sr->Z = !dst_data;
		m_ram.get()[dst_data_address] = dst_data;

		cout << "sxt " + to_string(dst_data_offset) +
				"(r" + to_string(dst_reg) + ")" << endl;
	} else if (ad == 2) { // Absolute Mode
		uint16_t dst_data_address = reg[dst_reg];
		uint16_t dst_data = m_ram.get()[dst_data_address];
		if (dst_data & 0x80) {
			dst_data |= 0xff00;
			sr->N = 1;
		} else {
			dst_data |= 0x0000;
			sr->N = 0;
		}
		sr->Z = !dst_data;
		m_ram.get()[dst_data_address] = dst_data;

		cout << "sxt @r" + to_string(dst_reg) << endl;
	}

	sr->C = !sr->Z;
	sr->V = 0;
}

void MSP430Cpu::PUSH(SingleOperandInstruction code)
{
	sp -= 2;
	uint8_t src_reg = code.s_d_reg;
	uint8_t ad = code.Ad;
	uint8_t b_w = code.b_w;

	uint16_t src_data = 0;
	if (ad == 0) { // Register Mode
		if (b_w) {
			src_data = reg[src_reg] & 0xff;
			cout << "push.b r" + to_string(src_reg) << endl;
		} else {
			src_data = reg[src_reg];
			cout << "push r" + to_string(src_reg) << endl;
		}
	} else if (ad == 1) { // Indexed mode Symbolic mode Absolute mode
		uint16_t src_data_base = reg[src_reg];

		uint16_t src_data_offset = *reinterpret_cast<const uint16_t*>(&m_rom[pc]);
		addPC(2);

		uint16_t src_data_address = src_data_base + src_data_offset;

		if (b_w) {
			src_data = m_ram.get()[src_data_address] & 0xff;
		} else {
			src_data = m_ram.get()[src_data_address];
		}

		if (src_reg == 0) {	// Symbolic Mode
			cout << (b_w ? "push.b " : "pusb ") + to_string(src_data_address) << endl;
		} else if (src_reg == 2) {
			cout << (b_w ? "push.b &" : "pusb &") + to_string(src_data_address) << endl;
		} else {
			cout << (b_w ? "push.b " : "pusb ") + to_string(src_data_offset) +
					"(r" + to_string(src_reg) + ")" << endl;
		}
	} else if (ad == 2) {
		uint16_t src_data_address = reg[src_reg];
		src_data = m_ram.get()[src_data_address];
		cout << (b_w ? "push.b @r" : "pusb @r") + to_string(src_reg) << endl;
	}

	m_ram.get()[sp] = src_data;
}

void MSP430Cpu::CALL(SingleOperandInstruction code)
{
	uint8_t dst_reg = code.s_d_reg;
	uint8_t ad = code.Ad;

	if (ad == 0) {
		uint16_t call_address = reg[dst_reg];
		if (dst_reg == 3) {
			call_address = 0;
			cout << "call #0" << endl;
		} else {
			cout << "call r" << to_string(dst_reg) << endl;
		}
		sp-= 2;
		m_ram.get()[sp] = pc;
		setPC(call_address);
	} else if (ad == 1) {
		uint16_t call_address = 0;
		if (dst_reg != 3) {
			uint16_t dst_addr_base = reg[dst_reg];
			uint16_t dst_addr_offset = *reinterpret_cast<const uint16_t*>(&m_rom[pc]);
			addPC(2);
			call_address = dst_addr_base + dst_addr_base;
			cout << "call " + to_string(dst_addr_offset) +
					"(r" + to_string(dst_reg) + ")" << endl;
		} else {
			call_address = 1;
			cout << "call #1" << endl;
		}
		sp-= 2;
		m_ram.get()[sp] = pc;
		setPC(call_address);
	} else if (ad == 2) {
		uint16_t call_address = 0;
		if ((dst_reg != 2) && (dst_reg != 3)) {
			uint16_t dst_addr = reg[dst_reg];
			call_address = m_ram.get()[dst_addr];
			cout << "call @r" << to_string(dst_reg) << endl;
		} else {
			if (dst_reg == 2) {
				call_address = 0x0004;
				cout << "call #4" << endl;
			}
			if (dst_reg == 3) {
				call_address = 0x0002;
				cout << "call #2" << endl;
			}
		}
		sp -= 2;
		m_ram.get()[sp] = pc;
		setPC(call_address);
	} else if (ad == 3) {
		uint16_t call_address = 0;
		if (dst_reg == 2) {
			call_address = 0x0008;
			cout << "call #8" << endl;
		}

		sp -= 2;
		m_ram.get()[sp] = pc;
		setPC(call_address);
	}
}
void MSP430Cpu::RETI(SingleOperandInstruction)
{
	uint16_t tos = m_ram.get()[sp];
	reg[2] = tos; // sr = tos;
	addSP(2);
	tos = m_ram.get()[sp];
	setPC(tos);
	addSP(2);
	cout << "reti " << endl;
}

void MSP430Cpu::JNE(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!sr->Z) {
		addPC(offset << 1);
	}

	cout << "jne $" + to_string(offset)  << endl;
}

void MSP430Cpu::JEQ(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->Z) {
		addPC(offset << 1);
	}

	cout << "jeq $" + to_string(offset)  << endl;
}

void MSP430Cpu::JNC(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!sr->C) {
		addPC (offset << 1);
	}

	cout << "jnc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JC(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->C) {
		addPC (offset << 1);
	}

	cout << "jc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JN(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (sr->N) {
		addPC (offset << 1);
	}

	cout << "jn $" + to_string(offset)  << endl;
}

void MSP430Cpu::JGE(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if (!(sr->N ^ sr->V)) {
		addPC (offset << 1);
	}

	cout << "jge $" + to_string(offset)  << endl;
}

void MSP430Cpu::JL(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	if ((sr->N ^ sr->V)) {
		addPC  (offset << 1);
	}

	cout << "jl $" + to_string(offset)  << endl;
}

void MSP430Cpu::setPC(uint16_t pc_val)
{
	pc = pc_val & 0xfffe;
}

void MSP430Cpu::setSP(uint16_t sp_val)
{
	sp = sp_val & 0xfffe;
}

void MSP430Cpu::addPC(uint16_t add_val)
{
	pc +=  (add_val & 0xfffe);
}

void MSP430Cpu::addSP(uint16_t add_val)
{
	sp += (add_val & 0xfffe);
}

void MSP430Cpu::JMP(JumpsInstruction code)
{
	int16_t offset = code.offset;
	if (offset & 0x200) {
		offset |= 0xfc00;
	}
	addPC (offset << 1);
	cout << "jmp $" + to_string(offset)  << endl;
}

void MSP430Cpu::MOV(DoubleOperandInstruction code)
{
	string disasm = "mov";
	uint8_t src_reg = code.s_reg;
	uint8_t dst_reg = code.d_reg;
	uint8_t ad = code.Ad;
	uint8_t as = code.As;
	uint8_t b_w = code.b_w;

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
		addPC(2);
		uint16_t src_base_addr = 0;
		uint16_t src_data_addr = 0;
		if ((src_reg != 2) && (src_reg != 3)) {
			src_base_addr = reg[src_reg];

			src_data_addr = src_base_addr + src_data_offset;

			if (src_reg != 0) {
				disasm += to_string(src_data_offset) +
						"(r" + to_string(src_reg) + "), ";
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
			addPC(2);
			disasm += "#" + to_string(src_data) + ", ";
		}
	}

	// Destination Operand Addressing Mode
	if (ad == 0) { // Register mode
		if (b_w) {
			reg[dst_reg] = src_data & 0xff;
		} else {
			reg[dst_reg] = src_data;
		}
		disasm += "r" + to_string(dst_reg);
	} else if (ad == 1) { // Index mode or Symbolic mode or Absolute mode
		int16_t dst_data_offset = *(reinterpret_cast<const int16_t*>(&m_rom[pc]));
		addPC(2);
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

		if (b_w) {
			m_ram.get()[dst_data_addr] = src_data & 0xff;
		} else {
			m_ram.get()[dst_data_addr] = src_data;
		}

		if ((dst_reg == 2) && (as == 1)) { // Absolute Mode
			disasm += "&" + to_string(dst_data_addr);
		} else {
			if (dst_reg != 0) { // Indexed Mode
				disasm += to_string(dst_data_offset) +
						"(r" + to_string(dst_reg) + ")";
			} else { 		// Y(PC) Symbolic Mode
				disasm += to_string(dst_data_addr);
			}
		}
	}

	cout << disasm << endl;
}

void MSP430Cpu::ADD(DoubleOperandInstruction code)
{
	cout << "add " << endl;
}

void MSP430Cpu::ADDC(DoubleOperandInstruction code)
{
	cout << "addc " << endl;
}

void MSP430Cpu::SUB(DoubleOperandInstruction code)
{
	cout << "sub " << endl;
}

void MSP430Cpu::SUBC(DoubleOperandInstruction code)
{
	cout << "subc " << endl;
}

void MSP430Cpu::CMP(DoubleOperandInstruction code)
{
	cout << "cmp " << endl;
}

void MSP430Cpu::DADD(DoubleOperandInstruction code)
{
	cout << "dadd " << endl;
}

void MSP430Cpu::BIT(DoubleOperandInstruction code)
{
	cout << "bit " << endl;
}

void MSP430Cpu::BIC(DoubleOperandInstruction code)
{
	cout << "bic " << endl;
}

void MSP430Cpu::BIS(DoubleOperandInstruction code)
{
	cout << "bis　" << endl;
}

void MSP430Cpu::XOR(DoubleOperandInstruction code)
{
	cout << "xor " << endl;
}

void MSP430Cpu::AND(DoubleOperandInstruction code)
{
	cout << "and " << endl;
}

void MSP430Cpu::setStepRun(bool stepRun)
{
	step_run = stepRun;
}
