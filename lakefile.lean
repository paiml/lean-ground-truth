import Lake
open Lake DSL

package «lean-ground-truth» where
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib «GroundTruth» where
  srcDir := "lib"
