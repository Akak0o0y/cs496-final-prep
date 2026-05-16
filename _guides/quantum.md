# 🎓 Ultimate Revision Guide — Quantum Computing (Module 1)

## Part 1: The Core Exam Questions (Tutorial Focus — 70%)

**Q1. What are qubits, and how do they work?**
- **Solution:** A qubit is the basic unit of quantum information. Unlike a classical bit (only 0 or 1), a qubit can be in a quantum state combining both basis states: **|ψ⟩ = α|0⟩ + β|1⟩**, where α and β are complex probability amplitudes. Four ideas drive qubits: **superposition, measurement, entanglement, interference**.
- **Professor's Note:** Tests fundamental qubit concept from **Slide 000 / 001**. P(0)=|α|², P(1)=|β|², |α|²+|β|²=1.

**Q2. What is superposition? What are its benefits?**
- **Solution:** Linear combination of basis states before measurement: |ψ⟩ = α|0⟩ + β|1⟩. Benefits: represents many computational paths at once, larger state space, enables interference so correct answers amplify and wrong ones cancel.
- **Professor's Note:** Slide 001. Superposition is NOT classical parallelism — it's useful only with interference + measurement.

**Q3. Explain qubit superposition using Dirac notation.**
- **Solution:** |ψ⟩ = α|0⟩ + β|1⟩; α, β complex; P(0)=|α|², P(1)=|β|²; normalization |α|²+|β|²=1. Example: H|0⟩ = (|0⟩+|1⟩)/√2; H|1⟩ = (|0⟩−|1⟩)/√2.
- **Professor's Note:** Slide 001/002. Know normalization rule + amplitude vs probability distinction.

**Q4. What is a quantum gate? Examples?**
- **Solution:** Reversible unitary operation preserving total probability. Examples: **X** (bit flip), **H** (superposition), **Z** (phase flip), **S, T** (phase rotations), **RX/RY/RZ** (Bloch rotations), **CNOT/CX**, **CZ**, **SWAP**, **CCX/Toffoli**.
- **Professor's Note:** Slide 002. Gate = unitary + reversible + probability-preserving.

**Q5. What is a quantum circuit? Examples?**
- **Solution:** Ordered sequence of gates, measurements, classical control. Examples: (1) |0⟩ → H → measure ≈ 50/50. (2) |00⟩ → H + CNOT → Bell state. (3) Teleportation: Bell pair + CNOT + H + measurement + X/Z corrections.
- **Professor's Note:** Slide 002.

**Q6. How is superposition implemented using gates?**
- **Solution:** Hadamard: H|0⟩ = (|0⟩+|1⟩)/√2; H|1⟩ = (|0⟩−|1⟩)/√2.
- **Professor's Note:** Slide 002.

**Q7. What is entanglement? How does it arise?**
- **Solution:** Joint quantum state of multiple qubits that cannot be decomposed into independent states. From interactions, common origins, or H + CNOT. No FTL communication — classical channel still required.
- **Professor's Note:** Slide 003.

**Q8. How is entanglement implemented using gates?**
- **Solution:** |00⟩ → H on q0 → (|00⟩+|10⟩)/√2 → CNOT(q0,q1) → (|00⟩+|11⟩)/√2 = **|Φ⁺⟩**.
- **Professor's Note:** Slide 003.

**Q9. Impact of adding CNOT after a Hadamard?**
- **Solution:** Turns one-qubit superposition into two-qubit entanglement. Measurement of one qubit determines the other.
- **Professor's Note:** Slide 003.

**Q10. Implication of entanglement for quantum networking?**
- **Solution:** Foundation of teleportation, QKD, quantum repeaters, distributed QC, eavesdropping detection. Cannot transmit info FTL; classical channel always needed.
- **Professor's Note:** Slide 003/004.

**Q11. Table of common quantum gates.**

