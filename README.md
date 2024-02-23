# Embedded System VHDL LAB Assignment

This repository contains the VHDL code and their testbench. The testbench can be visualized by the gtkwave tool.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Cloning the Repository](#cloning-the-repository)
  - [Installing GHDL](#installing-ghdl)
  - [Installing GTKWave](#installing-gtkwave)

## Prerequisites

Ensure you have the following software installed on your system and choose any text-editor as you prefer.

- ghdl
- gtkwave

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/apar-sharma/ES_Lab.git
```

### Installing GHDL

Follow the instructions on the [GHDL GitHub repository](https://github.com/ghdl/ghdl) to install GHDL on your system.

### Linux

```bash
    sudo apt install ghdl
```

### Installing GTKWave

Follow the instructions on the [GTKWave website](http://gtkwave.sourceforge.net/) to install GTKWave on your system.

```bash
    sudo apt install gtkwave
```

This will install the required GTKWave GUI which can be opened directly from the terminal.

## Analyzing, Elaborating and Running

Here we have to the write the different test bench code so that we can produce the result.vcd file from these test benches which can be visualized using gtkwave tool.

Try this command in the terminal if there is an error running the Makefile.

```bash
# Example command for running GHDL
ghdl -a your_vhdl_code.vhd
ghdl -a your_test_bench.vhd
ghdl -e your_test_bench
ghdl -r your_test_bench --vcd=result.vcd --stop-time=10us
```

```bash
# Example command for GTKWave
gtkwave result.vcd
```

## Conclusion

By following above instructions we can configure our machine for the VHDL and GTKWave tool. Different testcases can be added and tested as needed from the testbench. Also the time constraint can be changed accordingly. Inside the makefile during the runnning of the testbench the `--stop-time` should be configured depending upon the program execution time to see the proper result.
