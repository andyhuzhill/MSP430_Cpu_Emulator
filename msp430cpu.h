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
#include <functional>

using namespace std;

class MSP430Cpu;

#pragma packed(push, 0)

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
    uint8_t C : 1;
    uint8_t Z : 1;
    uint8_t N : 1;
    uint8_t GIE : 1;
    uint8_t CPU_OFF : 1;
    uint8_t OSC_OFF : 1;
    uint8_t SCG0 : 1;
    uint8_t SCG1 : 1;
    uint8_t V : 1;
    uint8_t reserved : 7;
#else
    uint8_t reserved : 7;
    uint8_t V : 1;
    uint8_t SCG1 : 1;
    uint8_t SCG0 : 1;
    uint8_t OSC_OFF : 1;
    uint8_t CPU_OFF : 1;
    uint8_t GIE : 1;
    uint8_t N : 1;
    uint8_t Z : 1;
    uint8_t C : 1;
#endif
} StatusRegister;

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
    uint8_t d_reg : 4;
    uint8_t As : 2;
    uint8_t b_w : 1;
    uint8_t Ad : 1;
    uint8_t s_reg : 4;
    uint8_t opcode : 4;
#else
    uint8_t opcode : 4;
    uint8_t s_reg : 4;
    uint8_t Ad : 1;
    uint8_t b_w : 1;
    uint8_t As : 2;
    uint8_t d_reg : 4;
#endif
} DoubleOperandInstruction;

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
    uint8_t s_d_reg : 4;
    uint8_t Ad : 2;
    uint8_t b_w : 1;
    uint16_t opcode : 9;
#else
    uint16_t opcode : 9;
    uint8_t b_w : 1;
    uint8_t Ad : 2;
    uint8_t s_d_reg : 4;
#endif
} SingleOperandInstruction;

typedef struct {
#ifdef __ORDER_LITTLE_ENDIAN__
    uint16_t offset : 10;
    uint8_t opcode : 6;
#else
    uint8_t opcode : 6;
    uint16_t offset : 10;
#endif
} JumpsInstruction;

#pragma packed(pop)

class MSP430Cpu
{
public:
    MSP430Cpu();
    virtual ~MSP430Cpu() = default;

    void loadProgram(const char *const rom_data, long data_size);

    void run(void);

    uint16_t loadNextInstruction();

    void translateCode(uint16_t code);

    void printRegister(void);

    void setStepRun(bool stepRun);

private:
    uint16_t reg[16] = {0};

    uint16_t &pc = reg[0];
    uint16_t &sp = reg[1];
    StatusRegister *sr = reinterpret_cast<StatusRegister *>(&reg[2]);
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
    const char *m_rom {};
    long program_size {};
    bool step_run{};

    ////////////////////////////////////////////////////
    ///  Functions
    ////////////////////////////////////////////////////

    void setPC(uint16_t pc_val);
    void addPC(uint16_t add_val);
    void setSP(uint16_t sp_val);
    void addSP(uint16_t add_val);

    uint16_t getDoubleOpSourceOperand(DoubleOperandInstruction code, string &disasm);

    int16_t bcd2bin(int16_t data, bool is8Bit);
    int16_t bin2bcd(int16_t data, bool is8Bit);

    // Double-Operand(Format I) Instructions
    void MOV(DoubleOperandInstruction code);
    void ADD(DoubleOperandInstruction code);
    void ADDC(DoubleOperandInstruction code);
    void SUB(DoubleOperandInstruction code);
    void SUBC(DoubleOperandInstruction code);
    void CMP(DoubleOperandInstruction code);
    void DADD(DoubleOperandInstruction code);
    void BIT(DoubleOperandInstruction code);
    void BIC(DoubleOperandInstruction code);
    void BIS(DoubleOperandInstruction code);
    void XOR(DoubleOperandInstruction code);
    void AND(DoubleOperandInstruction code);

    unordered_map<int, function<void(DoubleOperandInstruction)>> doubleOperandFunctions = {
        {0x4, bind(&MSP430Cpu::MOV, this, placeholders::_1)},
        {0x5, bind(&MSP430Cpu::ADD, this, placeholders::_1)},
        {0x6, bind(&MSP430Cpu::ADDC, this, placeholders::_1)},
        {0x7, bind(&MSP430Cpu::SUB, this, placeholders::_1)},
        {0x8, bind(&MSP430Cpu::SUBC, this, placeholders::_1)},
        {0x9, bind(&MSP430Cpu::CMP, this, placeholders::_1)},
        {0xa, bind(&MSP430Cpu::DADD, this, placeholders::_1)},
        {0xb, bind(&MSP430Cpu::BIT, this, placeholders::_1)},
        {0xc, bind(&MSP430Cpu::BIC, this, placeholders::_1)},
        {0xd, bind(&MSP430Cpu::BIS, this, placeholders::_1)},
        {0xe, bind(&MSP430Cpu::XOR, this, placeholders::_1)},
        {0Xf, bind(&MSP430Cpu::AND, this, placeholders::_1)},
    };

    // Single-Operand(Format II) Instructions
    void RRC(SingleOperandInstruction code);
    void RRA(SingleOperandInstruction code);
    void PUSH(SingleOperandInstruction code);
    void SWPB(SingleOperandInstruction code);
    void CALL(SingleOperandInstruction code);
    void RETI(SingleOperandInstruction code);
    void SXT(SingleOperandInstruction code);

    unordered_map<int, function<void(SingleOperandInstruction)>> singleOperandFunctions = {
        {0x20, bind(&MSP430Cpu::RRC, this, placeholders::_1)},
        {0x21, bind(&MSP430Cpu::SWPB, this, placeholders::_1)},
        {0x22, bind(&MSP430Cpu::RRA, this, placeholders::_1)},
        {0x23, bind(&MSP430Cpu::SXT, this, placeholders::_1)},
        {0x24, bind(&MSP430Cpu::PUSH, this, placeholders::_1)},
        {0x25, bind(&MSP430Cpu::CALL, this, placeholders::_1)},
        {0x26, bind(&MSP430Cpu::RETI, this, placeholders::_1)},
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

    unordered_map<int, function<void(JumpsInstruction)>> jumpsFunctions = {
        {0x8, bind(&MSP430Cpu::JNE, this, placeholders::_1)},
        {0x9, bind(&MSP430Cpu::JEQ, this, placeholders::_1)},
        {0xa, bind(&MSP430Cpu::JNC, this, placeholders::_1)},
        {0xb, bind(&MSP430Cpu::JC, this, placeholders::_1)},
        {0xc, bind(&MSP430Cpu::JN, this, placeholders::_1)},
        {0xd, bind(&MSP430Cpu::JGE, this, placeholders::_1)},
        {0xe, bind(&MSP430Cpu::JL, this, placeholders::_1)},
        {0xf, bind(&MSP430Cpu::JMP, this, placeholders::_1)},
    };
};

#endif /* MSP430CPU_H_ */
