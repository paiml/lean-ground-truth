# Claude Code Configuration

## Purpose

This is a **ground truth corpus** for PMAT Lean 4 language support verification.

## Key Files

- `lib/GroundTruth/Incomplete.lean` — Contains 3 intentional `sorry` markers for falsification testing
- `lakefile.lean` — Project manifest (PMAT detection signal)
- `lean-toolchain` — Toolchain version (PMAT detection signal)

## Quality Metrics

- All proven theorems must remain proven (no regressions)
- `Incomplete.lean` sorry count must remain exactly 3
- No new sorry markers outside `Incomplete.lean`

## PMAT Integration

```bash
pmat context --path .
pmat query "theorem" --include-source
pmat query --literal "sorry" --count
```
