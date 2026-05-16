# 🎓 Ultimate Revision Guide — Blockchain (Module 3)

## Part 1: The Core Exam Questions (Tutorial Focus — 70%)

### Tutorial 3.1 — Blockchain Basics

**Q1. Motivation and purpose for building Bitcoin?**
- **Solution:** Pure P2P electronic cash without banks or trusted institutions. Solves the **double-spending problem** via digital signatures, P2P network, timestamps, hashing, and **proof-of-work**.
- **Professor's Note:** Slide 021. Innovation = *combining* P2P + cryptography + distributed ledger + PoW + incentives.

**Q2. Complex adaptive properties of Bitcoin?**
- **Solution:** Decentralization, self-organization, emergent consensus, adaptation via difficulty adjustment, incentives, robustness, feedback loops (miners, users, price, hash power, difficulty).

**Q3. Decentralized vs distributed?**
- **Solution:** Distributed = computation/data spread across machines (where). Decentralized = control not held by one authority (who). Bitcoin is **both**.

**Q4. How decentralization achieved in Bitcoin?**
- **Solution:** P2P network, open participation, independent full-node verification, PoW, public rules, longest-chain rule. Miners propose; full nodes enforce.

**Q5. How Bitcoin works — overview?**
- **Solution:** Wallets hold keys → tx spends **UTXOs** → sign → broadcast P2P → nodes validate/relay → miners search nonce so `double-SHA-256(header) < target` → winner broadcasts → nodes verify and append.

**Q6. Cryptographic hash functions and their role?**
- **Solution:** Map any input to fixed-size output. Deterministic, fast, one-way, collision-resistant, avalanche. In Bitcoin: link blocks, Merkle root, PoW, tamper-evidence. Uses **SHA-256** (twice for headers).

**Q7. Role of public-key cryptography?**
- **Solution:** Ownership/authorization. Private key signs; public key verifies; address (hash of PK) receives.

**Q8. How digital signatures work?**
- **Solution:** Hash tx data → sign hash with private key → include sig + public key. Validators recompute hash and verify sig with PK.

**Q9. Structure of the Bitcoin ledger?**
- **Solution:** Append-only chain. Each block = header + transactions. Header includes prev block hash + Merkle root. **UTXOs**, not balances. Balance = sum of own UTXOs.

**Q10. Links between blocks?**
- **Solution:** Each block stores **double-SHA-256 of previous header**. Modifying any old block invalidates all subsequent PoW.

**Q11. What is a Merkle tree?**
- **Solution:** Binary hash tree combining tx hashes pairwise until one root remains: the **Merkle root** in the header. Enables efficient inclusion proofs (SPV).

**Q12. Build Merkle tree + prove inclusion?**
- **Solution:** H12 = H(H(T1) ‖ H(T2)), H34 = H(H(T3) ‖ H(T4)), Hroot = H(H12 ‖ H34). To prove T2 included, provide T2, H(T1), H34 → verifier recomputes Hroot.

**Q13. Structure of a Bitcoin transaction?**
- **Solution:** Inputs + outputs + metadata (version, locktime). Input = pointer to prev UTXO + unlocking script. Output = amount + locking script.

**Q14. Payment example — what's peculiar?**
- **Solution:** Alice's 1 BTC UTXO → 0.3 BTC to Bob + ~0.6999 change. Fee ≈ 0.0001. Peculiar: Bitcoin **doesn't subtract from balance**; it consumes whole UTXOs.

**Q15. Transaction validation?**
- **Solution:** Inputs reference existing UTXOs; sigs/scripts valid; authorized; input ≥ output; no double-spend; format ok.

**Q16. P2PKH validation script?**
- **Solution:** Locking: `OP_DUP OP_HASH160 <pkHash> OP_EQUALVERIFY OP_CHECKSIG`. Unlocking: `<sig> <pk>`.

