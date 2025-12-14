# Identification of Stuck-At Faults in a Full Adder Using BIST

##  Overview
This project implements a **Built-In Self-Test (BIST)** architecture to detect **stuck-at-0 (SA0)** and **stuck-at-1 (SA1)** faults in a ** Full Adder**.  
The design integrates **on-chip test pattern generation, expected result computation, response comparison, and fault indication**, eliminating the need for external test equipment.

---

##  Objectives
- Detect stuck-at faults in full adder inputs and outputs
- Reduce dependence on external Automated Test Equipment (ATE)
- Achieve high fault coverage using BIST
- Implement a scalable and cost-effective testing approach
- Verify functionality using simulation

---

##  Key Concepts
- Built-In Self-Test (BIST)
- Stuck-At Fault Model (SA0 / SA1)
- Linear Feedback Shift Register (LFSR)
- Comparator-based response analysis
- RTL & Gate-level modeling in Verilog

---

##  Architecture
The BIST system consists of the following blocks:

1. **Test Pattern Generator (TPG)** – 3-bit LFSR  
2. **Circuit Under Test (CUT)** – 1-bit Full Adder  
3. **Expected Result Generator**  
4. **Comparator**  
5. **Fault Indicator**

