/-!
# Incomplete Proofs (Intentional)

This module contains intentional `sorry` markers for PMAT proof quality testing.
PMAT should detect these and report them in the formal proof verification check.

Expected metrics:
- Theorems: 5
- Sorrys: 3
- Proof completeness: 40% (2/5 proven)
-/

namespace GroundTruth.Incomplete

/-- This theorem is correctly proven -/
theorem one_plus_one : 1 + 1 = 2 := by
  rfl

/-- This theorem is correctly proven -/
theorem two_plus_two : 2 + 2 = 4 := by
  rfl

/-- INCOMPLETE: Goldbach-like claim, intentionally left unproven -/
theorem incomplete_claim_1 (n : Nat) : n + n = 2 * n := by
  sorry

/-- INCOMPLETE: Associativity variant, intentionally left unproven -/
theorem incomplete_claim_2 (a b c : Nat) : a * (b + c) = a * b + a * c := by
  sorry

/-- INCOMPLETE: Order property, intentionally left unproven -/
theorem incomplete_claim_3 (n : Nat) : 0 ≤ n := by
  sorry

end GroundTruth.Incomplete
