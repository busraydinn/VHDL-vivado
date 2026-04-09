# Half Adder (VHDL)

This project implements a **Half Adder** using VHDL. It is one of the fundamental building blocks in digital design.

## 🛠️ Tools & Technologies
- Tool: Vivado
- Language: VHDL

## 📌 Description
A Half Adder performs the addition of two single-bit binary inputs.

### Inputs
- **A**
- **B**

### Outputs
- **Sum** = A XOR B
- **Carry** = A AND B

## 📊 Truth Table

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

## 📁 Project Structure
```
│── HalfAdder.vhd
│── tb_HalfAdder.vhd
│── README.md
```
## ▶️ Simulation
The design is verified using a testbench that applies all possible input combinations.

Simulation steps:
1. A = 0, B = 0
2. A = 0, B = 1
3. A = 1, B = 0
4. A = 1, B = 1
