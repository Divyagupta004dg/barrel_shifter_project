# 32-bit Bidirectional Barrel Shifter in Verilog

This project implements a 32-bit bidirectional barrel shifter in Verilog.  
It supports left and right shifting based on a `dir` signal.

##  Files Included
- `barrel_shifter.v` – RTL design
- `tb_barrel_shifter.v` – Testbench with sample inputs
- `barrel_shifter_project.vcd` – Waveform dump for GTKWave

## How to Simulate
1. Compile and simulate using Icarus Verilog:
   ```bash
   iverilog -o barrel_tb tb_barrel_shifter.v barrel_shifter.v
   vvp barrel_tb
