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

void MSP430Cpu::loadProgram(const char *const rom_data, long data_size)
{
    m_rom = rom_data;
    program_size = data_size;
}

uint16_t MSP430Cpu::loadNextInstruction()
{
    const uint16_t code = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
    addPC(2);
    if (pc > program_size) {
        cout << "Program Finished !" << endl;
        exit(0);
    }
    return code;
}

void MSP430Cpu::translateCode(uint16_t val)
{
    if ((val >= 0x1000) && (val < 0x3400)) {
        SingleOperandInstruction singleInstruction = *reinterpret_cast<SingleOperandInstruction *>(&val);
        if (singleOperandFunctions.find(singleInstruction.opcode) != std::end(singleOperandFunctions)) {
            auto function = singleOperandFunctions[singleInstruction.opcode];
            function(singleInstruction);
        } else if ((val >= 0x2000) && (val < 0x4000)) {
            JumpsInstruction jumpsInstruction = *reinterpret_cast<JumpsInstruction *>(&val);

            if (jumpsFunctions.find(jumpsInstruction.opcode) != std::end(jumpsFunctions)) {
                auto function = jumpsFunctions[jumpsInstruction.opcode];
                function(jumpsInstruction);
            } else {
                cerr << "unknown instruction !" << std::hex << val << endl;
                cout << " jumpsInstruction.opcode = " << std::hex << static_cast<int>(jumpsInstruction.opcode) << endl;
                getchar();
            }
        }
    } else if ((val >= 0x2000) && (val < 0x4000)) {
        JumpsInstruction jumpsInstruction = *reinterpret_cast<JumpsInstruction *>(&val);

        if (jumpsFunctions.find(jumpsInstruction.opcode) != std::end(jumpsFunctions)) {
            auto function = jumpsFunctions[jumpsInstruction.opcode];
            function(jumpsInstruction);
        } else {
            cerr << "unknown instruction !" << std::hex << val << endl;
            cout << " jumpsInstruction.opcode = " << std::hex << static_cast<int>(jumpsInstruction.opcode) << endl;
            getchar();
        }
    } else if ((val >= 0x4000) && (val < 0xffff)) {
        DoubleOperandInstruction doubleInstruction = *reinterpret_cast<DoubleOperandInstruction *>(&val);

        if (doubleOperandFunctions.find(doubleInstruction.opcode) != std::end(doubleOperandFunctions)) {
            auto function = doubleOperandFunctions[doubleInstruction.opcode];
            function(doubleInstruction);
        } else {
            cerr << "unknown instruction !" << std::hex << val << endl;
            cout << "doubleInstruction.opcode = " << std::hex << static_cast<int>(doubleInstruction.opcode) << endl;
            getchar();
        }
    } else {
        cout << "Undefined Instruction! address=0x"
             << std::hex << pc
             << " instruction=0x" << val << endl;
        getchar();
    }
}

#include <unistd.h>
void MSP430Cpu::run(void)
{
    for (;;) {
        uint16_t code = loadNextInstruction();
        translateCode(code);
        printRegister();
        if (step_run) {
            getchar();
        }

        usleep(500000);
    }
}

#include <cstdio>
void MSP430Cpu::printRegister(void)
{
    printf("\n");
    printf("+------+------+------+------+------+------+------+-------+\n");
    printf("|  r0  |  r1  |  r2  |  r3  |  r4  |  r5  |  r6  |  r7   |\n");
    printf("+------+------+------+------+------+------+------+-------+\n");
    for (int i = 0; i < 8; ++i) {
        printf("| %04X ", reg[i]);
    }
    printf(" |\n");
    printf("+------+------+------+------+------+------+------+-------+\n");
    printf("|  r9  |  r0  |  r10 |  r11 |  r12 |  r13 |  r14 |  r15  |\n");
    for (int i = 8; i < 16; ++i) {
        printf("| %04X ", reg[i]);
    }
    printf(" |\n");
    printf("+------+------+------+------+------+------+------+-------+\n");
    printf("|   N  |   Z  |   C  |   V  |\n");
    printf("+------+------+------+------+\n");
    printf("|  %2d  |  %2d  |  %2d  |  %2d  |\n", sr->N, sr->Z, sr->C, sr->V);
    printf("+------+------+------+------+\n");
    printf("\n");
}

