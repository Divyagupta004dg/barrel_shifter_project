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

![Image](https://github.com/user-attachments/assets/e0786237-6c73-4169-9452-96d92b48c54d)

**🔹 Yosys (Synthesis Tool)**

    Input: RTL (Verilog)

    Output: Gate-level netlist (.v)

    Used in: Logic Synthesis 


**4. FLOW OF TCL SHOULD BE SET IT GIVES MAJOR STEPS AUTOMATICALLY**

   
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

**🔹 OpenLane**

    Wrapper for entire flow (synthesis → GDSII)

    Automates each step using:

        Yosys (synthesis)

        OpenROAD (placement, CTS, routing)

        Magic, Netgen, KLayout

    You run this inside Docker

    Used in: Almost every step post-RTL



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
```

**🔹 Magic (Layout Tool)**

    Visual & DRC tool

    Used for:

        Viewing .def, .mag files (Step 2-5)

        Doing DRC (Design Rule Check)

    Also used to extract layout netlist for LVS


**🔹 KLayout (GDSII Viewer)**

    Viewer for .gds layout file

    Best for:

        Final layout inspection

        3D visualization (with plugin) also in floorplan

    Used in: Step 7(Final layout export)

**5.FLOORPLAN LAYOUT**
MAGIC 
![Image](https://github.com/user-attachments/assets/a7038650-0005-459c-a066-9aed300188d5)
![Image](https://github.com/user-attachments/assets/830bbcc0-be07-4d0a-bca9-e1d90fd13ece)
KLAYOUT
![Image](https://github.com/user-attachments/assets/066dd69b-f00c-42ab-a930-c76ded7a7e0f)
![Image](https://github.com/user-attachments/assets/066dd69b-f00c-42ab-a930-c76ded7a7e0f)
