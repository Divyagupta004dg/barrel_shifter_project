# 32-bit Bidirectional Barrel Shifter in Verilog

This project implements a 32-bit bidirectional barrel shifter in Verilog.  
It supports left and right shifting based on a `dir` signal.

##  Files Included
- `barrel_shifter.v` – RTL design
- `tb_barrel_shifter.v` – Testbench with sample inputs
- `barrel_shifter_project.vcd` – Waveform dump for GTKWave
- `synth.ys`: Yosys script
- `barrel_shifter_synth.v`: Synthesized netlist
- `sim.vvp`: Compiled simulation
- `config.tcl`: OpenLane config file

## How to Simulate
1. Compile and simulate using Icarus Verilog:
   ```bash
   iverilog -o barrel_tb tb_barrel_shifter.v barrel_shifter.v
   vvp barrel_tb
   gtkwave barrel_shifter_project.vcd
   
2.Create a synth.ys file first:
in terminal type

read_verilog src/barrel_shifter.v

synth -top barrel_shifter

write_verilog barrel_shifter_synth.v

This does:

    read_verilog: Loads your RTL

    synth -top barrel_shifter: Synthesizes it, assumes top module is barrel_shifter

    write_verilog: Saves synthesized netlist as barrel_shifter_synth.v
    then run this
    yosys synth.ys

    remember xdot is installed, it will show a graph of your synthesized logic.
3.how it looks

    ![image alt](https://github.com/Divyagupta004dg/barrel_shifter_project/blob/master/Screenshot%20from%202025-06-18%2016-18-39.png?raw=true)
   