void MSP430Cpu::RRC(SingleOperandInstruction code)
{
    sr->V = 0;
    if (code.Ad == 0) { // Register mode
        if (code.b_w) {
            uint8_t byteData = reg[code.s_d_reg] & 0xff;
            sr->N = sr->C;
            sr->C = byteData & 0x01;
            if (sr->N) {
                byteData = (byteData >> 1) | 0x80;
            } else {
                byteData = (byteData >> 1);
            }
            sr->Z = (byteData == 0);

            reg[code.s_d_reg] = byteData;
            cout << "rrc.b r" + to_string(code.s_d_reg) << endl;
        } else {
            uint16_t wordData = reg[code.s_d_reg];
            sr->N = sr->C;
            sr->C = wordData & 0x01;
            if (sr->N) {
                wordData = (wordData >> 1) | 0x8000;
            } else {
                wordData = (wordData >> 1);
            }
            sr->Z = (wordData == 0);
            reg[code.s_d_reg] = wordData;

            cout << "address=0x"
                 << std::hex << pc << " rrc r" << to_string(code.s_d_reg) << endl;
        }
    }  else if (code.Ad == 1) { // Indexed mode Symbolic Mode Absolute Mode
        uint16_t dst_data_base = reg[code.s_d_reg];
        uint16_t dst_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
        addPC(2);

        uint16_t dst_data_address = dst_data_base + dst_data_offset;

        if (code.b_w) {
            uint8_t dst_data = m_ram.get()[dst_data_address];
            sr->N = sr->C;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) + 0x80;
            } else {
                dst_data = (dst_data >> 1);
            }
            sr->Z = (dst_data == 0);
            m_ram.get()[dst_data_address] = dst_data;
            cout << "rrc.b " + to_string(dst_data_offset) +
                 "(r" + to_string(code.s_d_reg) + ")" << endl;
        } else {
            uint16_t dst_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]);
            sr->N = sr->C;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) + 0x8000;
            } else {
                dst_data = (dst_data >> 1);
            }
            sr->Z = (dst_data == 0);
            *reinterpret_cast<uint16_t *>(m_ram.get()[dst_data_address]) = dst_data;
            cout << "address=0x"
                 << std::hex << pc << " rrc " + to_string(dst_data_offset) +
                 "(r" + to_string(code.s_d_reg) + ")" << endl;
        }
    } else if (code.Ad == 2) { // Absolute Mode
        uint16_t dst_data_address = reg[code.s_d_reg];

        if (code.b_w) {
            uint8_t dst_data = m_ram.get()[dst_data_address];
            sr->N = sr->C;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) | 0x80;
            } else {
                dst_data >>= 1;
            }
            sr->Z = (dst_data == 0);
            m_ram.get()[dst_data_address] = dst_data;
            cout << "address=0x"
                 << std::hex << pc << " rrc.b @r" + to_string(code.s_d_reg) << endl;
        } else {
            uint16_t dst_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]);
            sr->N = sr->C;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) | 0x8000;
            } else {
                dst_data >>= 1;
            }
            sr->Z = (dst_data == 0);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]) = dst_data;
            cout << "address=0x"
                 << std::hex << pc << " rrc @r" + to_string(code.s_d_reg) << endl;
        }
    }
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

        cout << "address=0x"
             << std::hex << pc << " swpb r" + to_string(dst_reg) << endl;
    } else if (ad == 1) {
        uint16_t dst_data_base = reg[dst_reg];
        uint16_t dst_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
        addPC(2);
        uint16_t dst_data_address = dst_data_base + dst_data_offset;

        uint16_t dst_data = m_ram.get()[dst_data_address];
        uint16_t low_byte = dst_data & 0xff;
        uint16_t high_byte = (dst_data >> 8) & 0xff;
        m_ram.get()[dst_data_address] = (low_byte << 8) + high_byte;

        cout << "address=0x"
             << std::hex << pc << " swpb " + to_string(dst_data_offset) +
             "(r" + to_string(dst_reg) + ")" << endl;
    } else if (ad == 2) {
        uint16_t dst_data_address = reg[dst_reg];
        uint16_t dst_data = m_ram.get()[dst_data_address];
        uint16_t low_byte = dst_data & 0xff;
        uint16_t high_byte = (dst_data >> 8) & 0xff;
        m_ram.get()[dst_data_address] = (low_byte << 8) + high_byte;

        cout << "address=0x"
             << std::hex << pc << " swpb @r" + to_string(dst_reg) << endl;
    } else {
        cout << "address=0x"
             << std::hex << pc << " swpb " << endl;
    }
}

