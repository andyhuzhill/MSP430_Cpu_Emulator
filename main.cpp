#include <iostream>
#include <fstream>
#include <memory>
#include "msp430cpu.h"

using namespace std;

int main(int argc, char *argv[])
{
    MSP430Cpu cpu;

//    cpu.setStepRun(true);

    ifstream rom_file;
    rom_file.open(argv[1], ifstream::in);
    rom_file.seekg(0, ifstream::end);
    long data_size = rom_file.tellg();
    rom_file.seekg(0);

    try {
        unique_ptr<char> rom = unique_ptr<char>(new char[data_size]);
        rom_file.read(rom.get(), data_size);
        cpu.loadProgram(rom.get(), data_size);

        cpu.run();
    } catch (std::bad_alloc &) {
        cout << "bad alloc" << endl;
    }
    return 0;
}