**Q17. Bitcoin block structure?**
- **Solution:** Magic (4B) | Size (4B) | **Header (80B)** | Tx count (1–9B VarInt) | Txs. Header: Version (4B), prev hash (32B), Merkle root (32B), timestamp (4B), bits (4B), nonce (4B). First tx = coinbase.

**Q18. What is mining and its purpose?**
- **Solution:** Build candidate blocks, hash header with varying nonces until hash < target. Secures consensus, decides next appender, makes rewriting expensive, regulates timing, issues new BTC + fees.

**Q19. Mining process and challenge?**
- **Solution:** Collect tx → coinbase → Merkle root → header → vary nonce until **double-SHA-256 < target**. Retargets every **2016 blocks** (~14 days). `target = 2^(256 − bits)`.

**Q20. Genesis Block?**
- **Solution:** Block 0, created by Satoshi Jan 2009. Prev hash = all zeros.

### Tutorial 3.2 — Ethereum

**Q1. Practical definition of Ethereum?**
- **Solution:** Decentralized programmable blockchain — global replicated state machine; smart contracts run on **EVM**. ETH = gas + value.

**Q2. Why "Decentralized World Computer"?**
- **Solution:** Code/state replicated; EVM executes deterministically; anyone deploys/calls; consensus agrees on results.

**Q3. Ethereum vs traditional web?**
- **Solution:** Traditional = client-server + company backend. Ethereum DApps = smart-contract backend, wallet identity, blockchain state, gas-paid tx. Transparent but slower/costlier.

**Q4. Ethereum ecosystem?**
- **Solution:** Users/wallets, EOAs, contract accounts, tx/messages, smart contracts, EVM, execution clients, consensus clients/validators, P2P, mempools, blockchain/state DBs, JSON-RPC, DApp frontends, Solidity.

**Q5. What is the EVM?**
- **Solution:** Deterministic sandboxed runtime executing compiled bytecode. **Gas-metered**.

**Q6. Ethereum account types?**
- **Solution:** **EOA** (key-controlled, no code, *initiates* tx). **Contract Account** (code-controlled, has storage, only executes when called). Both have addresses. State fields: **nonce, balance, storageRoot, codeHash**.

**Q7. Impact of EOA → contract message?**
- **Solution:** Activates contract code in EVM. May change storage, transfer ETH, emit events, call others, or revert.

**Q8. Purpose of EOA-to-EOA message?**
- **Solution:** Value transfer (ETH) only.

**Q9. Ethereum transaction structure?**
- **Solution:** **nonce** (replay protection), **to**, **value**, **data/input**, **gas limit**, **gas pricing** (legacy `gasPrice` OR EIP-1559 `maxFeePerGas` + `maxPriorityFeePerGas`), **chain ID**, **v, r, s** (signature).

**Q10. Components of a full node?**
- **Solution:** Ethereum client (EVM + mempool + client process + JSON-RPC API) + blockchain DB. Post-Merge: execution client + consensus client + validator client.

**Q11. Node types?**
- **Solution:** Course: full + mining. Modern: full, archive, light, validator.

**Q12. Journey of a transaction?**
- **Solution:** DApp signs → JSON-RPC → execution client validates → mempool → gossip → block producer → EVM executes → block proposed → nodes re-execute → finalized → receipt available.

**Q13. Ethereum PoW (historical)?**
- **Solution:** **Ethash** (Dagger-Hashimoto). Header + nonce + **DAG** (~1 GB, updates every 30,000 blocks = 1 epoch ≈ 125h). Memory-hard. **Merge: 15 Sep 2022**.

**Q14. Ethereum PoS?**
- **Solution:** Stake **32 ETH**. **RANDAO** selects proposers in **12-s slots** (32 slots = 1 epoch ≈ 6.4 min). Committees **attest**. **LMD-GHOST** = fork choice; **Casper FFG** = finality (≥2/3 stake). **Gasper = LMD-GHOST + Casper FFG**. Dishonest validators **slashed**.

