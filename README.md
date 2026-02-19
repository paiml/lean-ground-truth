<p align="center">
  <img src=".github/lean-hero.svg" width="800" alt="lean-ground-truth">
</p>

<h1 align="center">lean-ground-truth</h1>

<p align="center">
  <strong>Lean 4 Proof Quality Verification Corpus</strong>
</p>

<p align="center">
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License">
  </a>
  <a href="https://lean-lang.org">
    <img src="https://img.shields.io/badge/Lean-4.15+-blue?logo=data:image/svg+xml;base64,PHN2Zy8+" alt="Lean 4">
  </a>
  <img src="https://img.shields.io/badge/PMAT-A%20(91.9%25)-brightgreen" alt="PMAT Score">
  <img src="https://img.shields.io/badge/proofs-88%25%20complete-blue" alt="Proof Completeness">
</p>

A ground-truth Lean 4 corpus for validating [PMAT](https://github.com/paiml/paiml-mcp-agent-toolkit)'s proof quality verification pipeline. Contains theorems, lemmas, structures, and intentional `sorry` markers for Popperian falsification testing.

---

## Table of Contents

- [Overview](#overview)
- [PMAT Quality Metrics](#pmat-quality-metrics)
- [Project Structure](#project-structure)
- [Proof Modules](#proof-modules)
- [PMAT Verification](#pmat-verification)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository is a **Popperian falsification corpus** — a carefully constructed test fixture that validates PMAT's Lean 4 analysis capabilities. Every theorem, lemma, and sorry marker exists to exercise a specific code path in PMAT's analysis pipeline.

### What PMAT Validates Against This Corpus

| Capability | Test Target |
|-----------|-------------|
| AST Extraction | `def`, `theorem`, `lemma`, `structure`, `class`, `inductive`, `abbrev`, `axiom`, `opaque`, `instance`, `namespace` |
| Sorry Detection | 3 intentional `sorry` markers in `Incomplete.lean` |
| Proof Completeness | `(theorems - sorrys) / theorems` ratio = ~88% |
| Project Detection | `lakefile.lean` + `lean-toolchain` identification |
| CB-1050 Compliance | Block comment vs theorem disambiguation |
| CB-1052 Compliance | Sorry ratio threshold checking (< 20%) |
| Formal Verification Score | 14.7/16 (91.9%) for pure Lean projects |

## PMAT Quality Metrics

| Metric | Value |
|--------|-------|
| PMAT Grade | **A** (91.9%) |
| Formal Verification | 14.7/16 |
| Modules | 4 |
| Theorems/Lemmas | 25+ |
| Sorrys (intentional) | 3 |
| Proof Completeness | ~88% |
| Structures | 3 |
| Inductive Types | 1 |

## Project Structure

```
lean-ground-truth/
  lakefile.lean              # Lake build configuration
  lean-toolchain             # Lean version pinning
  lib/
    GroundTruth.lean         # Top-level module imports
    GroundTruth/
      Basic.lean             # Boolean logic, pairs, function composition
      Nat.lean               # Natural number arithmetic proofs
      List.lean              # List properties, binary trees
      Incomplete.lean        # Intentional sorry markers (PMAT test target)
  spec/                      # Specification documents
  tests/                     # Test fixtures
```

## Proof Modules

### Basic.lean — Boolean Logic & Function Composition

Foundational proofs including:
- Boolean identity (`b && true = b`, `b || false = b`)
- De Morgan's laws
- Pair projections and swaps
- Function composition associativity

### Nat.lean — Natural Number Arithmetic

Inductive proofs over natural numbers:
- Commutativity and associativity of addition
- Distributivity of multiplication
- Zero identity proofs
- Successor lemmas

### List.lean — List Properties & Binary Trees

Structural proofs including:
- List append associativity
- Length preservation under reverse
- Map-filter commutativity
- Binary tree fold properties

### Incomplete.lean — Intentional Sorry Markers

Contains exactly **3 sorry markers** — these are the primary test targets for PMAT's `FormalProofVerification` falsification method. Each sorry represents an incomplete proof that PMAT must detect and report via CB-1050.

## PMAT Verification

```bash
# Compliance check (CB-1050 through CB-1053)
pmat comply check -p /path/to/lean-ground-truth

# Project quality score
pmat rust-project-score -p /path/to/lean-ground-truth

# Context generation with Lean AST
pmat context -p /path/to/lean-ground-truth

# Semantic search for theorems
pmat query "theorem" -p /path/to/lean-ground-truth

# Verify sorry detection
pmat query --literal "sorry" -p /path/to/lean-ground-truth
```

### Expected PMAT Output

- **CB-1050**: 3 errors (sorry markers in Incomplete.lean)
- **CB-1052**: Pass (sorry ratio 12% < 20% threshold)
- **CB-1053**: Pass (all theorems documented)
- **Formal Verification Score**: 14.7/16 (91.9%)

## Installation

### Prerequisites

- [Lean 4](https://lean-lang.org) (v4.15.0+)
- [Lake](https://github.com/leanprover/lake) build system (bundled with Lean)
- [PMAT](https://github.com/paiml/paiml-mcp-agent-toolkit) (v3.4.0+)

### Build

```bash
# Clone
git clone https://github.com/paiml/lean-ground-truth.git
cd lean-ground-truth

# Build with Lake
lake build

# Check all proofs (will report sorry markers in Incomplete.lean)
lake env lean lib/GroundTruth.lean
```

## Usage

This corpus is designed to be analyzed by PMAT, not used as a library. To use it as a test fixture:

```bash
# Run full PMAT analysis
pmat comply check -p . --verbose
pmat rust-project-score -p .

# Verify specific capabilities
pmat comply check -p . --failures-only  # Should show CB-1050 only
```

## Contributing

1. All changes directly on `master` branch
2. Run `lake build` to verify proofs compile
3. Run `pmat comply check -p .` before committing
4. Maintain exactly 3 sorry markers in `Incomplete.lean`

## License

MIT