| Gate | Purpose | Action | Qiskit |
|---|---|---|---|
| I | Identity | nothing | qc.id(0) |
| X | Bit flip | \|0⟩↔\|1⟩ | qc.x(0) |
| Y | Bit+phase | \|0⟩→i\|1⟩, \|1⟩→−i\|0⟩ | qc.y(0) |
| Z | Phase flip | \|1⟩→−\|1⟩ | qc.z(0) |
| H | Superposition | \|0⟩→\|+⟩ | qc.h(0) |
| S | π/2 phase | \|1⟩→i\|1⟩ | qc.s(0) |
| T | π/4 phase | \|1⟩→e^(iπ/4)\|1⟩ | qc.t(0) |
| P(θ) | General phase | \|1⟩→e^(iθ)\|1⟩ | qc.p(θ,0) |
| RX/RY/RZ | Bloch rotations | rotate axis | qc.rx(θ,0) |
| CX/CNOT | Controlled flip | flip target if ctrl=1 | qc.cx(0,1) |
| CZ | Controlled phase | flip phase if both=1 | qc.cz(0,1) |
| SWAP | Exchange | swap qubits | qc.swap(0,1) |
| CCX/Toffoli | CC-NOT | flip if 2 ctrls=1 | qc.ccx(0,1,2) |

**Q12. Experimentation with gate sequences.**
- **Solution:** (1) HH = I. (2) X then H = |−⟩. (3) H then Z flips |+⟩ to |−⟩. (4) H+CNOT = Bell. (5) Measure before CNOT destroys superposition.
- **Professor's Note:** Slide 002. Gate ORDER matters.

**Q13. Initial state and why we need gates?**
- **Solution:** Start in |0⟩ = [1,0]ᵀ or |1⟩ = [0,1]ᵀ. Gates transform into superposition/entangled state.

**Q14. Why must quantum gates be reversible and preserve amplitude?**
- **Solution:** Unitary evolution. Must preserve |α|²+|β|²=1 and be reversible (no info loss).

**Q15. Explain X gate on |0⟩ and |1⟩.**
- **Solution:** X = [[0,1],[1,0]]. X|0⟩=|1⟩; X|1⟩=|0⟩.

**Q16. Why is it difficult to send a qubit state directly on a network?**
- **Solution:** **Decoherence**, **measurement collapse**, **no-cloning theorem**. Classical read/copy/amplify fail on unknown qubits.
- **Professor's Note:** Slide 004.

**Q17. Solution? Describe in detail.**
- **Solution:** **Quantum teleportation**. (1) Alice has |ψ⟩=α|0⟩+β|1⟩. (2) Alice & Bob share Bell pair. (3) Alice applies CNOT(ψ,A) then H(ψ). (4) Measures both → 2 cbits. (5) Sends bits classically. (6) Bob applies: X if c1=1, Z if c0=1.

**Q18. What is quantum teleportation?**
- **Solution:** Transfer of unknown state from one qubit to a distant one. Not physical transport. Bell pair = shared entangled resource. Alice's measurement projects to one of 4 cases; 2 cbits tell Bob the correction.

**Q19. Describe the teleportation circuit.**
- **Solution:** 3 qubits: q0=|ψ⟩, q1=Alice Bell-half, q2=Bob Bell-half. Steps: H(q1), CX(q1,q2) → Bell. CX(q0,q1), H(q0). Measure q0→c0, q1→c1. If c1=1 apply X(q2); if c0=1 apply Z(q2).

**Q20. Major factor behind teleportation success?**
- **Solution:** **Pre-shared entanglement** (the Bell pair).

**Q21. Describe Shor's algorithm and its improvement over classical.**
- **Solution:** Reduces factoring to **period finding** of f(x)=aˣ mod N. Quantum finds period r; classical: gcd(a^(r/2)±1, N). **Exponential speedup**; threatens RSA.
- **Professor's Note:** Slide 005.

**Q22. Role of Fourier Transform in Shor?**
- **Solution:** **QFT** extracts hidden period from amplitudes. Periodic structure → measurable peaks at multiples of Q/r. Continued fractions → r.

**Q23. How does a developer define his own gates in Qiskit?**
- **Solution:** (1) Build sub-circuit, call `.to_gate()`. (2) Define unitary via `UnitaryGate(matrix)`. Append with `qc.append(gate, qubits)`.

**Q24. Describe Shor's circuit in detail.**
- **Solution:** (1) Choose N, a coprime to N. (2) First register |0...0⟩, H gates → uniform superposition. (3) Second register |1⟩. (4) Controlled modular exp: |x⟩|1⟩→|x⟩|aˣ mod N⟩. (5) Inverse QFT. (6) Measure. (7) Continued fractions → r → gcd.