void MSP430Cpu::RRA(SingleOperandInstruction code)
{
    sr->V = 0;
    if (code.Ad == 0) { // Register mode
        if (code.b_w) {
            uint8_t byteData = reg[code.s_d_reg] & 0xff;
            sr->C = byteData & 0x01;
            sr->N = (byteData & 0x80);
            if (sr->N) {
                byteData = (byteData >> 1) | 0x80;
            } else {
                byteData = (byteData >> 1);
            }
            sr->Z = (byteData == 0);

            reg[code.s_d_reg] = byteData;
            cout << "rra.b r" + to_string(code.s_d_reg) << endl;
        } else {
            uint16_t wordData = reg[code.s_d_reg];
            sr->N = (wordData & 0x8000);
            sr->C = wordData & 0x0001;
            if (sr->N) {
                wordData = (wordData >> 1) | 0x8000;
            } else {
                wordData = (wordData >> 1);
            }
            sr->Z = (wordData == 0);
            reg[code.s_d_reg] = wordData;

            cout << "rra r" << to_string(code.s_d_reg) << endl;
        }
    }  else if (code.Ad == 1) { // Indexed mode Symbolic Mode Absolute Mode
        uint16_t dst_data_base = reg[code.s_d_reg];
        uint16_t dst_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
        addPC(2);

        uint16_t dst_data_address = dst_data_base + dst_data_offset;

        if (code.b_w) {
            uint8_t dst_data = m_ram.get()[dst_data_address];
            sr->C = dst_data & 0x01;
            sr->N = dst_data & 0x80;
            if (sr->N) {
                dst_data = (dst_data >> 1) + 0x80;
            } else {
                dst_data = (dst_data >> 1);
            }
            sr->Z = (dst_data == 0);
            m_ram.get()[dst_data_address] = dst_data;
            cout << "rra.b " + to_string(dst_data_offset) +
                 "(r" + to_string(code.s_d_reg) + ")" << endl;
        } else {
            uint16_t dst_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]);
            sr->C = dst_data & 0x0001;
            sr->N = dst_data & 0x8000;
            if (sr->N) {
                dst_data = (dst_data >> 1) + 0x8000;
            } else {
                dst_data = (dst_data >> 1);
            }
            sr->Z = (dst_data == 0);
            *reinterpret_cast<uint16_t *>(m_ram.get()[dst_data_address]) = dst_data;
            cout << "rra " + to_string(dst_data_offset) +
                 "(r" + to_string(code.s_d_reg) + ")" << endl;
        }
    } else if (code.Ad == 2) { // Absolute Mode
        uint16_t dst_data_address = reg[code.s_d_reg];

        if (code.b_w) {
            uint8_t dst_data = m_ram.get()[dst_data_address];
            sr->N = dst_data & 0x80;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) | 0x80;
            } else {
                dst_data >>= 1;
            }
            sr->Z = (dst_data == 0);
            m_ram.get()[dst_data_address] = dst_data;
            cout << "rra.b @r" + to_string(code.s_d_reg) << endl;
        } else {
            uint16_t dst_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]);
            sr->N = dst_data & 0x80;
            sr->C = dst_data & 0x01;
            if (sr->N) {
                dst_data = (dst_data >> 1) | 0x8000;
            } else {
                dst_data >>= 1;
            }
            sr->Z = (dst_data == 0);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_address]) = dst_data;
            cout << "rra @r" + to_string(code.s_d_reg) << endl;
        }
    }
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
        uint16_t dst_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
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
            m_ram.get()[sp] = src_data;
            cout << "push.b r" + to_string(src_reg) << endl;
        } else {
            src_data = reg[src_reg];
            *(reinterpret_cast<uint16_t *>(&m_ram.get()[sp])) = src_data;
            cout << "push r" + to_string(src_reg) << endl;
        }
    } else if (ad == 1) { // Indexed mode Symbolic mode Absolute mode
        uint16_t src_data_base = reg[src_reg];

        uint16_t src_data_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
        addPC(2);

        uint16_t src_data_address = src_data_base + src_data_offset;

        if (b_w) {
            src_data = m_ram.get()[src_data_address] & 0xff;
            m_ram.get()[sp] = src_data;
        } else {
            src_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_address]);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[sp]) = src_data;
        }

        if (src_reg == 0) { // Symbolic Mode
            cout << (b_w ? "push.b " : "pusb ") + to_string(src_data_address) << endl;
        } else if (src_reg == 2) {
            cout << (b_w ? "push.b &" : "pusb &") + to_string(src_data_address) << endl;
        } else {
            cout << (b_w ? "push.b " : "pusb ") + to_string(src_data_offset) +
                 "(r" + to_string(src_reg) + ")" << endl;
        }
    } else if (ad == 2) {
        uint16_t src_data_address = reg[src_reg];

        if (b_w) {
            src_data = m_ram.get()[src_data_address];
            m_ram.get()[pc] = src_data;
        } else {
            src_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_address]);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[pc]) = src_data;
        }
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
        sp -= 2;
        m_ram.get()[sp] = pc;
        setPC(call_address);
    } else if (ad == 1) {
        uint16_t call_address = 0;
        if (dst_reg != 3) {
            uint16_t dst_addr_base = reg[dst_reg];
            uint16_t dst_addr_offset = *reinterpret_cast<const uint16_t *>(&m_rom[pc]);
            addPC(2);
            call_address = dst_addr_base + dst_addr_base;
            cout << "call " + to_string(dst_addr_offset) +
                 "(r" + to_string(dst_reg) + ")" << endl;
        } else {
            call_address = 1;
            cout << "call #1" << endl;
        }
        sp -= 2;
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
    cout << "address=0x"
         << std::hex << pc <<  " reti " << endl;
}

