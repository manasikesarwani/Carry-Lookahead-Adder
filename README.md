# 32-bit Carry Lookahead Adder (CLA) using SystemVerilog

## Overview

This project implements a hierarchical **32-bit Carry Lookahead Adder (CLA)** in **SystemVerilog**. The design is built using a modular approach, where smaller CLA blocks are combined to construct larger adders. This significantly reduces carry propagation delay compared to a Ripple Carry Adder.

## Features

- Hierarchical modular design
- 4-bit Carry Lookahead Generator (BCLG)
- 4-bit CLA
- 16-bit CLA
- 32-bit CLA
- Independent testbenches for each module
- Simulated using Icarus Verilog / EDA Playground

---

## Project Structure

```
32-bit-CLA/
│
├── bclg04.sv        // 4-bit Carry Lookahead Generator
├── cla04.sv         // 4-bit Carry Lookahead Adder
├── cla16.sv         // 16-bit Carry Lookahead Adder
├── cla32.sv         // 32-bit Carry Lookahead Adder
│
├── tb_cla04.sv      // Testbench for 4-bit CLA
├── tb_cla16.sv      // Testbench for 16-bit CLA
├── tb_cla32.sv      // Testbench for 32-bit CLA
│
└── README.md
```

---

# Design Hierarchy

The design follows a hierarchical structure:

- `bclg04` generates carries within a 4-bit block.
- `cla04` uses the carry generator to perform 4-bit addition.
- Four `cla04` modules are combined to create a 16-bit CLA.
- Two `cla16` modules are combined to create the final 32-bit CLA.

---

# Module Description

## 1. bclg04.sv

Implements the **4-bit Carry Lookahead Generator**.

### Inputs

- `P` – Propagate signals
- `G` – Generate signals
- `Cin` – Carry input

### Outputs

- Internal carry signals
- Group Propagate (`pout`)
- Group Generate (`gout`)
- Carry Out (`Cout`)

This module computes carries using carry lookahead equations instead of ripple propagation.

---

## 2. cla04.sv

Implements a **4-bit Carry Lookahead Adder**.

Operations performed:

- Computes bit propagate signals

```
P = A XOR B
```

- Computes bit generate signals

```
G = A AND B
```

- Uses `bclg04` to generate carries.
- Produces the 4-bit sum.

Outputs:

- Sum
- Group Propagate
- Group Generate
- Carry Out

---

## 3. cla16.sv

Constructed using:

- Four `cla04` modules
- One `bclg04` acting as the group carry generator

Each 4-bit CLA generates:

- Group Propagate
- Group Generate

The group carry generator computes carries between the four 4-bit blocks.

Outputs:

- 16-bit Sum
- Carry Out
- Group Propagate
- Group Generate

---

## 4. cla32.sv

Constructed using:

- Two `cla16` modules

The carry into the upper 16-bit block is calculated using the group propagate and group generate signals produced by the lower 16-bit block.

Carry equations used:

```
C1 = G0 + P0·Cin

Cout = G1 + P1·G0 + P1·P0·Cin
```

Outputs:

- 32-bit Sum
- Final Carry Out

---

# Tools Used

- SystemVerilog
- EDA Playground

---

# Advantages of Carry Lookahead Adder

Compared to a Ripple Carry Adder:

- Faster carry computation
- Reduced propagation delay
- Better scalability for larger adders
- Suitable for high-speed digital systems

---

# Author

**Manasi Kesarwani**

MIT Manipal B.Tech Electronics and Communication Engineering
MIT Manipal# Carry Lookahead Adder
Hierarchical Carry Lookahead Adder in SystemVerilog.