**Q25. Describe Grover's algorithm.**
- **Solution:** Search unsorted N-space in O(√N). (1) H on all → equal superposition. (2) Oracle marks target by phase flip. (3) Diffuser amplifies marked amplitude. (4) Repeat ~√N times. (5) Measure.

**Q26. Major factor behind Grover's success?**
- **Solution:** **Amplitude amplification through quantum interference**.

**Q27. Describe Grover's circuit.**
- **Solution:** (1) H on all = superposition. (2) Oracle U_f = phase flip on marked. (3) Diffuser via H/X/multi-CZ/X/H = reflection about average. (4) Measure. Repeat **⌊(π/4)√N⌋** times.

**Q28. First discovery leading to quantum mechanics?**
- **Solution:** **Planck's 1900 quantum hypothesis**: energy in discrete packets.

**Q29. Describe four quantum principles and their impacts.**
- **Superposition**: α|0⟩+β|1⟩ → large state space.
- **Coherence**: stable phase relationships → enables superposition; loss = decoherence.
- **Interference**: amplitudes combine constructively/destructively.
- **Entanglement**: linked qubits → Bell states, teleportation.

**Q30. Qubit state in Dirac notation; components; coefficients?**
- **Solution:** |ψ⟩=α|0⟩+β|1⟩. α, β complex; |α|²+|β|²=1. Amplitudes ≠ probabilities; square the magnitudes.

**Q31. Radian angle representation (Bloch sphere)?**
- **Solution:** **|ψ⟩ = cos(θ/2)|0⟩ + e^(iφ) sin(θ/2)|1⟩**. θ = polar angle. φ = relative phase.

**Q32. How a qubit goes into superposition (Qiskit)?**
- **Solution:** `qc.h(0)`.

**Q33. Two major superposition states from Hadamard?**
- **Solution:** H|0⟩ = |+⟩; H|1⟩ = |−⟩.

**Q34. Hadamard matrix and computation; Bloch positions?**
- **Solution:** H = (1/√2)[[1,1],[1,−1]]. |0⟩=+Z, |1⟩=−Z, |+⟩=+X, |−⟩=−X.
- **WARNING:** |1⟩=[0,1]ᵀ NOT [1,0]ᵀ.

**Q35. Purpose and limitations of measurement gate?**
- **Solution:** Converts quantum → classical (0/1) by probabilities. Limitations: collapses state, one shot insufficient, probabilistic, destroys superposition/entanglement.

**Q36. What is entanglement and how implemented?**
- **Solution:** |00⟩ → H(q0) → CNOT(q0,q1) → (|00⟩+|11⟩)/√2.

**Q37. Role of CNOT in entanglement?**
- **Solution:** Two-qubit gate that flips target if control=|1⟩. With control in superposition, CNOT correlates them → entanglement.

**Q38. Entanglement circuit outputs (H then CNOT, all initial states):**

| Initial | After H on control | After CNOT | Bell state |
|---|---|---|---|
| \|00⟩ | (\|00⟩+\|10⟩)/√2 | (\|00⟩+\|11⟩)/√2 | **Φ⁺** |
| \|01⟩ | (\|01⟩+\|11⟩)/√2 | (\|01⟩+\|10⟩)/√2 | **Ψ⁺** |
| \|10⟩ | (\|00⟩−\|10⟩)/√2 | (\|00⟩−\|11⟩)/√2 | **Φ⁻** |
| \|11⟩ | (\|01⟩−\|11⟩)/√2 | (\|01⟩−\|10⟩)/√2 | **Ψ⁻** |

**Q39. Multi-qubit product states and the exception?**
- **Solution:** Combined state = tensor product. **Exception**: entangled states cannot be factored.

**Q40. Compute entanglement circuit output via unitaries.**
- **Solution:** |00⟩ → H⊗I → (|00⟩+|10⟩)/√2 → CNOT → (|00⟩+|11⟩)/√2 = |Φ⁺⟩.

**Q41. Qiskit entanglement experiment.**
- **Solution:** Compare (a) H only — q0 random, q1 fixed; (b) H+CNOT — only 00 and 11.

**Q42. Vector representations of |0⟩ and |1⟩?**
- **Solution:** |0⟩=[1,0]ᵀ, |1⟩=[0,1]ᵀ.