void MSP430Cpu::JNE(JumpsInstruction code)
{
    int16_t offset = code.offset;

    cout << " offset = " << offset << endl;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    cout << " offset= " << offset << endl;
    if (!sr->Z) {
        addPC(offset << 1);
    }

    cout << " offset << 1 =  " << (offset << 1) << endl;

    cout << "address=0x"
         << std::hex << pc << " jne $" + to_string(offset)  << endl;
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

    cout << "address=0x"
         << std::hex << pc <<  " jeq $" + to_string(offset)  << endl;
}

void MSP430Cpu::JNC(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    if (!sr->C) {
        addPC(offset << 1);
    }

    cout << "address=0x"
         << std::hex << pc <<  " jnc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JC(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    if (sr->C) {
        addPC(offset << 1);
    }

    cout << "address=0x"
         << std::hex << pc <<  " jc $" + to_string(offset)  << endl;
}

void MSP430Cpu::JN(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    if (sr->N) {
        addPC(offset << 1);
    }

    cout << "address=0x"
         << std::hex << pc << " jn $" + to_string(offset)  << endl;
}

void MSP430Cpu::JGE(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    if (!(sr->N ^ sr->V)) {
        addPC(offset << 1);
    }

    cout << "address=0x"
         << std::hex << pc << " jge $" + to_string(offset)  << endl;
}

