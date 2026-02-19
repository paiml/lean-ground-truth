/-!
# Natural Number Theorems

Verified properties of natural numbers for PMAT proof quality metrics.
-/

namespace GroundTruth.Nat

/-- Zero is a left identity for addition -/
theorem zero_add (n : Nat) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ n ih => simp [Nat.add_succ, ih]

/-- Zero is a right identity for addition -/
theorem add_zero (n : Nat) : n + 0 = n := by
  rfl

/-- Successor distributes over addition -/
theorem succ_add (m n : Nat) : Nat.succ m + n = Nat.succ (m + n) := by
  induction n with
  | zero => rfl
  | succ n ih => simp [Nat.add_succ, ih]

/-- Addition is commutative -/
theorem add_comm (m n : Nat) : m + n = n + m := by
  induction m with
  | zero => simp [zero_add]
  | succ m ih => simp [succ_add, Nat.add_succ, ih]

/-- Addition is associative -/
theorem add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  induction a with
  | zero => simp [zero_add]
  | succ a ih => simp [succ_add, ih]

/-- Multiplication by zero -/
theorem mul_zero (n : Nat) : n * 0 = 0 := by
  rfl

/-- Multiplication by successor -/
lemma mul_succ (m n : Nat) : m * Nat.succ n = m * n + m := by
  induction m with
  | zero => simp
  | succ m ih => simp [Nat.succ_mul, ih, Nat.add_assoc, Nat.add_comm n]

/-- Maximum of a number with itself is itself -/
theorem max_self (n : Nat) : max n n = n := by
  simp [Nat.max_def]

/-- Minimum of a number with itself is itself -/
theorem min_self (n : Nat) : min n n = n := by
  simp [Nat.min_def]

/-- n ≤ n + k for any k -/
theorem le_add_right (n k : Nat) : n ≤ n + k := by
  omega

end GroundTruth.Nat