**Q43. Hadamard transformations of |0⟩ and |1⟩?**
- **Solution:** H|0⟩=|+⟩; H|1⟩=|−⟩.

**Q44. What are α and β in the superposition expression?**
- **Solution:** α=amplitude of |0⟩, β=amplitude of |1⟩. For H|0⟩: α=β=1/√2. For H|1⟩: α=1/√2, **β=−1/√2**.

**Q45. What are Bell states and their significance?**
- **|Φ⁺⟩** = (|00⟩+|11⟩)/√2
- **|Φ⁻⟩** = (|00⟩−|11⟩)/√2
- **|Ψ⁺⟩** = (|01⟩+|10⟩)/√2
- **|Ψ⁻⟩** = (|01⟩−|10⟩)/√2

**Q46. CNOT truth table:**

| Ctrl in | Tgt in | Ctrl out | Tgt out |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 1 | 0 |

**Q47. Teleportation vs classical messaging?**
- **Solution:** Teleportation: Bell pair + 2 cbits; original destroyed. Classical: bits can be copied/inspected; quantum cannot (no-cloning).

**Q48. Setup needed for Anas↔Badr teleportation; third party?**
- **Solution:** Pre-shared **Bell pair** + classical channel. Third party can prepare/distribute Bell pairs.

**Q49. Significance of teleportation for quantum networking?**
- **Solution:** Move quantum states across distance despite no-cloning. Basis for repeaters, **quantum internet**.

**Q50. Circuit diagram — Anas teleporting to Badr without copying.**
- **Solution:** Anas: CX(q0,q1), H(q0), measure both. Sends c0, c1 classically. Badr: X if c1=1, Z if c0=1.

**Q51. Task in phase one of teleportation; impact?**
- **Solution:** Create/share Bell pair via H + CNOT. Combined state entangled — inseparable.

**Q52. Roles of X and Z in final phase?**
- **Solution:** X = bit-flip correction; Z = phase-flip correction. Rule: **c1=1 → X**, **c0=1 → Z**.

**Q53. Measurement results and how transferred?**
- **Solution:** 4 outcomes (00, 01, 10, 11) sent via classical channel. 00→I, 01→X, 10→Z, 11→XZ.

---

## Part 2: The "Zero Gaps" Knowledge Base (Slide Focus — 30%)

### Slide 000 — Course Overview
- Classical bit = definite 0 or 1; **Qubit** = superposition unit.
- |ψ⟩ = α|0⟩ + β|1⟩; P(0)=|α|², P(1)=|β|², |α|²+|β|²=1.
- **Exam trap:** Quantum computers are NOT fast via classical parallelism.

### Slide 001 — Principles and Roots
- **Quantization**, **Uncertainty** (Heisenberg), **Coherence**, **Decoherence**.
- Wave parameters: amplitude, wavelength, frequency, **phase**.
- **Quantum interference**: complex amplitudes reinforce/cancel.
- Timeline: Planck 1900 → QM 1920s → EPR → Feynman → Deutsch → Shor → Grover → modern hardware.
- IBM Eagle = 127 qubits.

### Slide 002 — Quantum Gates and Operators
**Gate matrices to memorize:**
- **I** = [[1,0],[0,1]]
- **X** = [[0,1],[1,0]]
- **Y** = [[0,−i],[i,0]]
- **Z** = [[1,0],[0,−1]]
- **H** = (1/√2)[[1,1],[1,−1]]
- **S** = [[1,0],[0,i]]
- **T** = [[1,0],[0,e^(iπ/4)]]
- **P(φ)** = [[1,0],[0,e^(iφ)]]
- **CNOT** = [[1,0,0,0],[0,1,0,0],[0,0,0,1],[0,0,1,0]]
- **CZ** = diag(1,1,1,−1)
- **SWAP** = [[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]]

**Bloch sphere** for ONE qubit only. H = π rotation around axis halfway between X and Z. SWAP = 3 CNOTs. Toffoli = reversible AND/NAND.

### Slide 003 — Entanglement & Bell States
- **n-qubit uniform superposition**: H^⊗n |0...0⟩ = (1/√2ⁿ) Σ |x⟩
- Product state can be factored; **entangled cannot**.
- **CRITICAL CORRECTION**: CNOT flips target when control = |1⟩.
- **No-communication theorem**: Bell correlations cannot transmit info FTL.