void MSP430Cpu::JL(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    if ((sr->N ^ sr->V)) {
        addPC (offset << 1);
    }

    cout << "address=0x"
         << std::hex << pc << " jl $" + to_string(offset)  << endl;
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

/**
 *  @brief  Get the Source Oprand of double operand instructions
 *
 *  @param code     binary instruction
 *  @param disasm   disasmbly string
 */
uint16_t MSP430Cpu::getDoubleOpSourceOperand(DoubleOperandInstruction code, string &disasm)
{
    int16_t src_data = 0;
    if (code.As == 0) { // Register mode
        if (code.s_reg != 3) {
            src_data = code.b_w ? reg[code.s_reg] & 0xff : reg[code.s_reg];
            disasm += "r" + to_string(code.s_reg) + ", ";
        } else {  // when as == 0, r3 is constant 0
            src_data = 0;
            disasm += "#0, ";
        }
    } else if (code.As == 1) { // Index mode or Symbolic mode or Absolute mode
        int16_t src_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t src_base_addr = 0;
        uint16_t src_data_addr = 0;
        if ((code.s_reg != 2) && (code.s_reg != 3)) {
            src_base_addr = reg[code.s_reg];
            src_data_addr = src_base_addr + src_data_offset;
            if (code.s_reg != 0) {
                disasm += to_string(src_data_offset) +
                          "(r" + to_string(code.s_reg) + "), ";
            } else {   // offset(PC)
                disasm += to_string(src_data_addr) + ", ";
            }
        } else if (code.s_reg == 2) {       // when as == 1, r2 is constant 0
            src_base_addr = 0;
            src_data_addr = src_base_addr + src_data_offset;
            disasm += "&" + to_string(src_data_addr) + ", ";
        } else if (code.s_reg == 3) {       // when as == 1, r3 is  constant 1
            src_base_addr = 1;
            src_data_addr = src_base_addr + src_data_offset;
            disasm += "&" + to_string(src_data_addr) + ", ";
        }
        src_data = code.b_w ? m_ram.get()[src_data_addr] & 0xff
                   : *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_addr]);
    } else if (code.As == 2) { // Indirect register mode
        uint16_t src_data_addr = 0;
        if ((code.s_reg != 2) && (code.s_reg != 3)) {
            src_data_addr = reg[code.s_reg];
            disasm += "@r" + to_string(code.s_reg) + ", ";
            src_data = code.b_w ? m_ram.get()[src_data_addr]
                       : *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_addr]);
        } else if (code.s_reg == 2) {   // when as == 2, r2 is constant 0x0004
            disasm += "#4, ";
            src_data = 4;
        } else if (code.s_reg == 3) {  // when as == 2, r3 is constant 0x0002
            disasm += "#2, ";
            src_data = 2;
        }
    } else if (code.As == 3) { // Indirect autoincrement mode or Immediate mode
        if (code.s_reg != 0) { // Indirect autoincrement mode
            uint16_t src_data_addr = 0;
            if ((code.s_reg != 2) && (code.s_reg != 3)) {
                src_data_addr = reg[code.s_reg];
                reg[code.s_reg] += (code.b_w ? 1 : 2);
                disasm += "@r" + to_string(code.s_reg) + "+, ";
            } else if (code.s_reg == 2) {   // when as == 3, r2 is constant 0x0008
                src_data_addr = 0x0008;
                disasm += "#8, ";
            } else if (code.s_reg == 3) {   // when as == 3, r3 is constant 0xffff
                src_data_addr = 0xffff;
                disasm += "#-1, ";
            }
            src_data = code.b_w ? m_ram.get()[src_data_addr] :
                       *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_addr]);
        } else {            // Immediate mode
            if (code.b_w) {
                src_data = m_rom[pc];
            } else {
                src_data = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
            }
            addPC(2);
            disasm += "#" + to_string(src_data) + ", ";
        }
    }

    return src_data;
}

int16_t MSP430Cpu::bcd2bin(int16_t data, bool is8Bit)
{
    int16_t result = 0;
    if (is8Bit) {
        data &= 0xff;
        result = (data >> 4) * 10 + (data & 0xf);
    } else {
        result = (data >> 12) * 1000 +
                 ((data >> 8) & 0xf) * 100 +
                 ((data >> 4) & 0xf) * 10 +
                 (data & 0xf);
    }
    return result;
}

int16_t MSP430Cpu::bin2bcd(int16_t data, bool is8Bit)
{
    int16_t result;
    if (is8Bit) {
        result = data % 10;
        result += ((data / 10) % 10) << 4;
    } else {
        result = data % 10;
        result += ((data / 10) % 10) << 4;
        result += ((data / 100) % 10) << 8;
        result += ((data / 1000) % 10) << 12;
    }
    return result;
}

