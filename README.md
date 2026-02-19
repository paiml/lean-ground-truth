# lean-ground-truth

Ground truth Lean 4 corpus for PMAT proof quality verification — theorems, lemmas, sorry detection, proof completeness metrics.

## PMAT Proof Quality Metrics

| Metric | Value |
|--------|-------|
| Modules | 4 |
| Theorems/Lemmas | 25+ |
| Sorrys (intentional) | 3 |
| Proof Completeness | ~88% |
| Structures | 3 |
| Inductive Types | 1 |

## Project Structure

```
lib/
  GroundTruth.lean          # Top-level imports
  GroundTruth/
    Basic.lean              # Boolean logic, pairs, function composition
    Nat.lean                # Natural number arithmetic proofs
    List.lean               # List properties, binary trees
    Incomplete.lean         # Intentional sorry markers (PMAT test target)
```

## Purpose

This repository serves as a **Popperian falsification corpus** for PMAT's Lean 4 language support:

1. **AST Extraction**: Validates that PMAT correctly extracts `def`, `theorem`, `lemma`, `structure`, `class`, `inductive`, `abbrev`, `axiom`, `opaque`, `instance`, and `namespace` declarations
2. **Sorry Detection**: The `Incomplete.lean` module contains 3 intentional `sorry` markers that PMAT's `FormalProofVerification` falsification method must detect
3. **Proof Completeness**: Validates the `(theorems - sorrys) / theorems` ratio calculation
4. **Project Detection**: Tests that PMAT correctly identifies Lean 4 projects via `lakefile.lean` and `lean-toolchain`

## PMAT Verification

```bash
# Run PMAT analysis on this corpus
pmat context --path /path/to/lean-ground-truth

# Check proof quality
pmat query "theorem" --path /path/to/lean-ground-truth

# Verify sorry detection
pmat query --literal "sorry" --path /path/to/lean-ground-truth
```

## Requirements

- Lean 4 (v4.15.0+)
- Lake build system

```bash
# Build
lake build

# Check all proofs (will fail on Incomplete.lean sorry markers)
lake env lean lib/GroundTruth.lean
```

## License

MIT
