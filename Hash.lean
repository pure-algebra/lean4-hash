/-!
# `Hash` — proved hash functions in Lean 4

The public root of the `Hash` library. A consumer imports this module and
nothing else.

At S1 this root is empty: the package skeleton, its gates and its routers
exist, and no hash function has been moved into it yet. `Hash.Sha256` arrives
at S2 from `lean4-WHATWG-streams`, `Hash.Sha3` at S3 from foldlab's
`formal/fips202`, and the algorithm-indexed surface at S4.

The known-answer tests and the per-family axiom audits stay out of this
closure and are reached only through `Hash.Verified`, so a consumer never
elaborates them.
-/