**Q15. Ethereum layered architecture?**
- **Solution:** App (DApps, wallets) → API (JSON-RPC) → Execution (EOAs, contracts, EVM, gas, world state) → Data (blocks, receipts, tries) → Consensus (validators, attestations, fork choice, finality) → P2P.

### Tutorial 3.3 — Smart Contracts, DApps & Solana

**Q1. Definition of smart contract?**
- **Solution:** Program code at a contract account. Address, bytecode, storage, balance, functions. Called via tx; EVM executes deterministically on every node.

**Q2. Ordinary tx vs smart contract interaction?**
- **Solution:** EOA→EOA mainly transfers ETH. Smart-contract interaction sends data → triggers code → may update storage, emit events, transfer tokens. Deployment = special tx with no `to`, bytecode in `data`.

**Q3. How smart contracts are validated?**
- **Solution:** Deterministic re-execution. Tx valid only if resulting state root matches block's. On revert, state undone but gas consumed.

**Q4. Steps to deploy a smart contract?**
- **Solution:** Write Solidity → compile to **EVM bytecode + ABI** → creation tx (no `to`, bytecode in `data`) → sign → pay gas, broadcast → validators include → EVM runs **constructor** → new contract address → users call via ABI.

**Q5. Pseudocode example?**
```
contract SimpleVault {
  owner = message.sender
  balance = 0
  function deposit(amount): require(amount > 0); balance += amount
  function withdraw(amount):
    require(message.sender == owner)
    require(balance >= amount)
    balance -= amount; send(owner, amount)
}
```

**Q6. What are DApps?**
- **Solution:** Apps whose core logic/state runs in smart contracts. Frontend + wallet + smart-contract backend + blockchain storage + optional indexing.

**Q7. DApps vs ordinary apps?**
- **Solution:** Ordinary = centralized servers/DBs. DApps = wallet sigs, smart contracts, consensus, transparent state, gas. Pros: censorship-resistant, auditable. Cons: slower, less private, costlier, immutable.

**Q8. Emerging blockchain systems and advantages?**
- **Solution:** PoS, PoH, sharding, parallel execution, ZK, bridges, modular. Higher throughput, lower fees, faster finality, lower energy, interoperability.

**Q9. Describe Solana?**
- **Solution:** High-performance public blockchain. **PoS + PoH**. Scheduled leader produces entries/blocks; validators verify and vote via **Tower BFT**.

**Q10. How blocks validated in Solana?**
- **Solution:** Tx into **PoH sequence** → leader produces block → validators verify PoH, sigs, accounts, execute tx, cast **stake-weighted votes** via Tower BFT → ≥2/3 finalizes.

**Q11. Solana's PoS in detail?**
- **Solution:** Stake-weighted. SOL holders **delegate**. More stake = more weight + higher chance in **leader schedule**. Rewards to validators + delegators. ≥2/3 supermajority. **Superminority** = 21 validators >33%.

**Q12. What is Proof-of-History?**
- **Solution:** Continuous SHA-256 chain; each output feeds the next. Proves order + elapsed time. Pre-orders tx → less validator chatter → faster finality. **Doesn't replace consensus.**

**Q13. Solana's TPS?**
- **Solution:** ~**65,000 TPS** (course number).

---

## Part 2: The "Zero Gaps" Knowledge Base (Slide Focus — 30%)

### Slide 021 — Blockchain Overview
- Origin: Satoshi 2008 paper; Bitcoin Jan 2009.
- **Magic number** = `0xD9B4BEF9`.
- **Block layout**: Magic (4B) | Size (4B) | Header (80B) | Tx count (1–9B) | Txs.
- **Header**: Version (4B) | hashPrevBlock (32B) | hashMerkleRoot (32B) | Time (4B) | Bits (4B) | Nonce (4B).
- **Emergent consensus** — 4 processes: independent tx verification, miner PoW aggregation, independent block verification, longest-chain acceptance.
- **Tx lifecycle** (10 steps): generate → sign → broadcast → verify+propagate → miners pack → mining → PoW competition → broadcast winner → verify → added.