void MSP430Cpu::JMP(JumpsInstruction code)
{
    int16_t offset = code.offset;
    if (offset & 0x200) {
        offset |= 0xfc00;
    }
    addPC(offset << 1);
    cout << "address=0x"
         << std::hex << pc << " jmp $" + to_string(offset)  << endl;
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
        int16_t src_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
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
        } else if (src_reg == 2) {      // when as == 1, r2 is constant 0
            src_base_addr = 0;

            src_data_addr = src_base_addr + src_data_offset;

            disasm += "&" + to_string(src_data_addr) + ", ";

        } else if (src_reg == 3) {      // when as == 1, r3 is  constant 1
            src_base_addr = 1;

            src_data_addr = src_base_addr + src_data_offset;

            disasm += "&" + to_string(src_data_addr) + ", ";
        }
        if (b_w) {
            src_data = m_ram.get()[src_data_addr];
        } else {
            src_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_addr]);
        }
    } else if (as == 2) { // Indirect register mode
        uint16_t src_data_addr = 0;
        if ((src_reg != 2) && (src_reg != 3)) {
            src_data_addr = reg[src_reg];
            disasm += "@r" + to_string(src_reg) + ", ";
            if (b_w) {
                src_data = m_ram.get()[src_data_addr];
            } else {
                src_data = *reinterpret_cast<uint16_t *>(m_ram.get()[src_data_addr]);
            }
        } else if (src_reg == 2) {  // when as == 2, r2 is constant 0x0004
            src_data_addr = 0x0004;
            disasm += "#4, ";
            src_data = 4;
        } else if (src_reg == 3) {  // when as == 2, r3 is constant 0x0002
            src_data_addr = 0x0002;
            disasm += "#2, ";
            src_data = 2;
        }
    } else if (as == 3) { // Indirect autoincrement mode or Immediate mode
        if (src_reg != 0) { // Indirect autoincrement mode
            uint16_t src_data_addr = 0;
            if ((src_reg != 2) && (src_reg != 3)) {
                src_data_addr = reg[src_reg];
                reg[src_reg] += (b_w ? 1 : 2);
                disasm += "@r" + to_string(src_reg) + "+, ";
            } else if (src_reg == 2) {  // when as == 3, r2 is constant 0x0008
                src_data_addr = 0x0008;
                disasm += "#8, ";
            } else if (src_reg == 3) {  // when as == 3, r3 is constant 0xffff
                src_data_addr = 0xffff;
                disasm += "#-1, ";
            }
            if (b_w) {
                src_data = m_ram.get()[src_data_addr];
            } else {
                src_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[src_data_addr]);
            }
        } else {            // Immediate mode
            src_data = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
            if (b_w) {
                src_data &= 0xff;
            }
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
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
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
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = src_data;
        }

        if ((dst_reg == 2) && (as == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (dst_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(dst_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }

    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::ADD(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "add.b " : "add ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t result = reg[code.d_reg] + (src_data & 0xff);
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            reg[code.d_reg] = result & 0xff;
        } else {
            int32_t result = reg[code.d_reg] + src_data;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            reg[code.d_reg] = result & 0xffff;
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t result = m_ram.get()[dst_data_addr] + (src_data & 0xff);
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            int32_t result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) + src_data;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " <<  disasm << endl;
}

void MSP430Cpu::ADDC(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "addc.b " : "addc ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t result = reg[code.d_reg] + (src_data & 0xff) + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            reg[code.d_reg] = result & 0xff;
        } else {
            int32_t result = reg[code.d_reg] + src_data + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            reg[code.d_reg] = result & 0xffff;
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t result = m_ram.get()[dst_data_addr] + (src_data & 0xff) + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            int32_t result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) + src_data + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }

    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::SUB(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "sub.b " : "sub ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t result = reg[code.d_reg] - (src_data & 0xff);
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            reg[code.d_reg] = result & 0xff;
        } else {
            int32_t result = reg[code.d_reg] - src_data;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            reg[code.d_reg] = result & 0xffff;
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t result = m_ram.get()[dst_data_addr] - (src_data & 0xff);
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            int32_t result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) - src_data;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::SUBC(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "subc.b " : "subc ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t result = reg[code.d_reg] - (src_data & 0xff) - 1 + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            reg[code.d_reg] = result & 0xff;
        } else {
            int32_t result = reg[code.d_reg] - src_data - 1 + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            reg[code.d_reg] = result & 0xffff;
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t result = m_ram.get()[dst_data_addr] - (src_data & 0xff) - 1 + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            int32_t result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) - src_data - 1 + sr->C;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }

    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::CMP(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "cmp.b " : "cmp ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t result = reg[code.d_reg] + (src_data & 0xff) + 1;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
        } else {
            int32_t result = reg[code.d_reg] + src_data + 1;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t result = m_ram.get()[dst_data_addr] + (src_data & 0xff) + 1;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 128) || (result < -127);
            sr->V = (result > 128) || (result < -127);
        } else {
            int32_t result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) + src_data + 1;
            sr->N = (result < 0);
            sr->Z = (result == 0);
            sr->C = (result > 32768) || (result < -32767);
            sr->V = (result > 32768) || (result < -32767);
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc <<  " " << disasm << endl;
}

