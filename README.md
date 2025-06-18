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
   

4. FLOW OF TCL SHOULD BE SET IT GIVES MAJOR STEPS AUTOMATICALLY:
   
   i.e(flow.tcl -design barrel_shifter_project)
   
Step	Stage	Description

0	Verilog Linting:	Checks syntax, structure of your .v file using Verilator.

1	Synthesis:	Converts Verilog to gate-level netlist using Yosys.

2	Floorplanning:	Places core area, macros, and IO pins.

3	Placement:	Places standard cells physically on chip.

4	Clock Tree Synthesis:	Builds clock distribution network.

5	Routing:	Connects wires between gates physically.

6	DRC/LVS: Checks	Checks layout rules (DRC) and compares layout vs netlist (LVS).

7	GDSII Generation:	Creates the final chip layout file (.gds).

8	Reports and Exports:	Generates timing, area, power, and saves final layout/netlist.

#IN TERMINAL BASH

inside OpenLane container:
```bash
cd ~/OpenLane
make mount
Then the prompt becomes:
OpenLane Container (1.1.1):/openlane%
again bash:
cd designs/barrel_shifter_project
flow.tcl -design barrel_shifter_project