### Slide 022 — Bitcoin PoW
- **Mining algorithm**:
  1. Collect valid tx
  2. Build coinbase tx (reward + fees)
  3. Build Merkle root
  4. Fill header (nonce=0)
  5. `hash = SHA-256(SHA-256(header))`
  6. If `hash < target` → broadcast; else increment nonce. If exhausted: change extra-nonce / timestamp, rebuild Merkle root.
- **Target**: `target = 2^(256 − difficulty_bits)`.
- **Adjustment**: every **2016 blocks** (~14 days).
- Each added bit ≈ doubles work.

```python
def proof_of_work(header, bits):
    target = 2 ** (256 - bits)
    for nonce in range(max_nonce):
        h = hashlib.sha256(str(header)+str(nonce)).hexdigest()
        if int(h, 16) < target:
            return (h, nonce)
```

### Slide 023 — How Bitcoin Works
- **UTXO model**. Inputs consume; outputs create. **Change** + **fee** (slide: 0.55 in, 0.50 out → 0.05 fee).
- **Wallet** chooses inputs, builds outputs, signs.
- **Depth** vs **height**: depth = confirmations after (security); height = position from genesis.

### Slide 024 — Ethereum How It Works
- **History**: Vitalik WP 2014, launched 2015.
- **Account state**: nonce, balance (Wei), storageRoot, codeHash.
- **Tx journey (9 steps)**: DApp invokes → JSON-RPC → mempool → EVM validates → gossip → block producer → bundle → broadcast → re-execute → finalized.
- **Ethash**: seed per epoch, 16 MB cache, DAG ~1 GB, epoch = 30,000 blocks (~125h). **Merge: 15 Sep 2022**.