### Slide 004 — Quantum Teleportation
- Transfers |ψ⟩=α|0⟩+β|1⟩ using shared Bell pair + 2 cbits.
- **Correction table**: 00→I, 01→X, 10→Z, 11→XZ.
- **No-cloning preserved**: original destroyed by measurement.

### Slide 005 — Shor's Algorithm
- **Steps**:
  1. Pick a coprime to N.
  2. f(x) = aˣ mod N; find period r.
  3. If r odd → restart.
  4. If r even: x = a^(r/2) mod N.
  5. If x+1 ≡ 0 mod N → restart.
  6. Factors: gcd(x+1, N) and gcd(x−1, N).
- **N=15 example**: a=2; r=4; gcd(3,15)=3, gcd(5,15)=5.
- Speedup: O((log N)³).

### Slide 006 — Quantum Fourier Transform (QFT)
- **QFT**: |k⟩ → (1/√N) Σⱼ e^(2πi·kj/N) |j⟩
- **Components**: Hadamard + Controlled-Rₖ + SWAPs.
- **Complexity**: ≈ **O(n²)** gates.
- **One-qubit**: ℱ|0⟩ = (|0⟩+|1⟩)/√2; ℱ|1⟩ = (|0⟩−|1⟩)/√2.

### Slide 007 — Grover's Algorithm
- Search N=2ⁿ: classical O(N), Grover **O(√N)** — quadratic speedup.
- **Oracle**: O|x⟩ = −|x⟩ if marked; else |x⟩.
- **Diffusion**: D = 2|ψ₀⟩⟨ψ₀| − I.
- Iterations ≈ **(π/4)√N**.

### Slide 008 — Deutsch-Jozsa Algorithm
- **Promise**: f is constant or balanced.
- Classical worst case: 2^(n−1)+1 queries; Quantum: **1 query**.
- **Rule**: All-zeros → constant. Anything else → balanced.

### Slide 009 — Quantum Ripple Adder
- Classical full adder:
  - Sᵢ = Aᵢ ⊕ Bᵢ ⊕ Cᵢ
  - C_(i+1) = (Aᵢ ∧ Bᵢ) ∨ (Cᵢ ∧ (Aᵢ ⊕ Bᵢ))
- Gates: CNOT (XOR), Toffoli (AND), X (set).
- **3-bit circuit**: 13 qubits, depth 16, 30 gates.

### Key Terms
**Qubit, Amplitude, Superposition, Measurement, Coherence, Decoherence, Entanglement, Tensor product, Unitary, Hadamard, Pauli-X/Z, Phase gate, CNOT, Toffoli, Bell state, No-cloning theorem, Teleportation, Oracle, Phase kickback, QFT, Period r, Diffusion operator, Amplitude amplification, Ripple carry.**

---

## Part 3: Rapid Recall Quiz

**Q1.** Starting from |10⟩, applying H to the first qubit, then CNOT (q0 control, q1 target), yields which Bell state?
A) |Φ⁺⟩  B) |Φ⁻⟩  C) |Ψ⁺⟩  D) |Ψ⁻⟩

**Q2.** In quantum teleportation, Alice measures (c0, c1) = (1, 1). What correction must Bob apply?
A) Identity  B) X only  C) Z only  D) X and Z

**Q3.** For Shor's algorithm with N=21 and a=2, what is the period r?
A) 2  B) 4  C) 6  D) 12

**Q4.** For Grover's algorithm searching N=16 items, optimal iterations:
A) 2  B) 3  C) 4  D) 8

**Q5.** In Deutsch-Jozsa, after final H gates, you measure `010`. What can you conclude?
A) constant 0  B) constant 1  C) balanced  D) insufficient info

### Answer Key
1. **B** — H on |1⟩ → (|0⟩−|1⟩)/√2; CNOT → (|00⟩−|11⟩)/√2 = **|Φ⁻⟩**.
2. **D** — c1=1 ⇒ X; c0=1 ⇒ Z.
3. **C** — 2⁶ = 64 ≡ 1 mod 21, so **r = 6**.
4. **B** — (π/4)√16 ≈ 3.14 → **3 iterations**.
5. **C** — Nonzero ⇒ **balanced**.
