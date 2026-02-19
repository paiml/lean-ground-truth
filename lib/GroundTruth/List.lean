/-!
# List Theorems

Verified properties of lists for PMAT proof quality metrics.
-/

namespace GroundTruth.List

/-- Length of an empty list is zero -/
theorem length_nil : ([] : List α).length = 0 := by
  rfl

/-- Length of cons is successor of length -/
theorem length_cons (a : α) (l : List α) : (a :: l).length = l.length + 1 := by
  rfl

/-- Append with empty list is identity -/
theorem append_nil (l : List α) : l ++ [] = l := by
  induction l with
  | nil => rfl
  | cons h t ih => simp [ih]

/-- Empty list appended is identity -/
theorem nil_append (l : List α) : [] ++ l = l := by
  rfl

/-- Reverse of empty list is empty -/
theorem reverse_nil : ([] : List α).reverse = [] := by
  rfl

/-- Reverse of singleton is itself -/
theorem reverse_singleton (a : α) : [a].reverse = [a] := by
  rfl

/-- Map preserves length -/
theorem map_length (f : α → β) (l : List α) : (l.map f).length = l.length := by
  induction l with
  | nil => rfl
  | cons h t ih => simp [ih]

/-- Filter produces a sublist (length ≤ original) -/
theorem filter_length_le (p : α → Bool) (l : List α) :
    (l.filter p).length ≤ l.length := by
  induction l with
  | nil => simp
  | cons h t ih =>
    simp [List.filter]
    split <;> omega

/-- An inductive type for binary trees -/
inductive BinTree (α : Type) where
  | leaf : BinTree α
  | node : BinTree α → α → BinTree α → BinTree α

/-- Count nodes in a binary tree -/
def BinTree.size : BinTree α → Nat
  | .leaf => 0
  | .node l _ r => 1 + l.size + r.size

/-- Leaf has zero size -/
theorem BinTree.size_leaf : (BinTree.leaf : BinTree α).size = 0 := by
  rfl

end GroundTruth.List