### Slide 025 — Solidity By Example
- **Primitives**: `bool`, `uint8..uint256` (alias `uint`), `int8..int256`, `address` (20B), `bytes1..bytes32`, `bytes`, `string`.
- **Variables**: **local** (function-scoped), **state** (on chain), **global** (`msg.sender`, `block.timestamp`).
- **`constant`** vs **`immutable`** (constructor-assignable).
- **`view`** = free off-chain; writing requires tx.
- **Ether units**: `1 wei`, `1 gwei = 10⁹ wei`, `1 ether = 10¹⁸ wei`.
- **Gas**: `fee = gas spent × gas price`. Out-of-gas → revert, gas **NOT refunded**.
- **Mappings**: `mapping(key => value)`. **Not iterable**; unset = default.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract Counter {
    uint256 public count;
    function get() public view returns (uint256) { return count; }
    function inc() public { count += 1; }
    function dec() public { count -= 1; }
}
```

### Slide 026 — Smart Contracts Practice
- **Visibility**: `public`, `private`, `internal`, `external`.
- **Mutability**: `view` (no state change), `pure` (no state read), `payable` (receives ETH).
- **`require(cond, "msg")`** = check+revert (refunds remaining gas).
- **`emit Event(...)`** logs to receipt; `indexed` params searchable.
- **`msg.sender`** = caller; **`msg.value`** = ETH sent.

```solidity
contract SimpleStorage {
    uint256 private storedValue;
    event ValueChanged(address indexed by, uint256 newValue);
    function set(uint256 _v) public {
        storedValue = _v;
        emit ValueChanged(msg.sender, _v);
    }
    function get() public view returns (uint256) { return storedValue; }
}
```

### Slide 027 — Ethereum PoS
- **Stake = 32 ETH**. Slashing for dishonesty.
- **Clients**: Consensus (Prysm, Lighthouse, Teku, Nimbus, Lodestar), Execution (Geth, Nethermind, Besu, Erigon), Validator.
- **Gasper = LMD-GHOST (fork choice) + Casper FFG (finality)**.
- **Slot = 12 s**, **Epoch = 32 slots ≈ 6.4 min**, finality ~12.8 min.
- **RANDAO** = decentralized randomness.
- **BLS** signature aggregation.
- **Rewards**: attestation, proposer, sync committee. **Base fee burned** (EIP-1559).
- **Slashable**: equivocation/double voting; surround voting. Slashing ~1/32 ETH + forced exit.

### Slide 028 — Solana
- Anatoly Yakovenko 2017, mainnet 2020.
- **TPS** ~65,000.
- **Hardware**: 256 GB RAM, 12-core CPU.
- **~1,240 validators**; **superminority** = 21 controlling >33%.
- **PoH**: SHA-256 hash chain.
- **Tower BFT**: ~66% approval.
- **Stack**: **Sealevel** (parallel runtime), **Gulf Stream** (mempool-less forwarding), **Turbine** (block propagation).
- **Upgrades**: **Firedancer** (Jump Crypto validator client), **Alpenglow** (~100–150 ms finality target).

### Slide 029 — Polkadot
- "**Blockchain of blockchains**" — Gavin Wood, Web3 Foundation. ICO 2017, genesis 2020.
- **Components**: **Relay Chain** (NPoS), **Parachains**, **Bridges** (XCM).
- **DOT functions**: governance, staking, bonding (parachain slot auctions ~2 years).
- **NPoS roles**:

| Role | Function |
|---|---|
| **Validators** | Secure Relay Chain, validate parachain tx |
| **Nominators** | Stake DOT backing validators |
| **Collators** | Manage parachain tx, submit candidates |
| **Fishermen** | Monitor and report misconduct |

- **Hybrid consensus**: **BABE** (production) + **GRANDPA** (finality).
- Advantages: interoperability, scalability, shared security, **forkless upgrades**.

### PoW vs PoS Comparison

| Aspect | PoW | PoS |
|---|---|---|
| Security cost | Electricity + ASIC/GPU | Staked collateral (32 ETH) |
| Block time | ~10 min (BTC), ~15s (ETH-Ethash) | 12 s (ETH); sub-sec (Solana) |
| Finality | Probabilistic | Economic (~12.8 min ETH) |
| Energy | Very high | Very low |
| Attack | 51% hashpower | 33%/66% stake + slashing |
| Hardware | ASICs/GPUs | Commodity / specialized |

---

## Part 3: Rapid Recall Quiz

**Q1.** In Bitcoin's PoW, what happens when `difficulty_bits` increases by 1?
A. Target doubles, mining time halves
B. Target halves, mining time doubles
C. Target unchanged
D. Difficulty retargets immediately

**Q2.** Which is TRUE about Ethereum accounts?
A. Contract accounts can initiate transactions
B. EOAs have a `codeHash` of their bytecode
C. EOAs initiate; contracts only execute when called
D. Both have empty `storageRoot`

**Q3.** In Gasper, which pair is correct?
A. LMD-GHOST = finality; Casper FFG = fork choice
B. LMD-GHOST = fork choice; Casper FFG = finality
C. RANDAO = finality; BLS = fork choice
D. Tower BFT = fork choice; Ethash = finality

**Q4.** Calling a Solidity `view` function via `eth_call`:
A. Costs gas like a write
B. Reverts
C. Is free
D. Requires owner

**Q5.** Solana's Proof of History:
A. Provides consensus alone
B. Cryptographic clock; consensus = PoS + Tower BFT
C. Replaces SHA-256
D. Requires every validator timestamp per tx

**Q6.** In Polkadot NPoS, who submits parachain tx candidates to Relay Chain?
A. Nominators  B. Fishermen  C. Validators  D. Collators

### Answer Key
1. **B** — one more bit halves target, doubles work.
2. **C**.
3. **B** — Gasper = LMD-GHOST (fork choice) + Casper FFG (finality).
4. **C** — `view` reads state; `eth_call` is free off-chain.
5. **B**.
6. **D** — Collators.
