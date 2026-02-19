/-!
# Basic Definitions and Theorems

Ground truth module demonstrating fundamental Lean 4 constructs
for PMAT proof quality verification.
-/

namespace GroundTruth.Basic

/-- Identity function -/
def id' (α : Type) (a : α) : α := a

/-- Constant function -/
def const' (α β : Type) (a : α) (_b : β) : α := a

/-- Function composition -/
def compose (α β γ : Type) (g : β → γ) (f : α → β) (a : α) : γ := g (f a)

/-- Boolean negation is an involution -/
theorem not_not_eq (b : Bool) : (! (! b)) = b := by
  cases b <;> rfl

/-- True and anything is that thing -/
theorem true_and (b : Bool) : (true && b) = b := by
  cases b <;> rfl

/-- False or anything is that thing -/
theorem false_or (b : Bool) : (false || b) = b := by
  cases b <;> rfl

/-- And is commutative for booleans -/
theorem and_comm_bool (a b : Bool) : (a && b) = (b && a) := by
  cases a <;> cases b <;> rfl

/-- Or is commutative for booleans -/
theorem or_comm_bool (a b : Bool) : (a || b) = (b || a) := by
  cases a <;> cases b <;> rfl

/-- Simple structure for a pair -/
structure Pair (α β : Type) where
  fst : α
  snd : β

/-- Swap the components of a pair -/
def Pair.swap (p : Pair α β) : Pair β α :=
  ⟨p.snd, p.fst⟩

/-- Swapping twice returns the original -/
theorem Pair.swap_swap (p : Pair α β) : p.swap.swap = p := by
  cases p; rfl

end GroundTruth.Basic