void MSP430Cpu::DADD(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "dadd.b " : "dadd ";

    int16_t bcd_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        if (code.b_w) {
            int16_t src_data = bcd2bin(bcd_data & 0xff, 8);
            int16_t dst_data = bcd2bin(reg[code.d_reg] & 0xff, 8);
            int16_t result = dst_data + src_data;
            sr->C = result > 99;
            sr->Z = (result == 0);
            result = bin2bcd(result, 8);
            sr->N = (result & 0x80);
            reg[code.d_reg] = result;
        } else {
            int16_t src_data = bcd2bin(bcd_data, 16);
            int16_t dst_data = bcd2bin(reg[code.d_reg], 16);
            int32_t result = dst_data + src_data;
            sr->C = result > 9999;
            sr->Z = (result == 0);
            result = bin2bcd(result, 16);
            sr->N = (result & 0x8000);
            reg[code.d_reg] = result;
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        if (code.b_w) {
            int16_t src_data = bcd2bin(bcd_data & 0xff, 8);
            int16_t dst_data = bcd2bin(m_ram.get()[dst_data_addr], 8);
            int16_t result = src_data + dst_data;
            sr->Z = (result == 0);
            sr->C = (result > 99);
            result = bin2bcd(result, 8);
            sr->N = (result & 0x80);
            m_ram.get()[dst_data_addr] = result;
        } else {
            int16_t src_data = bcd2bin(bcd_data, 16);
            int16_t dst_bcd_data = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]);
            int16_t dst_data = bcd2bin(dst_bcd_data, 16);
            int16_t result = dst_data + src_data;
            sr->Z = (result == 0);
            sr->C = (result > 9999);
            result = bin2bcd(result, 16);
            sr->N = (result & 0x8000);
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result;
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::BIT(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "bit.b " : "bit ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        uint16_t result = 0;
        if (code.b_w) {
            result = reg[code.d_reg] & (src_data & 0xff);
        } else {
            result = reg[code.d_reg] & src_data;
        }
        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = !sr->Z;
        sr->V = 0;
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        uint16_t result = 0;
        if (code.b_w) {
            result = m_ram.get()[dst_data_addr] & (src_data & 0xff);
        } else {
            result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) & src_data;
        }

        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = !sr->Z;
        sr->V = 0;

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::BIC(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "bic.b " : "bic ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
//        uint16_t result = 0;
        if (code.b_w) {
            reg[code.d_reg] &= ~(src_data & 0xff);
        } else {
            reg[code.d_reg] &= ~(src_data);
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

//        uint16_t result = 0;
        if (code.b_w) {
            m_ram.get()[dst_data_addr] &= ~(src_data & 0xff);
        } else {
            m_ram.get()[dst_data_addr] &= ~(src_data);
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::BIS(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "bis.b " : "bis ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
//        uint16_t result = 0;
        if (code.b_w) {
            reg[code.d_reg] |= (src_data & 0xff);
        } else {
            reg[code.d_reg] |= (src_data);
        }
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

//        uint16_t result = 0;
        if (code.b_w) {
            m_ram.get()[dst_data_addr] |= (src_data & 0xff);
        } else {
            m_ram.get()[dst_data_addr] |= (src_data);
        }

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }
    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::XOR(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "xor.b " : "xor ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);

    if (code.Ad == 0) {
        int16_t result = 0;
        if (code.b_w) {
            sr->V = (src_data < 0) && ((reg[code.d_reg] & 0xff) < 0);
            result = (reg[code.d_reg] & 0xff) | (src_data & 0xff);
            reg[code.d_reg] = result & 0xff;
        } else {
            sr->V = (src_data < 0) && (reg[code.d_reg] < 0);
            result = reg[code.d_reg] | src_data;
            reg[code.d_reg] = result & 0xffff;
        }
        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = (result != 0);
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        int16_t result = 0;
        if (code.b_w) {
            sr->V = ((m_ram.get()[dst_data_addr] & 0xff) < 0) && ((src_data & 0xff) < 0);
            result = (m_ram.get()[dst_data_addr] & 0xff) | (src_data & 0xff);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            sr->V = (m_ram.get()[dst_data_addr] < 0) && (src_data < 0);
            result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) | src_data;
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }
        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = (result != 0);

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }

    cout << "address=0x"
         << std::hex << pc << " " << disasm << endl;
}

void MSP430Cpu::AND(DoubleOperandInstruction code)
{
    string disasm = code.b_w ? "and.b " : "and ";

    int16_t src_data = getDoubleOpSourceOperand(code, disasm);
    sr->V = 0;

    if (code.Ad == 0) {
        int16_t result = 0;
        if (code.b_w) {
            result = (reg[code.d_reg] & 0xff) & (src_data & 0xff);
            reg[code.d_reg] = result & 0xff;
        } else {
            sr->V = (src_data < 0) && (reg[code.d_reg] < 0);
            result = reg[code.d_reg] & src_data;
            reg[code.d_reg] = result & 0xffff;
        }

        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = (result != 0);
        disasm += "r" + to_string(code.d_reg);
    } else if (code.Ad == 1) {
        int16_t dst_data_offset = *(reinterpret_cast<const int16_t *>(&m_rom[pc]));
        addPC(2);
        uint16_t dst_base_addr = 0;
        if ((code.d_reg != 2) && (code.d_reg != 3)) {
            dst_base_addr = reg[code.d_reg];
        } else {
            if ((code.d_reg == 2) && (code.As == 0)) {
                dst_base_addr = reg[code.d_reg];
            } else if ((code.d_reg == 2) && (code.As == 1)) {  // Absolute Mode
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 2) && (code.As == 2)) {
                dst_base_addr = 0x0004;
            } else if ((code.d_reg == 2) && (code.As == 3)) {
                dst_base_addr = 0x0008;
            } else if ((code.d_reg == 3) && (code.As == 0)) {
                dst_base_addr = 0x0000;
            } else if ((code.d_reg == 3) && (code.As == 1)) {
                dst_base_addr = 0x0001;
            } else if ((code.d_reg == 3) && (code.As == 2)) {
                dst_base_addr = 0x0002;
            } else if ((code.d_reg == 3) && (code.As == 3)) {
                dst_base_addr = 0xffff;
            }
        }
        uint16_t dst_data_addr = dst_base_addr + dst_data_offset;

        int16_t result = 0;
        if (code.b_w) {
            result = (m_ram.get()[dst_data_addr] & 0xff) & (src_data & 0xff);
            m_ram.get()[dst_data_addr] = result & 0xff;
        } else {
            result = *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) & src_data;
            *reinterpret_cast<uint16_t *>(&m_ram.get()[dst_data_addr]) = result & 0xffff;
        }
        sr->N = (result < 0);
        sr->Z = (result == 0);
        sr->C = (result != 0);

        if ((code.d_reg == 2) && (code.As == 1)) { // Absolute Mode
            disasm += "&" + to_string(dst_data_addr);
        } else {
            if (code.d_reg != 0) { // Indexed Mode
                disasm += to_string(dst_data_offset) +
                          "(r" + to_string(code.d_reg) + ")";
            } else {        // Y(PC) Symbolic Mode
                disasm += to_string(dst_data_addr);
            }
        }
    }

    cout << "address=0x"
         << std::hex << pc <<  " " << disasm << endl;
}

void MSP430Cpu::setStepRun(bool stepRun)
{
    step_run = stepRun;
}
